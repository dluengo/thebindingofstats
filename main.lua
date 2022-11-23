local json = require("json")
require("items")

BOI_VERSION = 1
MOD_NAME = "The Binding of Stats"

mod = RegisterMod(MOD_NAME, BOI_VERSION)
mod.need_init = true

-- Determines whether an item, given by its id, is passive or not.
function mod:__isPassiveItem(id)
    local item_config = Isaac.GetItemConfig():GetCollectible(id)

    -- For some reason there is a separate type for familiars (i.e. cube of
    -- meat, brother bobby, dark bum...). So we need to check if the item is
    -- passive or a familiar.
    if item_config.Type == ItemType.ITEM_PASSIVE or
        item_config.Type == ItemType.ITEM_FAMILIAR then
        return true
    end

    return false
end

-- Creates and return a table with the collected passive items of the first
-- character. The table contain strings with the names of the items. Check file
-- items.lua to know more.
function mod:__getPassiveItems()
    collected_items = {}
    for i = ITEM_FIRST_ID, ITEM_LAST_ID do
        if Isaac.GetPlayer():HasCollectible(i) and mod:__isPassiveItem(i) then
            collected_items[#collected_items + 1] = getItemNameById(i)
        end
    end

    return collected_items
end

-- This sucks a bit. I wanted to put this code in a function as it is used
-- twice. The goal of it was double, compute the heart modifier (the letter)
-- and update the remaining amount of red hp to be computed. Sadly Lua does
-- not support input/output parameters, procedures, parameter passing by
-- reference... call it whatever you want, the idea remains, being able to
-- modify the parameters of a function. So here we make a trick, we return
-- a table with 2 elements, in position one the letter, in position two the
-- remaining HP, the caller of this function most likely will want to update
-- some variable with their remaining HP.
function mod:__computeRedHP(hp)
    res = {}

    if hp > 1 then
        res[1] = "f"
        res[2] = hp - 2
    elseif red_hp == 1 then
        res[1] = "h"
        res[2] = hp - 1
    else
        res[1] = "e"
        res[2] = hp
    end

    return res
end

-- Compute the first character's HP and returns a string encoding it.
--
-- Encoding:
--  The general format is (regex): <H>[<HM>]*
--   <H> ::= R: Red heart container
--           S: Soul heart
--           B: Black heart
--           O: bOne heart
--
--   <HM> ::= f: full heart
--          | h: half heart
--          | e: empty heart
--
--  Example:
--   RfRfRfSBOhBOe: 3 full red hearts, 1 soul heart, 1 black heart, 1 bone heart
--                  half-filled, 1 black heart and 1 bone heart empty.
--
-- TODO: Still no support for eternal, rotten, golden hearts or other sort of HP
-- like coins (the keeper) on no HP (the lost).
function mod:__getCurrentHP()
    hp_str = ""
    local player = Isaac.GetPlayer()

    -- Get the number of red-heart containers.
    local red_containers = player:GetMaxHearts() / 2

    -- Get the number of red health.
    local red_hp = player:GetHearts()

    -- Iterate over the red-heart containers adding its letter to the resulting
    -- string and computing also how full they are.
    while red_containers > 0 do
        hp_str = hp_str .. "R"

        hp_table = mod:__computeRedHP(red_hp)
        hp_str = hp_str .. hp_table[1]
        red_hp = hp_table[2]

        red_containers = red_containers - 1
    end

    local IS_BLACK = 0x1

    -- This is a bit cumbersome, it is a bit of weird API.
    --
    -- At this point the red hearts are already computed and included in the
    -- resulting string. Now we need to compute soul/black/bone hearts.
    
    -- This calculate the number of soul and black hearts (misleading name)
    local s_b_hearts = player:GetSoulHearts() / 2
    local bone_hearts = player:GetBoneHearts()

    -- This returns a mask that indicate the position of black hearts (check
    -- its documentation for further knowledge).
    local s_b_mask = player:GetBlackHearts()
    local total_hearts = s_b_hearts + bone_hearts

    for i = 0, total_hearts-1 do

        -- Check what kind of heart this is
        if player:IsBoneHeart(i) then
            hp_str = hp_str .. "O"

            hp_table = mod:__computeRedHP(red_hp)
            hp_str = hp_str .. hp_table[1]
            red_hp = hp_table[2]

        elseif IS_BLACK & s_b_mask ~= 0 then
            hp_str = hp_str .. "B"
            s_b_mask = s_b_mask >> 1

        else
            hp_str = hp_str .. "S"
            s_b_mask = s_b_mask >> 1
        end
    end

    return hp_str
end

-- Called the first time a game starts to initialize the mod.
function mod:initMod()
    -- Load the file where a previous data was stored or create the table.
    if mod:HasData() then
        self.store = json.decode(mod:LoadData())
    else
        self.store = {{"Seed", "Character", "HP", "Speed", "Damage", "Tears", "Active Item", "Passive Items"}}
    end
end

-- This is how the game calculates the tear fire rate.
function mod:__computeTearDelay(trs)
    return 30 / (trs + 1)
end

-- Called when a game starts or is continued.
function mod:onGameStarted(isContinued)
    -- If this is the first time calling this function initialize the mod.
    if self.need_init then
        mod:initMod()
        self.need_init = false
    end

    -- We are just interested on saving the statistics at the start of a game.
    if not isContinued then
        local player = Isaac.GetPlayer()
        local seed = Game():GetSeeds():GetStartSeedString()
        local char = player:GetName()
        local hp = mod:__getCurrentHP()
        local spd = string.format("%.2f", player.MoveSpeed)
        local dmg = string.format("%.2f", player.Damage)
        local trs = string.format("%.2f", mod:__computeTearDelay(player.MaxFireDelay))
        local a_item = getItemNameById(player:GetActiveItem())
        local p_items = mod:__getPassiveItems()

        self.store[#self.store + 1] = {seed, char, hp, spd, dmg, trs, a_item, p_items}
    end
end

-- Called when the Isaac application is about to exit. Stores the statistics
-- in a JSON object under <ISAAC_INSTALL_FOLDER>/data/<MOD_NAME>/save<N>.
function mod:onGameExit(isGameOver)
    mod:SaveData(json.encode(self.store))
end

-- I use this function as a quick way to check if the mod loaded or not by
-- printing "Loaded" somewhere on the screen.
function mod:onRender()
    Isaac.RenderText("Loaded", 100, 100, 255, 0, 0, 255)
end

-- Entry point

mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.onGameStarted)
mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, mod.onGameExit)
--mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.onRender)

