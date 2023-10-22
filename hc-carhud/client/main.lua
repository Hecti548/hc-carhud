local QBCore = exports['qb-core']:GetCoreObject()

local cruiser
local lastFuelUpdate = 0
local lastFuelCheck = {}

local function getFuelLevel(vehicle)
    local updateTick = GetGameTimer()
    if (updateTick - lastFuelUpdate) > 2000 then
        lastFuelUpdate = updateTick
        lastFuelCheck = math.floor(exports[Config.Fuel]:GetFuel(vehicle))
    end
    return lastFuelCheck
end


Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped, false)
		local sleep = true
		Citizen.Wait(0)
		if veh then
			sleep = false
			local fuel = GetVehicleFuelLevel(veh)
			local speed = GetEntitySpeed(veh)*3.6 -- Value in KM/H
			local gear = GetVehicleCurrentGear(veh)
			SendNUIMessage({
				isInCoche = veh;
				speed = speed;
				fuel = fuel;
				vidatexto = GetVehicleEngineHealth(veh),
				fueltexto = getFuelLevel(veh),
				gear = gear;
				vehicleCruiser = vehicleCruiser,
			})
		else
			SendNUIMessage({
				isInCoche = veh;
			})
		end
		if sleep then Citizen.Wait(500) end
	end
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)

		-- Vehicle Cruiser
		if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) and IsControlJustPressed(1, 243) and GetPedInVehicleSeat(vehicle, player) then
			
			local vehicleSpeedSource = GetEntitySpeed(vehicle)

			if vehicleCruiser == 'on' then
				vehicleCruiser = 'off'
				SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
				
			else
				vehicleCruiser = 'on'
				SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
			end
        end

	end
end)

--[[ local QBCore = exports['qb-core']:GetCoreObject()

local cruiser
local lastFuelUpdate = 0
local lastFuelCheck = {}

local function getFuelLevel(vehicle)
    local updateTick = GetGameTimer()
    if (updateTick - lastFuelUpdate) > 2000 then
        lastFuelUpdate = updateTick
        lastFuelCheck = math.floor(exports[Config.Fuel]:GetFuel(vehicle))
    end
    return lastFuelCheck
end


Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped, false)
		local sleep = true
		local vehicleSpeedSource = GetEntitySpeed(veh)
		Citizen.Wait(0)
		if veh then
			sleep = false
			local fuel = GetVehicleFuelLevel(veh)
			local speed 			
			if Config.vehicle.speedUnit == "kmh" then
				speed = math.ceil(vehicleSpeedSource * 3.6) -- km/h
			else
				speed = math.ceil(vehicleSpeedSource * 2.236936) -- mph
			end--GetEntitySpeed(veh)*3.6 -- Value in KM/H
			local gear = GetVehicleCurrentGear(veh)
			SendNUIMessage({
				isInCoche = veh;
				speed = speed;
				fuel = fuel;
				vidatexto = GetVehicleEngineHealth(veh),
				fueltexto = getFuelLevel(veh),
				gear = gear;
				vehicleCruiser = vehicleCruiser,
			})
		else
			SendNUIMessage({
				isInCoche = veh;
			})
		end
		if sleep then Citizen.Wait(500) end
	end
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)

		-- Vehicle Cruiser
		if IsPedInAnyVehicle(player, false) and GetIsVehicleEngineRunning(vehicle) and IsControlJustPressed(1, 243) and GetPedInVehicleSeat(vehicle, player) then
			
			local vehicleSpeedSource = GetEntitySpeed(vehicle)

			if vehicleCruiser == 'on' then
				vehicleCruiser = 'off'
				SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
				
			else
				vehicleCruiser = 'on'
				SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
			end
        end

	end
end)--]]