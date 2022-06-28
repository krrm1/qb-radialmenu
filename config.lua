local QBCore = exports['arabcodingteam-core']:GetCoreObject()
local inGarage = false
local inDepots = false
local inJobGarage = false
local inGangGarage = false


rootMenuConfig =  {
    {
        id = "general",
        displayName = "General",
        icon = "#globe-europe",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not inlaststand and not isdead
        end,
        subMenus = {"general:givenum"}
    },
    {
        id = "House",
        displayName = "House",
        icon = "#globe-house",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not inlaststand and not isdead
        end,
        subMenus = {"houses:givehousekey", "houses:removehousekey", "houses:togglelock","houses:decoratehouse","houses:setstash","houses:setoutift","houses:setlogout"}
    },
    {
        id = "general:Actions",
        displayName = "Actions",
        icon = "#user",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not inlaststand and not isdead
        end,
        subMenus = {"actions:rob", "actions:sell", "actions:cuff", "actions:escort"},
    },
    {
        id = "vehicle",
        displayName = "Vehicle",
        icon = "#car",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)

        if IsAnyVehicleNearPoint(coords,2.0) and not IsPedInAnyVehicle(ped) then 
            local closestveh = GetClosestVehicle(coords, 2.0, 0, 231807) 
            if closestveh == 0 then closestveh = GetClosestVehicle(coords, 2.0, 0, 391551) end
            return not isdead and not inlaststand
        end
        end,
        subMenus = {"vehicle:putin", "vehicle:putout"},
    },
    {
        id = "general:vehicle",
        displayName = "Vehicle",
        icon = "#car",
        functionName = "veh:options",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not isdead and not inlaststand and IsPedInAnyVehicle(PlayerPedId(), true)
        end
    },
    {
        id = "ambulance:job",
        displayName = "Ambulance",
        icon = "#book-medical",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            if Player.job.name == 'ambulance' and Player.job.onduty then
            return not isdead and not inlaststand
            end
        end,
        subMenus = {"ambulance:statuscheck", "ambulance:revivep", "ambulance:treatwounds", "ambulance:escort"},
    },
    {
        id = "emsDead",
         displayName = "Emergency Call",
         icon = "#police-dead",
         functionName = "police:client:SendAmbulanceEmergencyAlert",
         enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            
            if inlaststand and Player.job.name == 'ambulance' then
             return true
            elseif isdead and Player.job.name == 'ambulance' then
             return true
            end
          end,
     },
    {
        id = "taxi:job",
        displayName = "Taxi",
        icon = "#taxi",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            if Player.job.name == 'taxi' then
            return not isdead and not inlaststand
            end
        end,
        subMenus = {"taxi:togglemeter", "taxi:togglemouse", "taxi:npc_mission"},
    },
    {
        id = "tow:job",
        displayName = "Tow",
        icon = "#truck-pickup",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            if Player.job.name == 'tow' then
            return not isdead and not inlaststand
            end
        end,
        subMenus = {"tow:togglenpc", "tow:towvehicle"},
    },
    {
        id = "mechanic:job",
        displayName = "Mechanic",
        icon = "#car-battery",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            if Player.job.name == 'mechanic' then
            return not isdead and not inlaststand
            end
        end,
        subMenus = {"mechanic:towvehicle"},
    },
    {
        id = "police:job",
        displayName = "Police",
        icon = "#police-action",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            if Player.job.name == 'police' and Player.job.onduty then
            return not isdead and not inlaststand
            end
        end,
        subMenus = {"police:checkvehstatus","police:resethouse","police:takedriverlicense","police:statuscheck","police:checkstatus","police:escort","police:searchplayer","police:jailplayer"},
    },
    {
        id = "police:jobObjects",
        displayName = "Police Objects",
        icon = "#archive",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            if Player.job.name == 'police' and Player.job.onduty then
            return not isdead and not inlaststand
            end
        end,
        subMenus = {"police:spawnpion","police:spawnhek","police:spawnschotten","police:spawntent","police:spawnverlichting","police:spikestrip","police:deleteobject"},
    },
    {
        id = "copDead",
         displayName = "Emergency Call",
         icon = "#police-dead",
         functionName = "police:client:SendPoliceEmergencyAlert",
         enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            
            if inlaststand and Player.job.name == 'police' then
             return true
            elseif isdead and Player.job.name == 'police' then
             return true
            end
          end,
     },
     {
        id = "hotdog:job",
         displayName = "Sell HotDogs",
         icon = "#globe-hotdog",
         functionName = "kd-hotdogjob:client:ToggleSell",
         enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]
            
            if Player.job.name == 'hotdog' then
             return not isdead and not inlaststand
            end
          end,
     },
     {
        id = "open-garage",
        displayName = "Vehicle List",
        icon = "#garage",
        functionName = "Garages:Open",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inGarage  and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "park-vehicle-garage",
        displayName = "Park",
        icon = "#car",
        functionName = "Garages:Store",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inGarage and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "general:depots",
        displayName = "Depot",
        icon = "#garage",
        functionName = "Garages:OpenDepot",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and inDepots and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "open-garage-housing",
        displayName = "Vehicle List",
        icon = "#garage",
        functionName = "Garages:OpenHouseGarage",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            local isAtHouseGarage = false
            QBCore.Functions.TriggerCallback('qb-garages:isAtHouseGar', function(result)
                isAtHouseGarage = result
            end)
            Wait(100)
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isAtHouseGarage  and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "park-vehicle-garage-housing",
        displayName = "Park",
        icon = "#car",
        functionName = "Garages:StoreInHouseGarage",
        enableMenu = function()
            local pData = QBCore.Functions.GetPlayerData()
            local isAtHouseGarage = false
            QBCore.Functions.TriggerCallback('qb-garages:isAtHouseGar', function(result)
                isAtHouseGarage = result
            end)
            Wait(100)
            return (not pData.metadata["isdead"] and not pData.metadata["inlaststand"] and isAtHouseGarage and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },    
}

newSubMenus = {
    ['general:givenum'] = {
        title = "Give contact",
        icon = "#globe-phone",
        functionName = "arabcodingteam-phone:client:GiveContactDetails"
    }, 
    -- actions
    ['vehicle:putin'] = {
        title = "Put In Vehicle",
        icon = "#car",
        functionName = "police:client:PutPlayerInVehicle"
    }, 
    ['vehicle:putout'] = {
        title = "Put Out Vehicle",
        icon = "#car",
        functionName = "police:client:SetPlayerOutVehicle"
    },
    -- actions
    ['actions:rob'] = {
        title = "Rob",
        icon = "#general-rob",
        functionName = "police:client:RobPlayer"
    },   
    ['actions:sell'] = {
        title = "Corner Selling",
        icon = "#weed-cultivation",
        functionName = "arabcodingteam-drugs:client:cornerselling"
    },
    ['actions:cuff'] = {
        title = "Cuff",
        icon = "#cuffs",
        functionName = "police:client:CuffPlayerSoft"
    },
    ['actions:escort'] = {
        title = "Escort",
        icon = "#general-escort",
        functionName = "police:client:EscortPlayer"
    },
    -- houses
    ['houses:givehousekey'] = {
        title = "Give House Keys",
        icon = "#globe-key",
        functionName = "arabcodingteam-houses:client:giveHouseKey"
    },
    ['houses:removehousekey'] = {
        title = "Remove House Keys",
        icon = "#globe-key",
        functionName = "arabcodingteam-houses:client:removeHouseKey"
    },
    ['houses:togglelock'] = {
        title = "Toggle Doorlock",
        icon = "#globe-door-closed",
        functionName = "arabcodingteam-houses:client:toggleDoorlock"
    },
    ['houses:decoratehouse'] = {
        title = "Decorate House",
        icon = "#globe-house",
        functionName = "arabcodingteam-houses:client:decorate"
    },
    ['houses:setstash'] = {
        title = "Set Stash",
        icon = "#globe-box",
        functionName = "arabcodingteam-houses:client:setLocation",
        id = 'setstash',
    },
    ['houses:setoutift'] = {
        title = "Set Wardrobe",
        icon = "#globe-shirt",
        functionName = "arabcodingteam-houses:client:setLocation",
        id = 'setoutift',
    },
    ['houses:setlogout'] = {
        title = "Set Logout",
        icon = "#globe-door-open",
        functionName = "arabcodingteam-houses:client:setLocation",
        id = "setlogout"
    },
    -- ambulance
    ['ambulance:statuscheck'] = {
        title = "Check Health Status",
        icon = "#heartbeat",
        functionName = "hospital:client:CheckStatus",
    },
    ['ambulance:revivep'] = {
        title = "Revive",
        icon = "#doctor",
        functionName = "hospital:client:RevivePlayer",
    },
    ['ambulance:treatwounds'] = {
        title = "Heal wounds",
        icon = "#medic-heal",
        functionName = "hospital:client:TreatWounds",
    },
    ['ambulance:escort'] = {
        title = "Escort",
        icon = "#user",
        functionName = "police:client:EscortPlayer",
    },
    --- taxi
    ['taxi:togglemeter'] = {
        title = "Show/Hide Meter",
        icon = "#ban",
        functionName = "arabcodingteam-taxi:client:toggleMeter",
    },
    ['taxi:togglemouse'] = {
        title = "Start/Stop Meter",
        icon = "#hourglass",
        functionName = "arabcodingteam-taxi:client:enableMeter",
    },
    ['taxi:npc_mission'] = {
        title = "NPC Mission",
        icon = "#child",
        functionName = "arabcodingteam-taxi:client:DoTaxiNpc",
    },
    -- two
    ['tow:togglenpc'] = {
        title = "Toggle NPC",
        icon = "#toggle-on",
        functionName = "jobs:client:ToggleNpc",
    },
    ['tow:towvehicle'] = {
        title = "Tow vehicle",
        icon = "#car",
        functionName = "arabcodingteam-tow:client:TowVehicle",
    },
    -- mechanic
    ['mechanic:towvehicle'] = {
        title = "Tow vehicle",
        icon = "#car",
        functionName = "arabcodingteam-tow:client:TowVehicle",
    },
    -- police
    ['police:checkvehstatus'] = {
        title = "Check Tune Status",
        icon = "#car",
        functionName = "arabcodingteam-tunerchip:client:TuneStatus",
    },
    ['police:resethouse'] = {
        title = "Reset house lock",
        icon = "#globe-key",
        functionName = "arabcodingteam-houses:client:ResetHouse",
    },
    ['police:takedriverlicense'] = {
        title = "Revoke Drivers License",
        icon = "#licenses-grant-drivers",
        functionName = "police:client:SeizeDriverLicense",
    },
    ['police:statuscheck'] = {
        title = "Check Health Status",
        icon = "#heartbeat",
        functionName = "hospital:client:CheckStatus",
    },
    ['police:checkstatus'] = {
        title = "Check status",
        icon = "#status",
        functionName = "police:client:CheckStatus",
    },
    ['police:escort'] = {
        title = "Escort",
        icon = "#user",
        functionName = "police:client:EscortPlayer",
    },
    ['police:searchplayer'] = {
        title = "Search",
        icon = "#police-action-gsr",
        functionName = "police:client:SearchPlayer",
    },
    ['police:jailplayer'] = {
        title = "Jail",
        icon = "#cuffs-cuff",
        functionName = "police:client:JailPlayer",
    },
    -- police/objects
    ['police:spawnpion'] = {
        title = "Cone",
        icon = "#exclamation-triangle",
        functionName = "police:client:spawnCone",
    },
    ['police:spawnhek'] = {
        title = "Gate",
        icon = "#torii-gate",
        functionName = "police:client:spawnBarrier",
    },
    ['police:spawnschotten'] = {
        title = "Speed Limit Sign",
        icon = "#sign",
        functionName = "police:client:spawnRoadSign",
    },
    ['police:spawntent'] = {
        title = "Tent",
        icon = "#campground",
        functionName = "police:client:spawnTent",
    },
    ['police:spawnverlichting'] = {
        title = "Lighting",
        icon = "#lightbulb",
        functionName = "police:client:spawnLight",
    },
    ['police:spikestrip'] = {
        title = "Spike Strips",
        icon = "#caret-up",
        functionName = "police:client:SpawnSpikeStrip",
    },
    ['police:deleteobject'] = {
        title = "Remove object",
        icon = "#police-trash",
        functionName = "police:client:deleteObject",
    },
    -- hotdog
    ['hotdog:togglesell'] = {
        title = "Toggle sell",
        icon = "#globe-hotdog",
        functionName = "arabcodingteam-hotdogjob:client:ToggleSell",
    },
}



Citizen.CreateThread(function()
    for k, v in pairs(Garages) do
        exports["polyzonehelper"]:AddBoxZone("garages", vector3(Garages[k].polyzone.x, Garages[k].polyzone.y, Garages[k].polyzone.z), Garages[k].polyzone1, Garages[k].polyzone2, {
            name="garages",
            heading=Garages[k].heading,
            minZ = Garages[k].minZ,
            maxZ = Garages[k].maxZ,
            debugPoly=false
        }) 
    end
    for k, v in pairs(GangGarages) do
        exports["polyzonehelper"]:AddBoxZone("ganggarages", vector3(GangGarages[k].polyzone.x, GangGarages[k].polyzone.y, GangGarages[k].polyzone.z), GangGarages[k].polyzone1, GangGarages[k].polyzone2, {
            name="ganggarages",
            heading=GangGarages[k].heading,
            minZ = GangGarages[k].minZ,
            maxZ = GangGarages[k].maxZ,
            debugPoly=false
        }) 
    end
    for k, v in pairs(JobGarages) do
        exports["polyzonehelper"]:AddBoxZone("jobgarages", vector3(JobGarages[k].polyzone.x, JobGarages[k].polyzone.y, JobGarages[k].polyzone.z), JobGarages[k].polyzone1, JobGarages[k].polyzone2, {
            name="jobgarages",
            heading=JobGarages[k].heading,
            minZ = JobGarages[k].minZ,
            maxZ = JobGarages[k].maxZ,
            debugPoly=false
        }) 
    end
    for k, v in pairs(Depots) do
        exports["polyzonehelper"]:AddBoxZone("depots", vector3(Depots[k].polyzone.x, Depots[k].polyzone.y, Depots[k].polyzone.z), Depots[k].polyzone1, Depots[k].polyzone2, {
            name="depots",
            heading=Depots[k].heading,
            minZ = Depots[k].minZ,
            maxZ = Depots[k].maxZ,
            debugPoly=false
        }) 
    end
end)

RegisterNetEvent('polyzonehelper:enter')
AddEventHandler('polyzonehelper:enter', function(name)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if name == "garages" then
        inGarage = true
    elseif name == "ganggarages" then
        inGarage = true
    elseif name == "jobgarages" then
        inGarage = true
    elseif name == "depots" then
        inDepots = true
    end
end)

RegisterNetEvent('polyzonehelper:exit')
AddEventHandler('polyzonehelper:exit', function(name)
    if name == "garages" then
        inGarage = false
    elseif name == "ganggarages" then
        inGarage = false
    elseif name == "jobgarages" then
        inGarage = false
    elseif name == "depots" then
        inDepots = false
    end
end)
