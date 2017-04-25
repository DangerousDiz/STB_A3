/*

		CLIENT-SPECIFIC INITIALISATION
			
*/ 

// allow time for the player to initialise	
waitUntil {!isNull player};
waitUntil {player == player};

// troop Structure and credits in briefing

player spawn STB_fnc_intel_getTroopStructure;
player spawn STB_fnc_intel_stbCredits;
//Misc Scripts
_null = [] execVM "briefing.sqf";

// 3CB Scripts
	execVM "Scripts\3cb\jipZeus.sqf";
	execVM "Scripts\3cb\sprayPaint.sqf";
	execVM "Scripts\3cb\respawn.sqf";
	execVM "Scripts\3cb\setupEnhancedMovement.sqf";
	execVM "Scripts\3cb\setupSTHUD.sqf";
	execVM "Scripts\3cb\accountability.sqf";
// updating map markers
player spawn STB_fnc_intel_groupMarkers;
player spawn STB_fnc_intel_specialMarkers;

// debug scripts
if (STB_DebugEnabled) then {
	player spawn STB_fnc_debug_teleport;
	player spawn STB_fnc_debug_camera;
	player spawn STB_fnc_debug_toggleCaptive;
	player spawn STB_fnc_debug_checkServerStatus;
};

// action for IR strobes
_irStrobe = switch (side player) do {
	case west: {STB_GearParams_West select 7};
	case east: {STB_GearParams_East select 7};
	case resistance: {STB_GearParams_Resistance select 7};
	default {STB_GearParams_West select 7};
};

if (_irStrobe) then {
	player addAction ["<t color=""#00C907"">" + "IR Strobe ON","STB\STB_actions\STB_action_strobeOn.sqf",[],9,false,true,"","_target == _this && (isNil {_target getVariable ""stb_strobe""})"];					
	player addAction ["<t color=""#009405"">" + "IR Strobe OFF","STB\STB_actions\STB_action_strobeOff.sqf",[],9,false,true,"","_target == _this && !(isNil {_target getVariable ""stb_strobe""})"];
};

// vehicle service actions
if (count STB_VehicleServiceTriggers > 0) then {

	_conditionString = 	"!refuelling && vehicle player != player && " + 						
						"(position vehicle player) select 2 < 2 && " +
						"speed player < 0.1 && " +						
						"fuel (vehicle player) < 1 && ";
						
	_triggerString = "(false";
	{_triggerString = _triggerString + " || vehicle player in list " + _x} forEach STB_VehicleServiceTriggers;
	_triggerString = _triggerString + ")";
		
	player addAction [	"<t color=""#00FF00"">" + "Repair, Rearm, Refuel", // text
						"STB\STB_actions\STB_action_vehicleService.sqf", // script
						[], // params
						25, // priority
						true, // showWindow
						true, // hideOnUse
						"",
						_conditionString + _triggerString
					];		
};

// handle respawning and lives
player setVariable ["STB_Lives",STB_PlayerRespawns,true];
if (STB_RespawnMode == 2) then {STB_playerTickets = [player,STB_PlayerRespawns + 1,false] call BIS_fnc_respawnTickets;};
if (STB_DebugEnabled) then {
	switch (STB_RespawnMode) do {
		case 0: 
		{
			systemChat format ["STB_Debug (%1) - STB Respawn System Disabled",time];			
		};
		case 1: 
		{
			systemChat format ["STB_Debug (%1) - STB Respawn System Active",time];
			systemChat format ["STB_Debug (%1) - Player Respawns = %2",time,STB_PlayerRespawns];
		};
		case 2: 
		{
			systemChat format ["STB_Debug (%1) - BIS Respawn System Active",time];
			systemChat format ["STB_Debug (%1) - Player Respawns = %2",time,STB_playerTickets - 1];		
		};
	};
};

// if JIP player, give some time to initialise
if (STB_isJIP) then {sleep 2;};

// do logistics after mission start
waitUntil {time > 1};

// assign loadouts
player execVM "STB\STB_logistics\STB_logistics_init.sqf";

// add event handlers to handle respawning
player addEventHandler ["Respawn",{_this execVM "STB\STB_client\STB_OnPlayerRespawn.sqf"}];
player addEventHandler ["Killed",{_this execVM "STB\STB_client\STB_OnPlayerKilled.sqf"}];


/* 	_conditionString = 	"_this == driver _target &&	speed _target <= 1 && (position _target) select 2 <= 2 && (damage _target > 0 || fuel _target < 0.999) && _target in list STB_serviceTrigger";
	{	_x addAction [	"<t color=""#00FF00"">" + "Repair, Rearm, Refuel", // text
						"STB\STB_actions\STB_action_vehicleService.sqf", // script
						[], // params
						25, // priority
						true, // showWindow
						true, // hideOnUse
						"",
						_conditionString
					];				
	} forEach STB_ServicableVehicles;
	condition = _conditionString; */