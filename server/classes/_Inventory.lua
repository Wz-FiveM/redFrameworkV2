--[[
  This file is part of Amaya.
  Created at 04/12/2022 10:57
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Inventory
_Inventory = {}

function _Inventory.load(inventoryData)
    local self = {}
    self.data = inventoryData or {}
    self.getInventory = function()
        return (self)
    end
    self.addItem = function(item, quantity, callback)
        if (not (_Item.getItem(item))) then
            if (callback) then
                callback(false)
            end
            return
        end
        if (not (self.data[item])) then
            self.data[item] = quantity
        else
            self.data[item] = self.data[item] + quantity
        end
        if (callback) then
            callback(true)
        end
    end
    self.removeItem = function(item, quantity, callback)
        if (not (_Item.getItem(item))) then
            if (callback) then
                callback(false)
            end
            return
        end
        if (not (self.data[item])) then
            return (false)
        end
        if (self.data[item] < quantity) then
            return (false)
        end
        self.data[item] = self.data[item] - quantity
        if (callback) then
            callback(true)
        end
    end
    self.getItemQuantity = function(item)
        if (not (_Item.getItem(item))) then
            return (false)
        end
        if (not (self.data[item])) then
            return (false)
        end
        return (self.data[item])
    end
    return (self)
end