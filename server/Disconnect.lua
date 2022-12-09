--[[
  This file is part of Red Framework V2.
  Created at 04/12/2022 18:54
  
  Copyright (c) Red Framework V2 - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

AddEventHandler("playerDropped", function()
    local _source = source
    local player = _Player.getPlayer(_source)
    player.save()
    _Server.makeTrace("Player ("..player.name..") disconnected", "info")
end)