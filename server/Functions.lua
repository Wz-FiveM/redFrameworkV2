--[[
  This file is part of Amaya.
  Created at 01/12/2022 19.58
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

function _Server.getIdentifier(serverId)
    for k, v in ipairs(GetPlayerIdentifiers(serverId)) do
        if string.match(v, 'license.') then
            local identifier = string.gsub(v, 'license.', '')
            return identifier
        end
    end
end

function _Server.makeTrace(message, type)
    if (type == "error") then
        print("^1[ERROR] ^7" .. message)
    elseif (type == "warning") then
        print("^3[WARNING] ^7" .. message)
    elseif (type == "info") then
        print("^2[INFO] ^7" .. message)
    else
        print("[TRACE] " .. message)
    end
end

function _Server.getPlayer(serverId)
    if (serverId == nil) then return (false) end
    return (_Server.Players[serverId])
end

function _Server.getAllPlayers()
    return (_Server.Players)
end