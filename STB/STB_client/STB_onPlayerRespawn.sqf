// this script executes on player respawn
_unit = _this select 0;
_oldUnit = _this select 1;
if (!local _unit) exitWith {};
waitUntil {!isNull _unit};

// query all STB variables for this player
_lives = _oldUnit getVariable "STB_Lives";

// remove all of these variables from old unit
_oldUnit setVariable ["STB_Lives",nil,true];
_oldUnit setVariable ["STB_GroupMarker",nil,true];
_oldUnit setVariable ["STB_SpecialMarker",nil,true];
_oldUnit setVariable ["STB_Description",nil,true];

if (_lives > 0) then {

	// display hints
	if (STB_RespawnMode > 0) then {hint format ["Respawns Remaining: %1", _lives - 1];};
	
	// decrement lives
	_unit setVariable ["STB_Lives", _lives - 1, true];
	
	// updating map markers
	player spawn STB_fnc_intel_groupMarkers;
	player spawn STB_fnc_intel_specialMarkers;

	// debug scripts
	if (STB_DebugEnabled) then {
		_unit spawn STB_fnc_debug_teleport;
		_unit spawn STB_fnc_debug_camera;
		_unit spawn STB_fnc_debug_toggleCaptive;
		_unit spawn STB_fnc_debug_checkServerStatus;		
	};

	// action for IR strobes
	_irStrobe = switch (side _unit) do {
		case west: {STB_GearParams_West select 7};
		case east: {STB_GearParams_East select 7};
		case resistance: {STB_GearParams_Resistance select 7};
		default {STB_GearParams_West select 7};
	};

	if (_irStrobe) then {
		_unit addAction ["<t color=""#00C907"">" + "IR Strobe ON","STB\STB_actions\STB_action_strobeOn.sqf",[],9,false,true,"","_target == _this && (isNil {_target getVariable ""stb_strobe""})"];					
		_unit addAction ["<t color=""#009405"">" + "IR Strobe OFF","STB\STB_actions\STB_action_strobeOff.sqf",[],9,false,true,"","_target == _this && !(isNil {_target getVariable ""stb_strobe""})"];
	};
	
	// wait a second
	waitUntil {time > 1};
	sleep 1;
	
	// assign loadouts
	_unit execVM "STB\STB_logistics\STB_logistics_init.sqf";
	
	// include mission specific extra stuff
	_unit execVM "STB\STB_Client\STB_onPlayerRespawn_extra.sqf"
	
};