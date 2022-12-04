require("table_to_string")
require("items")

RUNSTATS_HEADER = {
    "Seed",
    "Character",
    "HP",
    "Speed",
    "Damage",
    "Tears",
    "Luck",
    "Passive Items",
    "Active Item",
    "Trinket",
    "Coins",
    "Bombs",
    "Keys",
    "Survived?",
    "Boss",
    "Challenge?"
}

RunStats = {
    seed = "",
    char_name = "",
    hp = "",
    init_speed = 0,
    init_damage = 0,
    init_tears = 0,
    init_luck = 0,
    init_passive_items = {},
    init_active_item = "",
    init_trinket = "",
    coins = 0,
    bombs = 0,
    keys = 0,
    survived = false,
    last_boss = "",
    is_challenge = false,
}

function RunStats:new(obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function RunStats:GetStatsFromGame(game)
    local player = game:GetPlayer(0)

    self.seed = game:GetSeeds():GetStartSeedString()
    self.char_name = player:GetName()
    self.hp = self:__computeHP(game)
    self.init_speed = string.format("%.2f", player.MoveSpeed)
    self.init_damage = string.format("%.2f", player.Damage)
    self.init_tears = string.format("%.2f", self:__computeTears(player.MaxFireDelay))
    self.init_luck = string.format("%.2f", player.Luck)
    self.init_passive_items = self:__computePassiveItems(player)
    self.init_active_item = Items:GetItemNameById(player:GetActiveItem())
    self.init_trinket = Trinkets:GetTrinketNameById(player:GetTrinket(0))
    self.coins = player:GetNumCoins()
    self.bombs = player:GetNumBombs()
    self.keys = player:GetNumKeys()

    if game.Challenge == Challenge.CHALLENGE_NULL then
        self.is_challenge = false
    else
        self.is_challenge = true
    end
end

function RunStats:GetEndRunStatsFromGame(game, isGameOver)
    if isGameOver then
        self.survived = false
    else
        self.survived = true
        -- TODO: Implement logic to get the last boss killed
        self.last_boss = ""
    end
end

function RunStats:GetRunValuesAsTable()
    return {
        self.seed,
        self.char_name,
        self.hp,
        self.init_speed,
        self.init_damage,
        self.init_tears,
        self.init_luck,
        self.init_passive_items,
        self.init_active_item,
        self.init_trinket,
        self.coins,
        self.bombs,
        self.keys,
        self.survived,
        self.last_boss,
        self.is_challenge
    }
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
-- like coins (the keeper) or no HP (the lost).
function RunStats:__computeHP(game)
    local IS_BLACK = 0x1
    local hp_str = ""
    local player = game:GetPlayer(0)

    -- Get the number of red-heart containers.
    local red_containers = player:GetMaxHearts() / 2

    -- Get the amount of red health.
    local red_hp = player:GetHearts()

    -- Iterate over the red-heart containers adding its letter to the resulting
    -- string and computing also how full they are.
    while red_containers > 0 do
        hp_str = hp_str .. "R"

        local hp_table = RunStats:__computeRedHP(red_hp)
        hp_str = hp_str .. hp_table[1]
        red_hp = hp_table[2]

        red_containers = red_containers - 1
    end

    -- At this point the red hearts are already computed and included in the
    -- resulting string. Now we need to compute soul/black/bone hearts.

    -- This calculates the number of soul and black hearts (misleading name)
    local s_b_hearts = player:GetSoulHearts() / 2

    -- Get the number of bone-heart containers
    local bone_hearts = player:GetBoneHearts()

    -- This returns a mask that indicate the position of black hearts (check
    -- its documentation for further knowledge).
    local s_b_mask = player:GetBlackHearts()
    local total_hearts = s_b_hearts + bone_hearts

    for i = 0, total_hearts-1 do

        -- Check what kind of heart this is
        if player:IsBoneHeart(i) then
            hp_str = hp_str .. "O"

            local hp_table = RunStats:__computeRedHP(red_hp)
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

-- This sucks a bit. I wanted to put this code in a function as it is used
-- twice. The goal of it was double, compute the heart modifier (the letter)
-- and update the remaining amount of red hp to be computed. Sadly Lua does
-- not support input/output parameters, procedures, parameter passing by
-- reference... call it whatever you want, the idea remains, being able to
-- modify the parameters of a function. So here we make a trick, we return
-- a table with 2 elements, in position one the letter, in position two the
-- remaining HP, the caller of this function most likely will want to update
-- some variable with the remaining HP.
function RunStats:__computeRedHP(hp)
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

function RunStats:__computeTears(tears)
    return 30 / (tears + 1)
end

-- Creates and return a table with the collected passive items of the character.
-- The table contain strings with the names of the items.
function RunStats:__computePassiveItems(player)
    local collected_items = {}

    for i = 0, CollectibleType.NUM_COLLECTIBLES - 1 do
        if player:HasCollectible(i, true) and Items:IsPassiveItem(i) then
            collected_items[#collected_items + 1] = Items:GetItemNameById(i)
        end
    end

    return collected_items
end

