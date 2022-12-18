--[[
  This file is part of Red Framework V2.
  Created at 03/12/2022 15:07
  
  Copyright (c) Red Framework V2 - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Client
_Client = {}

RegisterNetEvent('framework:receivePlayerData', function(data)
    _Client.Player = data
    _Client.Player.job.grade = data.grade
    SetEntityCoords(PlayerPedId(), data.position.x, data.position.y, data.position.z)
    _Client.loadSkin(data.skin)
end)

function _Client.getCash()
    return (_Client.Player.accounts.cash)
end

function _Client.getBank()
    return (_Client.Player.accounts.bank)
end

function _Client.getBlackMoney()
    return (_Client.Player.accounts.blackMoney)
end

function _Client.getJob()
    return (_Client.Player.job)
end

function _Client.getItemData(itemName)
    if (_Client.Player.itemList[itemName] == nil) then
        return (false)
    end
    return (_Client.Player.itemList[itemName])
end

function _Client.getInventory()
    return (_Client.Player.inventory)
end

RegisterNetEvent('framework:refreshItemList', function(data)
    _Client.Player.itemList = data
end)

RegisterNetEvent("redFramework:inventoryRefresh", function(data)
    _Client.Player.inventory = data
    print("Inventory refreshed")
end)

exports('getObjects', function()
    return (_Client)
end)