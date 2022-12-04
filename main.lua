local json = require("json")
require("table_to_string")
require("runstats")

local MOD_NAME = "The Stats of Isaac"
local data = nil

function initMod(mod)
end

function onGameStarts(isContinue)
    -- For some reason trying to load the data in initMod() results in function
    -- mod:HasData() returning false, so as a workaround we do this here.
    if data == nil then
        if mod:HasData() then
            data = json.decode(mod:LoadData())
        else
            data = {RUNSTATS_HEADER}
        end
    end

    local rs = RunStats:new()
    rs:GetStatsFromGame(Game())

    data[#data+1] = rs:GetRunValuesAsTable()
end

function onGameExists()
    mod:SaveData(json.encode(data))
end


mod = RegisterMod(MOD_NAME, 1)
initMod(mod)

mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, onGameStarts)
mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, onGameExists)

