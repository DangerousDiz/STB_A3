/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	********************		DEBUG FUNCTIONS		************************

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// switch captive
STB_fnc_debug_toggleCaptive = 
{
	_this addAction 	[	"<t color=""#B2ED5A"">" + "Toggle Captive Status", // text
							"STB\STB_actions\STB_action_toggleCaptive.sqf", // script
							[], // params
							10, // priority
							false, // showWindow
							true, // hideOnUse
							"",
							"_target == _this" // params
						];					
};

// teleport ability
STB_fnc_debug_teleport = 
{
	_this addAction 	[	"<t color=""#45D9AC"">" + "Teleport", // text
							"STB\STB_actions\STB_action_teleport.sqf", // script
							[], // params
							11, // priority
							false, // showWindow
							true, // hideOnUse
							"",
							"_target == _this" // params
						];					
};

// camera ability
STB_fnc_debug_camera = 
{
	_this addAction 	[	"<t color=""#4D8BFF"">" + "Start Free Camera", // text
							"STB\STB_actions\STB_action_camera.sqf", // script
							[], // params
							12, // priority
							false, // showWindow
							true, // hideOnUse
							"",
							"_target == _this" // params
						];	
};

// camera ability
STB_fnc_debug_checkServerStatus = 
{
	_this addAction 	[	"<t color=""#FFFF00"">" + "Check Server Status", // text
							"STB\STB_actions\STB_action_checkServer.sqf", // script
							[], // params
							13, // priority
							false, // showWindow
							true, // hideOnUse
							"",
							"_target == _this" // params
						];	
};

// function deployed during checkServerStatus action
STB_fnc_debug_checkNetworkAI =
{
	if (STB_HC_Connected) then {
		if (player == (call compile STB_HC_Name)) then {		
			// count AI deployed on the HC
			temp_hc_ai_count = {local _x && !(_x in playableUnits)} count allUnits;	
			temp_hc_grp_count = {local (leader _x) && !((leader _x) in playableUnits)} count allGroups; 
			publicVariable "temp_hc_ai_count";
			publicVariable "temp_hc_grp_count";
		};
	} else {
		if (isServer) then {
			temp_hc_ai_count = 0;
			temp_hc_grp_count = 0;
			publicVariable "temp_hc_ai_count";
			publicVariable "temp_hc_grp_count";
		};
	};
	
	if (isServer) then {
		temp_server_ai_count = {local _x && !(_x in playableUnits)} count allUnits;
		temp_server_grp_count = {local (leader _x) && !((leader _x) in playableUnits)} count allGroups; 
		publicVariable "temp_server_ai_count";
		publicVariable "temp_server_grp_count";
	};
};

// group markers
STB_fnc_debug_markGroup =
{
	private ["_grp","_type","_markerText","_prefix","_suffix"];
	_grp = _this select 0; // group to be marked
	_type = _this select 1; // 0 for infantry, 1 for ground vehicle, 2 for air vehicle
	_markerText = _this select 2; // text to put next to the markers for id
	_prefix = "n_";
	_suffix = "inf";
	
	switch (side leader _grp) do
	{
		case WEST: {_prefix = "b_"};
		case EAST: {_prefix = "o_"};
		case RESISTANCE: {_prefix = "n_"};
		default {};
	};
	
	switch (_type) do
	{
		case 0: {_suffix = "inf"};
		case 1: {_suffix = "mech_inf"};
		case 2: {_suffix = "air"};
		default {};
	};
	
	_icon = _prefix + _suffix;

	_markerName = "marker" call STB_fnc_ancillary_randomName;
	_markerHandle = createMarker [_markerName,getPos leader _grp];	
	
	_markerHandle setMarkerShape "ICON";
	_markerHandle setMarkerType _icon;
	_markerHandle setMarkerSize [0.75,0.75];
	_markerHandle setMarkerText _markerText;
	
	while {({Alive _x} count (units _grp)) > 0} do
	{
		sleep 1;
		_markerHandle setMarkerPos getPos leader _grp; 
	};
	
	_markerHandle setMarkerColor "ColorBlack";
	sleep 30;
	deleteMarker _markerHandle;	
};

// monitor groups
STB_fnc_debug_monitorGroups =
{
	/*
		Monitors the STB_SpawnedGroups variable and deletes dead groups from the array
	*/
	
	while {true} do 
	{
		{
			if (_x in STB_SpawnedGroups) then {
				_grp = _x;		
				_alive = ({Alive _x} count (units _grp) > 0);
				if (!_alive) then {
					STB_SpawnedGroups = STB_SpawnedGroups - [_grp];
					if (STB_DebugEnabled) then {
						systemChat format ["STB_Debug (%1) - Cleaning up dead group: %2",time,_grp];
					};					
				};
				sleep 0.5;
			};
		} forEach allGroups;		
		sleep 1;
	};
};

STB_fnc_debug_monitorMarkers =
{
	/*
		Monitors STB_DisposableMarkers and periodically cleans them up
	*/
	
	_markers = STB_DisposableMarkers;
	waitUntil {time > 30};
	
	while {true} do
	{
		if (count STB_DisposableMarkers != count _markers) then {
			
			_newMarkers = [];
			{
				if (!(_x in _markers)) then {
					_newMarkers = _newMarkers + [_x]
				};
			} forEach STB_DisposableMarkers;
			
			_newMarkers spawn {			
				sleep STB_MarkerCleanupTime;				
				{
					deleteMarker _x;
					STB_DisposableMarkers = STB_DisposableMarkers - [_x];
				} forEach _this;				
				if (STB_DebugEnabled && count _this > 0) then {
					systemChat format ["STB_Debug (%1) - Cleaning up %2 markers",time,count _this];
				};
			};
			
			_markers = STB_DisposableMarkers;			
		};

		sleep 10;
	};
};

STB_fnc_debug_protectMarkers =
{
	{
		if (_x in STB_DisposableMarkers) then {
			STB_DisposableMarkers = STB_disposableMarkers - [_x];
			publicVariable "STB_DisposableMarkers";
		};
		if (!(_x in STB_ProtectedMarkers)) then {
			STB_ProtectedMarkers = STB_ProtectedMarkers + [_x];
			publicVariable "STB_ProtectedMarkers";
		};
	} forEach _this;
};

STB_fnc_debug_unprotectMarkers =
{
	{
		if (_x in STB_ProtectedMarkers) then {
			STB_ProtectedMarkers = STB_ProtectedMarkers - [_x];
			publicVariable "STB_ProtectedMarkers";
		};
		if (!(_x in STB_DisposableMarkers)) then {
			STB_DisposableMarkers = STB_disposableMarkers + [_x];
			publicVariable "STB_DisposableMarkers";
		};
	} forEach _this;
};