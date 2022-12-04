--[[
  This file is part of Amaya.
  Created at 04/12/2022 18:53
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(_Server.getAllPlayers()) do
            v.save()
            print("^2[INFO] ^7Player ^2" .. GetPlayerName(v.serverId) .. " ^7saved.")
        end
    end
end)