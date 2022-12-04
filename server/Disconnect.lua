--[[
  This file is part of Amaya.
  Created at 04/12/2022 18:54
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

AddEventHandler("playerDropped", function()
    local _source = source
    if _Players[_source] then
        _Players[_source].save()
    end
end)