--[[
  This file is part of Red Framework V2.
  Created at 01/12/2022 19:44
  
  Copyright (c) Red Framework V2 - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Player
---@field public serverId number
---@field public identifier string
---@field public inventory _Inventory
---@field public job _Job
---@field public grade string
---@field public group string
---@field public accounts _Accounts
_Player = {}

function _Player.createPlayer(serverId, identifier, inventory, job, grade, group, cash, bank, blackMoney, position, skin)
    local self = {}
    self.serverId = serverId
    self.identifier = identifier
    self.inventory = _Inventory.load(inventory)
    self.job = _Job.load(job, grade)
    self.jobName = job
    self.jobGrade = grade
    self.group = group
    self.accounts = _Accounts.load(cash, bank, blackMoney)
    self.skin = json.decode(skin)
    self.position = position
    self.canInteractWithServer = true
    if (_Group.exist(group)) then
        self.group = _Group.load(group)
    else
        self.group = _Group.load("user")
    end
    self.serverResponse = function()
        self.canInteractWithServer = true
        TriggerClientEvent('framework:serverResponse', self.serverId)
        return (true)
    end
    ---@return _Inventory
    self.getInventory = function()
        return (self.inventory)
    end
    ---getJob
    ---@return _Job
    self.getJob = function()
        return (self.job)
    end
    ---getAccounts
    ---@return _Accounts
    self.getAccounts = function()
        return (self.accounts)
    end
    ---getGroup
    ---@return _Group
    self.getGroup = function()
        return (self.group)
     end
    self.save = function()
        local file = io.open(("resources/%s/data/players.json"):format(GetCurrentResourceName()), "r")
        local data = json.decode(file:read("*a"))
        file:close()
        data[self.identifier] = {
            inventory = self.getInventory().data,
            job = self.jobName,
            grade = self.jobGrade,
            cash = self.getAccounts().getCash(),
            bank = self.getAccounts().getBank(),
            blackMoney = self.getAccounts().getBlackMoney(),
            position = json.encode(GetEntityCoords(GetPlayerPed(self.serverId))),
            skin = json.encode(self.skin),
            group = self.getGroup().name
        }
        local file = io.open(("resources/%s/data/players.json"):format(GetCurrentResourceName()), "w")
        file:write(json.encode(data, {indent = true}))
        file:close()
    end
    self.getGroup = function()
        return (self.group)
    end
    TriggerClientEvent('framework:receivePlayerData', self.serverId, {
        inventory = self.inventory,
        job = self.job,
        grade = self.jobGrade,
        canInteractWithServer = self.canInteractWithServer,
        serverId = self.serverId,
        accounts = self.accounts,
        position = json.decode(self.position),
        group = self.group,
        skin = self.skin
    })
    _Server.makeTrace("Player (".. self.serverId ..") " .. self.identifier .. " has been loaded", "info")
    _Server.Players[self.serverId] = self
    return (self)
end