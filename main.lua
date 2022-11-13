local json = require("json")
require("items")

BOI_VERSION = 1
MOD_NAME = "The Binding of Stats"

local mod = RegisterMod(MOD_NAME, BOI_VERSION)
mod.need_init = true

function mod:__getPassiveItems()
    collected_items = {}
    for i = ITEM_FIRST_ID, ITEM_LAST_ID do
        if Isaac.GetPlayer():HasCollectible(i) then
            if Isaac.GetItemConfig():GetCollectible(i).Type == ItemType.ITEM_PASSIVE then
                collected_items[#items_table + 1] = getItemNameById(i)
            end
        end
    end

    return collected_items
end

-- This needs improvement
--[[
function mod:__getCurrentHP()
    hearts_table = {}
    red_heart_container_count = Isaac.GetPlayer():GetMaxHearts() / 2 
    red_heart_container_count -= Isaac.GetPlayer():GetBoneHearts()
    red_hp_count = Isaac.GetPlayer():GetHearts

    -- Count the red heart containers
    for i = 1, red_heart_container_count do
        if red_hp_count > 1 then
            hearts_table[i] = {"red", "full"}
            red_hp_count -= 2
        elseif red_hp_count == 1 then
            hearts_table[i] = {"red", "half"}
            red_hp_count -= 1
        else
            hearts_table[i] = {"red", "empty"}
        end

        

    end
end
--]]

function mod:onGameStarted(isContinued)
    if self.need_init then
        mod:initMod()
        self.need_init = false
    end

    -- New run
    if not isContinued then
        local seed = Game():GetSeeds():GetStartSeedString()
--        local hp = mod:__getCurrentHP()
        local a_item = getItemNameById(Isaac.GetPlayer():GetActiveItem())
        local p_items = mod:__getPassiveItems()
        self.store[#self.store + 1] = {seed, a_item, p_items}
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
--mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.onRender)

