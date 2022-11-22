local json = require("json")
require("items")

BOI_VERSION = 1
MOD_NAME = "The Binding of Stats"

mod = RegisterMod(MOD_NAME, BOI_VERSION)
mod.need_init = true

function mod:__isPassiveItem(id)
    local item_config = Isaac.GetItemConfig():GetCollectible(id)

    if item_config.Type == ItemType.ITEM_PASSIVE or
        item_config.Type == ItemType.ITEM_FAMILIAR then
        return true
    end

    return false
end

function mod:__getPassiveItems()
    collected_items = {}
    for i = ITEM_FIRST_ID, ITEM_LAST_ID do
        if Isaac.GetPlayer():HasCollectible(i) and mod:__isPassiveItem(i) then
            collected_items[#collected_items + 1] = getItemNameById(i)
        end
    end

    return collected_items
end

function mod:__getCurrentHP()
    hp_str = ""
    local player = Isaac.GetPlayer()

    local red_containers = player:GetMaxHearts() / 2
    local red_hp = player:GetHearts()

    while red_containers > 0 do
        hp_str = hp_str .. "R"

        if red_hp > 1 then
            hp_str = hp_str .. "f"
            red_hp = red_hp - 2
        elseif red_hp == 1 then
            hp_str = hp_str .. "h"
            red_hp = 0
        else
            hp_str = hp_str .. "e"
        end

        red_containers = red_containers - 1
    end

    local IS_BLACK = 0x1

    local s_b_hearts = player:GetSoulHearts() / 2
    local bone_hearts = player:GetBoneHearts()
    local s_b_mask = player:GetBlackHearts()
    local total_hearts = s_b_hearts + bone_hearts
    for i = 0, total_hearts-1 do
        if player:IsBoneHeart(i) then
            hp_str = hp_str .. "O"

            if red_hp > 1 then
                hp_str = hp_str .. "f"
                red_hp = red_hp - 2
            elseif red_hp == 1 then
                hp_str = hp_str .. "h"
                red_hp = 0
            else
                hp_str = hp_str .. "e"
            end

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

function mod:onGameStarted(isContinued)
    if self.need_init then
        mod:initMod()
        self.need_init = false
    end

    if not isContinued then
        local seed = Game():GetSeeds():GetStartSeedString()
        local char = Isaac.GetPlayer():GetName()
        local hp = mod:__getCurrentHP()
        local a_item = getItemNameById(Isaac.GetPlayer():GetActiveItem())
        local p_items = mod:__getPassiveItems()
        self.store[#self.store + 1] = {seed, char, hp, a_item, p_items}
    end
end

function mod:onGameExit(isGameOver)
    mod:SaveData(json.encode(self.store))
end

function mod:onRender()
    Isaac.RenderText("test", 100, 100, 255, 0, 0, 255)
end

function mod:initMod()
    if mod:HasData() then
        self.store = json.decode(mod:LoadData())
    else
        self.store = {{"Seed", "Active Item", "Passive Items"}}
    end
end

-- Entry point

mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.onGameStarted)
mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, mod.onGameExit)
mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.onRender)

