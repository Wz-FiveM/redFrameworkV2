--[[
  This file is part of Red Framework V2.
  Created at 03/12/2022 14:56
  
  Copyright (c) Red Framework V2 - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---registerCommand
---@param name string
---@param callback function
---@param forStaff boolean
---@return void
---@public
function _Server.registerCommand(name, callback, forStaff)
    RegisterCommand(name, function(source, args)
        if (forStaff == true) then
            if (source == 0) then
                callback(source, args)
                return
            else
                ---@type _Player
                local player = _Server.getPlayer(source)
                ---@type _Group
                local group = player.getGroup()
                if (group.hasPermission("command."..name)) then
                    callback(source, args)
                    return
                else
                    player.makeNotification("You don't have permission to use this command", "error")
                end
            end
        end
        callback(source, args)
    end)
end