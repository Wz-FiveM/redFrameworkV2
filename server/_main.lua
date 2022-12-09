--[[
  This file is part of Red Framework V2.
  Created at 01/12/2022 19:55
  
  Copyright (c) Red Framework V2 - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Server
_Server = {}
_Server.Players = {}
_Server.Jobs = {}
_Server.Items = {}
_Server.ItemsList = {}
_Server.GroupList = {}

exports('getObjects', function()
    return (_Server)
end)

RegisterNetEvent('framework:playerSpawned', function()
    local serverId = source
    local identifier = _Server.getIdentifier(serverId)
    local file = io.open(("resources/%s/data/players.json"):format(GetCurrentResourceName()), "r")
    local data = json.decode(file:read("*a"))
    if (not (data[identifier])) then
        data[identifier] = {
            identifier = identifier,
            job = "unemployed",
            grade = "unemployed",
            inventory = {},
            group = "user",
            cash = _Config.accounts.cash,
            bank = _Config.accounts.bank,
            blackMoney = _Config.accounts.black_money,
            position = json.encode(vector3(-117.07, -604.37, 36.28)),
            skin = json.encode(_Config.baseSkin)
        }
        file:close()
        local file = io.open(("resources/%s/data/players.json"):format(GetCurrentResourceName()), "w")
        file:write(json.encode(data, {indent = true}))
        file:close()
        _Player.createPlayer(serverId, identifier, {}, "unemployed", "unemployed", "user", 0, 0, 0, json.encode(vector3(-117.07, -604.37, 36.28)), json.encode(_Config.baseSkin))
        return
    end
    _Player.createPlayer(serverId, identifier, data[identifier].inventory, data[identifier].job, data[identifier].grade, data[identifier].group, data[identifier].cash, data[identifier].bank, data[identifier].blackMoney, data[identifier].position, data[identifier].skin)
end)

RegisterNetEvent("skin:save", function(skin)
    local src= source
    local player = _Player.getPlayer(src)
    player.skin = skin
    player.save()
end)