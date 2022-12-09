--[[
  This file is part of Amaya.
  Created at 01/12/2022 20:06
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

CreateThread(function()
  SetMaxWantedLevel(0)
  while (not NetworkIsSessionStarted()) do Wait(0) end
  ShutdownLoadingScreen()
  ShutdownLoadingScreenNui()
  local mod = GetHashKey("mp_m_freemode_01")
  RequestModel(mod)
  while not HasModelLoaded(mod) do Citizen.Wait(10) end
  SetPlayerModel(PlayerId(), mod)
  FreezeEntityPosition(PlayerPedId(), false)
  NetworkConcealPlayer(NetworkGetPlayerIndexFromPed(PlayerPedId()), false, 1)
  SetPedDefaultComponentVariation(PlayerPedId())
  SetEntityVisible(PlayerPedId(), true)
  TriggerServerEvent('framework:playerSpawned')
end)