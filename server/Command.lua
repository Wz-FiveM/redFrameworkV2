--[[
  This file is part of Amaya.
  Created at 03/12/2022 14:56
  
  Copyright (c) Amaya - All Rights Reserved
  
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
            if (_Server.getPlayer(source).getGroup() == "user") then
                _Server.makeTrace("You don't have permission to use this command", "error")
                return
            end
            callback()
        end
        callback()
    end)
end