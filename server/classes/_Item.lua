--[[
  This file is part of Amaya.
  Created at 04/12/2022 14:49
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Item
---@field public id number
---@field public name string
---@field public label string
---@field public description string
---@field public weight number
---@field public callback function
_Item = {}

function _Item.new(name, label, description, weight, callback)
    local self = {}
    self.id = #_Server.Items + 1
    self.name = name
    self.label = label
    self.description = description
    self.weight = weight
    self.callback = callback
    _Server.Items[self.name] = self
end

function _Item.getItem(itemName)
    if (not (_Server.Items[itemName])) then
        return (false)
    end
    return (_Server.Items[itemName])
end

-- Default Item
_Item.new("bread", "Pain", "Morceau de pain", 1.0, function()
    local src = source
    local player = _Server.getPlayer(src)
    player.getInventory().removeItem("bread", 1, function(state)
        if (state) then
            player.save()
        end
    end)
end)