// this script executes on player killed
_unit = _this select 0;
/*
	DDZ Edit: Change hint used when player dies to state Respawn conditions for CO-OP
*/
// quick and dirty force sepctator mode
if (STB_RespawnMode == 1) then {
	_lives = _unit getVariable "STB_Lives";
	if (_lives <= 0) then {
		[_unit] join grpNull;
		hint "You Are Dead - No Respawns Left";
		//hint "2 Life Trust System: 1 Re-slot per player";
		_layer = "BIS_fnc_respawnSpectator" call bis_fnc_rscLayer;
		_layer cutrsc ["RscSpectator","plain"];		
		setPlayerRespawnTime 50000;
	} else {
		hint "Respawning: Please Wait";
	};
};

// utilise BIS tickets
if (STB_RespawnMode == 2) then {
	_tickets = [player,nil,true] call BIS_fnc_respawnTickets;
	if (_tickets <= 0) then {
		hint "You Are Dead - No Respawns Left";
		[_unit] join grpNull;		
		_layer = "BIS_fnc_respawnSpectator" call bis_fnc_rscLayer;
		_layer cutrsc ["RscSpectator","plain"];
	} else {
		hint "Respawning: Please Wait";
	};
};	

