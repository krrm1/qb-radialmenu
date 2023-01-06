local QBCore = exports['qb-core']:GetCoreObject()
local walkstyle = 'default'
local walktable = {}
local WalkingSyles = {
    ["arrogant"] = 'move_f@arrogant@a',
    ["casual"] = 'move_m@casual@a',
    ["casual2"] = 'move_m@casual@b',
    ["casual3"] = 'move_m@casual@c',
    ["casual4"] = 'move_m@casual@d',
    ["casual5"] = 'move_m@casual@e',
    ["casual6"] = 'move_m@casual@f',
    ["confident"] = 'move_m@confident',
    ["business"] = 'move_m@business@a',
    ["business2"] = 'move_m@business@b',
    ["business3"] = 'move_m@business@c',
    ["femme"] = 'move_f@femme@',
    ["flee"] = 'move_f@flee@a',
    ['muscle'] = 'move_m@muscle@a',
    ["gangster"] = 'move_m@gangster@generic',
    ["gangster2"] = 'move_m@gangster@ng',
    ["gangster3"] = 'move_m@gangster@var_e',
    ["gangster4"] = 'move_m@gangster@var_f',
    ["gangster5"] = 'move_m@gangster@var_i',
    ["heels"] = 'move_f@heels@c',
    ["heels2"] = 'move_f@heels@d',
    ['hiking'] = 'move_m@hiking',
    ["quick"] = 'move_m@quick',
    ['wide'] = "move_m@bag",
    ["scared"] = 'move_f@scared',
    ["brave"] = 'move_m@brave',
    ["tipsy"] = 'move_m@drunk@slightlydrunk',
    ["injured"] = 'move_m@injured',
    ["tough"] = 'move_m@tough_guy@',
    ["sassy"] = 'move_m@sassy',
    ["sad"] = 'move_m@sad@a',
    ["posh"] = 'move_m@posh@',
    ["alien"] = 'move_m@alien',
    ["nonchalant"] = 'move_m@non_chalant',
    ["hobo"] = 'move_m@hobo@a',
    ["money"] = 'move_m@money',
    ["swagger"] = 'move_m@swagger',
    ["shady"] = 'move_m@shadyped@a',
    ["maneater"] = 'move_f@maneater',
    ["chichi"] = 'move_f@chichi',
    ["default"] = 'default',
}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Wait(2000)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local savedwalk = GetResourceKvpString('walkstyles')
    if savedwalk then walktable = json.decode(savedwalk) end

    if walktable[PlayerData.citizenid] then
        walkstyle = walktable[PlayerData.citizenid]
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    Wait(2000)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local savedwalk = GetResourceKvpString('walkstyles')
    if savedwalk then walktable = json.decode(savedwalk) end

    if walktable[PlayerData.citizenid] then
        walkstyle = walktable[PlayerData.citizenid]
    end
end)

local function saveWalks()
    SetResourceKvp('walkstyles', json.encode(walktable))
end

local function SetWalks(anim)
	local ped = PlayerPedId()
	if anim == 'default' then
		ResetPedMovementClipset(ped)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	else
		RequestAnimSet(anim)
		while not HasAnimSetLoaded(anim) do Wait(0) end
		SetPedMovementClipset(ped, anim)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	end
end

RegisterNetEvent('qb-walks:set', function(data)
    local data = data.data
	walkstyle = data
	SetWalks(data)
    local PlayerData = QBCore.Functions.GetPlayerData()
    walktable[PlayerData.citizenid] = data
    saveWalks()
end)

CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local walkstyleCurrent = GetPedMovementClipset(ped)
        if walkstyleCurrent ~= joaat(walkstyle) or walkstyle == "default" then
            SetWalks(walkstyle)
        end
    end
end)

RegisterNetEvent('qb-walks:menu', function(data)
    local staffList = {}
    staffList[#staffList + 1] = {
        isMenuHeader = true,
        header = 'Walking style menu',
        icon = 'fas fa-bars'
    }
    for k,v in pairs(WalkingSyles) do
        staffList[#staffList + 1] = {
            header = k,
            icon = 'fas fa-walking',
            params = {
                event = 'qb-walks:set',
                args = {
                    data = v,
                }
            }
        }
    end
    exports['qb-menu']:openMenu(staffList)
end)