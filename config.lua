local QBCore = exports['arabcodingteam-core']:GetCoreObject()

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
         functionName = "arabcodingteam-hotdogjob:client:ToggleSell",
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
