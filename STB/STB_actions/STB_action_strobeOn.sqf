// action for lighting IR strobes

/*
in unit init:
this addAction ["<t color=""#EDFF2B"">" + "Strobe ON","STB\STB_actions\STB_action_strobeOn.sqf",[],9,false,true,"","_target == _this && (isNil {_target getVariable ""stb_strobe""})"];					
this addAction ["<t color=""#EDFF2B"">" + "Strobe OFF","STB\STB_actions\STB_action_strobeOff.sqf",[],9,false,true,"","_target == _this && !(isNil {_target getVariable ""stb_strobe""})"];
*/

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;

if (isNil {_target getVariable "stb_strobe"}) then {

	_target setVariable ["stb_strobe", 1];
	_type = "NVG_TargetC";	

	switch (side _target) do {
		case west: {_type = "NVG_TargetW"};
		case east: {_type = "NVG_TargetE"};
		default {};
	};	

	_strobe = _type createVehicle getpos player;
	_strobe attachTo [player,[0,0,0.2],"neck"];	
	while {!isNil {_target getVariable "stb_strobe"}} do {sleep 1};	
	detach _strobe;
	_strobe setPosATL [-10000,-10000,100000];
	sleep 0.1;
	deleteVehicle _strobe;
	
};
