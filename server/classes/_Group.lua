--[[
  This file is part of Amaya.
  Created at 09/12/2022 09:56
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Group
_Group = {}

---@param name string
---@return thread
function _Group.load(name)
    if (not (_Group.exist(name))) then
        return
    end
    local self = {}
    self.name = name
    self.permissions = _Group.getPermissions(name)
    self.addPermission = function(permission)
        if (not (self.permissions[permission])) then
            self.permissions[permission] = true
            _Group.save(self.name, self.permissions)
        end
    end
    self.removePermission = function(permission)
        if (self.permissions[permission]) then
            self.permissions[permission] = nil
            _Group.save(self.name, self.permissions)
        end
    end
    self.hasPermission = function(permission)
        if (self.permissions[permission]) then
            return (true)
        else
            return (false)
        end
    end
    self.setGroup = function(name)
        if (not (_Group.exist(name))) then
            return
        end
        self.name = name
        self.permissions = _Group.getPermissions(name)
    end
    return (self)
end

function _Group.loadAll()
    local file = io.open(("resources/%s/data/groups.json"):format(GetCurrentResourceName()), "r")
    local data = json.decode(file:read("*a"))
    file:close()
    for k, v in pairs(data) do
        _Server.GroupList[k] = v
        _Server.makeTrace("Group ("..v.label..") loaded", "info")
    end
end

---@param name string
---@return boolean
function _Group.exist(name)
    local file = io.open(("resources/%s/data/groups.json"):format(GetCurrentResourceName()), "r")
    local data = json.decode(file:read("*a"))
    file:close()
    if (data[name]) then
        return (true)
    end
    return (false)
end

---@param name string
---@return table
function _Group.getPermissions(name)
    if (not (_Group.exist(name))) then
        return
    end
    return (_Server.GroupList[name].permissions)
end

_Group.loadAll()