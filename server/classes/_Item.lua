--[[
  This file is part of Red Framework V2.
  Created at 04/12/2022 14:49
  
  Copyright (c) Red Framework V2 - All Rights Reserved
  
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
    _Server.Items = (self)
    _Server.ItemsList[self.name] = self
end

function _Item.getItem(itemName)
    if (not (_Server.ItemsList[itemName])) then
        return (false)
    end
    return (_Server.ItemsList[itemName])
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