--[[
  This file is part of Amaya.
  Created at 01/12/2022 19:42
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'Config.lua',
}

server_scripts {
    "server/_main.lua",
    "server/Functions.lua",
    "server/classes/*.lua",
    "server/Items.lua",
    "server/Job.lua",
    "server/Disconnect.lua",
    "server/StopResource.lua",
}

client_scripts {
    "client/_main.lua",
    "client/Player.lua",
    "client/Functions.lua",
    "client/Skin.lua",
}