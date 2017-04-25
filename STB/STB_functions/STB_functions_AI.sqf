/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	******************		LIST OF DEFINITIONS     	*********************
	
	SIDES:
	0: NATO
	1: AAF
	2: CSAT
	3: FIA (blue)
	4: FIA (green)
	5: FIA (red)
	6: 3CB BAF
	7: RHS Russian Military (RHS mod required)
		
	>	GROUP CLASSES		>	GROUP TYPES		

	>	"infantry"			>	"section"
							>	"fireteam
							>	"weapons"
							>	"at"
							>	"aa"
							>	"sentry"
							>	"sniper"
							>	"mortar"
							
	> 	"motorized"			>	"section"
							>	"fireteam"
							>	"at"
							>	"aa"
							>	"hmg"
							>	"gmg"
							>	"mortar"
							
	> 	"mechanized"		>	"section"
							>	"at"
							>	"aa"
							>	"support"

	>	"vehicle"			>	"unarmed"
							>	"light"
							>	"medium"
							>	"heavy"
							
	> 	"air"				>	"transport"
							>	"rw_cas"
							>	"fw_cas"
							
	> 	"static"			>	"mortar"
							>	"hmg"
							>	"gmg"
							>	"at"
							>	"aa"	

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

STB_fnc_AI_populateArea =
{
	/* 
		creates random ai in an area
	
		if (isServer) then {nul = [0,"random","random","random",[10,0],[10,0],[10,0],[5,0],player,750] spawn STB_fnc_AI_populateArea;};
		
		Params:
			faction - number (see factions list)
			group type	(string - see group type list under infantry class)
			vehicle type  (string - see group type list under vehicle class)
			air vehicle type - string (see group type list under "air" class) 
			number of groups on patrol [min,random extra]
			number of groups to be garrisoned [min,random extra]
			number of vehicles on patrol [min,random extra]
			number of air vehicles on patrol
			center positon - marker/object/positon array
			radius (m)
	
	*/

	// required params
	_faction = _this select 0; // see factions list
	_groupType = _this select 1; // see group type list under infantry or enter "random"
	_vehicleType = _this select 2; // see group type list under vehicle class or enter "random"
	_airType = _this select 3; // see group type list under air class or enter "random"
	_amountPat = _this select 4; // [minimum, random extra]
	_amountGar = _this select 5; // [minimum, random extra]
	_amountVeh = _this select 6; // [minimum, random extra]	
	_amountAir = _this select 7; // [minimum, random extra]	
	_center = _this select 8; // center marker/object/position array
	_radius = _this select 9; // how far away will groups spawn?

	// generate markers
	_markerArrayPat = [_center, [0,_radius], _amountPat] call STB_fnc_ancillary_randomLocations;
	_markerArrayGar = [_center, [0,_radius], _amountGar] call STB_fnc_ancillary_randomLocations;
	_markerArrayVeh = [_center, [0,_radius], _amountVeh] call STB_fnc_ancillary_randomLocations;
	_markerArrayAir = [_center, [0,_radius], _amountAir] call STB_fnc_ancillary_randomLocations;
	
	// spawn units
	[_faction,"infantry",_groupType,_markerArrayPat,100,"patrol",["self",50]] spawn STB_fnc_AI_spawnAI;
	[_faction,"infantry",_groupType,_markerArrayGar,100,"garrison",[250]] spawn STB_fnc_AI_spawnAI;
	[_faction,"vehicle",_vehicleType,_markerArrayVeh,100,"patrol",["self",100]] spawn STB_fnc_AI_spawnAI;
	[_faction,"air",_airType,_markerArrayAir,100,"patrol",[_center,500]] spawn STB_fnc_AI_spawnAI;

};

STB_fnc_AI_attack =
{
	/*
		creates a randomisable AI attack
		
		if (isServer) then {nul = [0,"random","random","random",[10,0],[5,0],[2,0],player,150,[500,1500],[270,180]] spawn STB_fnc_AI_attack;};
		
		Params:
			faction - number (see factions list)
			group type - string (see group type list under "infantry" class)
			vehicle type - string (see group type list under "vehicle" class) 
			air vehicle type - string (see group type list under "air" class)  
			amount infantry - [min, random extra]
			amount vehicles - [min, random extra]
			amount air - [min, random extra]
			target - marker/object/posarray
			error - number in m (how close their waypoint will be to the target pos)
			radii - [minimum radius (m), random extra (m)]
			(optional) azimuth - [minimum azimuth (degrees), random extra (degrees)]
				default is a 360 degree unrestricted ambush [0,360]
	*/

	// get parameters
	_faction = _this select 0; // see factions list
	_groupType = _this select 1; // see group type list under infantry or enter "random"
	_vehicleType = _this select 2; // see group type list under vehicles class or enter "random"
	_airType = _this select 3; // see group type list under air or enter "random"
	_amountInf = _this select 4; // [minimum, random extra]
	_amountVeh = _this select 5; // [minimum, random extra]
	_amountAir = _this select 6;
	_target = _this select 7; // target of search and destroy operations (marker/object/posarray)
	_error = _this select 8; // error in enemy intel (how close their waypoint will be to the target pos)
	_radii = _this select 9; // distance from target [min, random extra]
	_azi = if (count _this <= 10) then {[0,360]} else {_this select 10}; // [attack sector start azimuth (degrees), attack sector width (degrees)] 
	
	// generate markers
	_markerArrayInf = [_target, _radii, _amountInf, _azi] call STB_fnc_ancillary_randomLocations;
	_markerArrayVeh = [_target, _radii, _amountVeh, _azi] call STB_fnc_ancillary_randomLocations;
	_markerArrayAir = [_target, _radii, _amountAir, _azi] call STB_fnc_ancillary_randomLocations;
	
	// spawn units
	[_faction,"infantry",_groupType,_markerArrayInf,100,"sad",[_target,_error]] spawn STB_fnc_AI_spawnAI;
	[_faction,"vehicle",_vehicleType,_markerArrayVeh,100,"sad",[_target,_error]] spawn STB_fnc_AI_spawnAI;
	[_faction,"air",_airType,_markerArrayAir,100,"sad",[_target,_error]] spawn STB_fnc_AI_spawnAI;
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	******************		MAIN AI SPAWNING FUNCTION     	*********************

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

STB_fnc_AI_spawnAI = 
{
	/*
		Spawns AI

	Params: 	
	faction (number) - see factions list
	group class (string) - see group class list or enter "random"
	group type (string) - see group type list or enter "random"
	marker array (string array) - markers at which to spawn groups e.g. ["marker1_name","marker2_name",...,"markerN_name"] 
	[optional] marker percentage (number 0-100) - percentage chance that each marker is used (default = 100)
	[optional] AI mode (string) - "patrol", "garrison", "sad" or "none" (default = "none")
	[optional] params (array) -	"patrol": [centerPos, radius]
								"garrison": [radius]	
								"sad": [target, radius]
								"none": nil or left blank
								
	e.g. to spawn an infantry section at each of 3 markers that patrol around their spawn point
	[0,"infantry","section",["marker_1","marker_2","marker_3"],100,"patrol",["self",25]] spawn STB_fnc_AI_spawnAI;
	
	*/
	
	private ["_faction","_groupClass","_groupType","_groupSize","_markerArray","_markerPercent","_aiMode","_parameters",
	"_markerText","_groups","_class","_group","_side","_createdGroups","_classArray","_isVehicle"];
	
	// parameters
	_faction = _this select 0;
	_groupClass = _this select 1;
	_groupType = _this select 2;
	_markerArray = _this select 3;
	_markerPercent = if (count _this <= 4) then {100} else {_this select 4};
	_aiMode = if (count _this <= 5) then {"none"} else {_this select 5};
	_parameters = if (count _this <= 6) then {nil} else {_this select 6};
	
	// derived parameters
	_markerText = if (!isNil "_aiMode") then {_aiMode} else {""};
	_groupClass = toLower _groupClass;
	_groupType = toLower _groupType;
	
	// init array of created groups	
	_createdGroups = [];	
	
	// spawn groups
	{
		private ["_marker"];
		_marker = _x;
		_AICount = {!(_x in playableUnits)} count allUnits;
		
		if (random 100 <= _markerPercent && _AICount <= STB_MaxAI) then {	
		
			private ["_pos","_grp","_leader"];
			_pos = getMarkerPos _marker;
			
			// get a flat empty position nearby
			//_safePos = [_pos, 150] call STB_fnc_ancillary_findSafePos;	
			_safePos = _pos;

			// get group classnames and other info
			_groupInfo = [_faction,_groupClass,_groupType] call STB_fnc_AI_getGroupInfo;
			_group = _groupInfo select 0; 
			_side = _groupInfo select 1;	
			_isVehicle = _groupInfo select 2;
			_isAir = _groupInfo select 3;
			_isStatic = _groupInfo select 4;
			_isFW = _groupInfo select 5;
			_groupSize = count _group;			
			
			// get markerType
			_markerIconType = 0;
			
			// get marker direction
			_dir = markerDir _marker;
			
			// get a dummy position to set turret direction to
			_watchPos = [(_pos select 0) + 1000 * (sin _dir), (_pos select 1) + 1000 * (cos _dir), 0];

			// spawn group
			_grp = "";	
			
			// check if vehicle
			if (_isVehicle) then {
			
				// choose from available vehicle types
				_selectedVehicle = _group call BIS_fnc_selectRandom;				
					
				// spawn the vehicle
				_vehicle = [_safePos,_dir,_selectedVehicle,_side] call BIS_fnc_spawnVehicle;			
				_grp = _vehicle select 2;
				
				// do stuff based on vehicle type				
				// fixed wing vehicles
				if (_isFW) then {
					(_vehicle select 0) setPos [(getPos (_vehicle select 0)) select 0, (getPos (_vehicle select 0)) select 1, 500];
					(_vehicle select 0) setVelocity [300 * (sin _dir), 300 * (cos _dir), 0];
					(_vehicle select 0) flyInHeight 100;
				};
				// rotary wing vehicles
				if (_isAir && !_isFW) then {
					(_vehicle select 0) setPos [(getPos (_vehicle select 0)) select 0, (getPos (_vehicle select 0)) select 1, 150];
					(_vehicle select 0) flyInHeight 100;					
				};	
				// all air vehicles
				if (_isAir) then {_markerIconType = 2} else {
					_markerIconType = 1;					
					(units _grp) doWatch _watchPos;
				};
				
			} else {
				// infantry groups
				_grp = [_safePos, _side, _group, [], [], [], [], [_groupSize,0], _dir] call BIS_fnc_spawnGroup;
			};
			
			// get leader
			_leader = leader _grp;
			
			// set skill
			{_x spawn STB_fnc_AI_setSkillArray} forEach (units _grp);
			
			// add group to output array and to the global that contains all the groups
			_createdGroups = _createdGroups + [_grp];
			STB_SpawnedGroups = STB_SpawnedGroups + [_grp];
			
			// do something with the groups
			if (!isNil "_aiMode") then {
			
				// patrol/garrison/sad/none
				switch (_aiMode) do {
					case "patrol":
					{
						if (_isAir) then {_parameters set [1, (_parameters select 1)*2]};
						if (!_isStatic) then {[_grp, _parameters] spawn STB_fnc_AI_patrol;};
						if (STB_DebugEnabled) then {[_grp, _markerIconType, _markerText] spawn STB_fnc_debug_markGroup;};	
					};
					case "garrison":
					{
						if (!_isVehicle) then {[_grp, _parameters] spawn STB_fnc_AI_garrison;};	
						if (STB_DebugEnabled) then {[_grp, _markerIconType, _markerText] spawn STB_fnc_debug_markGroup;};
					};
					case "sad":
					{
						[_grp, _parameters] spawn STB_fnc_AI_sad;
						if (STB_DebugEnabled) then {[_grp, _markerIconType, _markerText] spawn STB_fnc_debug_markGroup;};							
					};
					case "move":
					{
						[_grp,_parameters] spawn STB_fnc_AI_move;
						if (STB_DebugEnabled) then {[_grp, _markerIconType, _markerText] spawn STB_fnc_debug_markGroup;};
					};
					case "none": 
					{
						if (STB_DebugEnabled) then {[_grp, _markerIconType, _markerText] spawn STB_fnc_debug_markGroup;};
						_grp setVariable ["STB_AIMode", "none"];
					};
					default 
					{
						if (STB_DebugEnabled) then {[_grp, _markerIconType, "none"] spawn STB_fnc_debug_markGroup;};
						_grp setVariable ["STB_AIMode", "none"];
						systemChat format ["STB_Debug (%1) - Error in STB_fnc_AI_spawnAI: bad AI mode selected - units are stationary", time];
					};
				};
				
			};
		};	
	} forEach _markerArray;	
	
	publicVariable "STB_SpawnedGroups";	
	_createdUnits = [];
	{_createdUnits = _createdUnits + units _x} forEach _createdGroups;	
	if (STB_DebugEnabled && count _createdGroups > 0) then {systemChat format ["STB_Debug (%1) - Spawning %2 groups (%3 units)", time, count _createdGroups, count _createdUnits];};
	_createdGroups;		
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	************************	LOWER LEVEL FUNCTIONS	 ************************

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

STB_fnc_AI_getGroupInfo =
{	
	_faction = _this select 0;
	_groupClass = _this select 1;
	_groupType = _this select 2;
	
	// create a random variable
	_classIndex = floor random count STB_ClassList;	
	
	// randomise class if requested
	if (_groupClass == "random") then {
		_groupClass = STB_ClassList call BIS_fnc_selectRandom;
	};
	
	// assign default class and type
	_classArray = STB_Infantry select _faction;
	_class = _classArray select 0; // infantry array
	_side = _classArray select 1; // side
	_group = _class select 0; // actual units (riflesquad)
	_isVehicle = false; // used to decide whether we spawn with BIS_fnc_spawnVehicle or BIS_fnc_spawnGroup
	_isAir = false; // used to do slightly different things for air units
	_isStatic = false; // used to do block patrol waypoints from being given to static units
	_isFW = false; // used give extra initial speed to fw aircraft
	
	// assign correct AI array according to selected class
	switch (_groupClass) do {
	
		case "infantry": 
		{
			_classArray = STB_Infantry select _faction;			
			_class = _classArray select 0; 
			_side = _classArray select 1; 		
			_group = switch (_groupType) do {
				case "section": {_class select 0};
				case "weapons": {_class select 1};
				case "fireteam": {_class select 2};
				case "at": {_class select 3};
				case "aa": {_class select 4};
				case "sentry": {_class select 5};
				case "sniper": {_class select 6};
				case "mortar": {_class select 7};
				case "random": {_class call BIS_fnc_selectRandom};
				default {_class select 0};
			};			
		};
		case "motorized": 
		{
			_classArray  = STB_Motorized select _faction;			
			_class = _classArray select 0; 
			_side = _classArray select 1;
			_group = switch (_groupType) do {
				case "section": {_class select 0};
				case "fireteam": {_class select 1};
				case "at": {_class select 2};
				case "aa": {_class select 3};
				case "hmg": {_class select 4};
				case "gmg": {_class select 5};
				case "mortar": {_class select 6};
				case "random": {_class call BIS_fnc_selectRandom};
				default {_class select 0};
			};				
		};
		case "mechanized": 
		{
			_classArray  = STB_Mechanized select _faction;			
			_class = _classArray select 0; 
			_side = _classArray select 1;
			_group = switch (_groupType) do {
				case "section": {_class select 0};
				case "at": {_class select 1};
				case "aa": {_class select 2};
				case "support": {_class select 3};
				case "random": {_class call BIS_fnc_selectRandom};
				default {_class select 0};
			}; 
		};
		case "vehicle": 
		{
			_classArray  = STB_GroundVehicles select _faction;			
			_class = _classArray select 0; 
			_side = _classArray select 1;
			_group = switch (_groupType) do {
				case "unarmed": {_class select 0};
				case "light": {_class select 1};
				case "medium": {_class select 2};
				case "heavy": {_class select 3};
				case "random": {_class call BIS_fnc_selectRandom};
				default {_class select 0};
			}; 
			_isVehicle = true;
		};
		case "air": 
		{
			_classArray  = STB_AirVehicles select _faction;			
			_class = _classArray select 0; 
			_side = _classArray select 1;
			_group = switch (_groupType) do {
				case "transport": {_class select 0};
				case "rw_cas": {_class select 1};
				case "fw_cas": {_class select 2};
				case "random": {_class call BIS_fnc_selectRandom};
				default {_class select 0};
			}; 
			_isVehicle = true;
			_isAir = true;
			if ((_group select 0) == ((_class select 2) select 0)) then {_isFW = true};
		};
		case "static": 
		{
			_classArray  = STB_StaticWeapons select _faction;			
			_class = _classArray select 0; 
			_side = _classArray select 1;
			_group = switch (_groupType) do {
				case "mortar": {_class select 0};
				case "hmg": {_class select 1};
				case "gmg": {_class select 2};
				case "at": {_class select 3};
				case "aa": {_class select 4};
				case "random": {_class call BIS_fnc_selectRandom};
				default {_class select 0};
			}; 
			_isVehicle = true;
			_isStatic = true;
		};
		default {};
	
	};	
	
	_return = [_group,_side,_isVehicle,_isAir,_isStatic,_isFW];
	_return;
};

STB_fnc_AI_patrol = 
{
	/*
		Assigns patrol waypoints for land based units
		
		_grp is the group you want to patrol
		_params is an array as follows:
			[center (obj/marker/pos), radius (number), [optional] timeout (number)]
			
		call on any AI group as follows: 
		[myGroupName, ["myMarkerName", 500]] spawn STB_fnc_AI_patrol;
	*/

	// get params
	_grp = _this select 0;
	_params = _this select 1;
	
	// extract params
	_centre = _params select 0;
	_radius = _params select 1;
	_timeout = if (count _params <= 2) then {10} else {_params select 2};
	_debug = STB_DebugEnabled;

	// convert center marker to pos array
	if (typeName _centre == "STRING") then {
	
		if (toLower _centre == "self") then {
			_centre = getPos leader _grp;
		} else {
			_centre = _centre call STB_fnc_ancillary_toPosArray;
		};
		
	} else {
	
		_centre = _centre call STB_fnc_ancillary_toPosArray;
	};

	// create unique variable name for each instance of the script
	_varName = "patrolWaypoint" call STB_fnc_ancillary_randomName;
	
	// set variable for the AI mode 
	_grp setVariable ["STB_AIMode", "patrol"];
	
	// make sure it is not already in use
	while {!isNil _varName} do {_varName = "patrolWaypoint" call STB_fnc_ancillary_randomName;};

	// start main loop:
	while {{alive _x} count units _grp > 0} do {

		// declare the unique variable and set it to false
		call compile format ["%1 = false;", _varName];

		// debug hint
		if (_debug) then {systemChat format ["Creating patrol WP for group: %1", _grp]};

		// choose position
		_waypointPos = [_centre,_radius] call STB_fnc_ancillary_addNoise2D;
		// check position is not on water
		while {surfaceIsWater _waypointPos} do {_waypointPos = [_centre,_radius] call STB_fnc_ancillary_addNoise2D;};
		
		// create a waypoint
		_wp = _grp addWaypoint [_waypointPos, 0];
		_grp setCurrentWaypoint _wp;

		// set waypoint attributes
		_wp setWaypointType "MOVE"; // waypoint type: move 
		_wp setWaypointCombatMode "RED"; // reaction to threat: open fire, engage at will 
		_wp setWaypointSpeed "LIMITED"; // patrol speed: slow
		_wp setWaypointBehaviour "SAFE"; // behaviour: guns down, walking pace
		_wp setWaypointCompletionRadius 10; // how close to waypoint unit has to be to complete it: 10 meters 

		// make the waypoint change the unique variable to true when it completes
		_wp setWaypointStatements ["true", format ["%1 = true", _varName]];
		
		// wait for the waypoint to complete (by checking the unique var)
		//waitUntil {call compile _varName};
		while {!(call compile _varName)} do {sleep 1};
		// sleep for duration of waypoint timeout
		sleep _timeout;	
	};
};

STB_fnc_AI_move = 
{
	/*
		Assigns a move waypoint. 
		
		_grp is the group you want to patrol
		_params is an array as follows:
			[target (obj/marker/pos), radius (number), [optional] go slow? (boolean), [optional] patrol afterward? (boolean)]
		//DDZ EDIT: Replaced optional patrol afterward? boolean with NextOrders system. Using the _doAfter optional param [typeOfOrder (string),nextOrderMkr (string - "markername")]
			[target (obj/marker/pos), radius (number), [required if setting NextOrders] go slow? (boolean), [optional] NextOrders params (array) [typeOfOrder (string),nextOrderMkr (string - "markername"),[optional nested] NextOrders params (array) [typeOfOrder (string),nextOrderMkr (string - "markername")]]
			See line 593 + for string type options.
			Added: option to chain NextOrders together to create mulitple orders in a single spawn of the function.
				All NextOrders are compatible with call or spawn with options utilising sleep wrapped in spawn code block.
				NextOrders can be extended by adding a new entry to the switch do case.
		call or spawn on any AI group as follows: 
		[myGroupName, ["myMarkerName", 10,false,['none','']]] spawn STB_fnc_AI_move;
	*/

	_grp = _this select 0;
	_params = _this select 1;
	
	_target = _params select 0;
	_radius = _params select 1;
	_goSlow = if (count _params <= 2) then {false} else {_params select 2};
	_doAfter = if (count _params <= 3) then {["none","self",["",""]]} else {_params select 3};
	
	_grp setVariable ["STB_AIMode", "move"];
	_center = _target call STB_fnc_ancillary_toPosArray;	
	
	_wp = _grp addWaypoint [_center, _radius];
	_wp setWaypointType "MOVE";
	_wp setWaypointCombatMode "RED"; //DDZ EDIT changed combat of move waypoints so priority to waypoint is given over engaging targets.
	_wp setWaypointCompletionRadius 5;
	
	if (_goSlow) then {
		_wp setWaypointSpeed "LIMITED"; 
		_wp setWaypointBehaviour "SAFE"; 
	} else {	
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointSpeed "FULL";
	};
	_nextOrderMkr = if(count _doAfter <= 1) then {"Nearby"} else {(_doAfter select 1) };
	_then = if(count _doAfter <= 2) then {["",""]} else {(_doAfter select 2) };
	_next = "";
	sleep 2;
	switch (_doAfter select 0) do {
		case "none" : {
			_wp setWaypointStatements ["true", ""];
		};
		case "move" : {
			_next = "[(group this),[" + (str _nextOrderMkr) + ", 0,false,"+ (str _then) +"]] spawn STB_fnc_AI_move;";
			
			_wp setWaypointStatements ["true", _next];
		};
		case "sad" : {
			_next = "[(group this),[" + (str _nextOrderMkr) + ", 0,"+ (str _then) +"]] spawn STB_fnc_AI_sad;"; 
			
			_wp setWaypointStatements ["true", _next];
		};
		case "buildingsearch" : {
			_next = " [this, 100, 200, " + (str _nextOrderMkr) + ", " + (str _nextOrderMkr) + ", 100, false, 'SAFE', 'YELLOW', 'LIMITED', 'FILE', 0, 25, 0, [true,100,25,5,1]] execVM 'STB\Scripts\USPS.sqf';";
			_wp setWaypointStatements ["true", _next];
		};
		case "garrisonNearby" : {
			_next = "this spawn {sleep 60; [(group _this),[100,true]] spawn STB_fnc_AI_garrison;}";
			hint ("Updated " + _next);
			_wp setWaypointStatements ["true", _next];
		};
		case "patrol100" : {
			_next = "[(group this),[" + (str _nextOrderMkr) + ", 100, 30]] spawn STB_fnc_AI_patrol;";
			_wp setWaypointStatements ["true", _next];
		};
		case "patrol250" : {
			
			_next = "[(group this), [" + (str _nextOrderMkr) + ", 250, 30]] spawn STB_fnc_AI_patrol;";
			_wp setWaypointStatements ["true", _next ];
		};
		case "fallback" : {
			_next = "{_x allowFleeing 1;}forEach thisList; [(group this), [" + (str _nextOrderMkr) + ", 10]] spawn STB_fnc_AI_sad;";
			_wp setWaypointStatements ["true || (({alive _x}count thisList) < 3)",_next];
		};
		case "fallbackpatrol250" : {
			
			_next = "{_x allowFleeing 1;}forEach thisList; [(group this), [" + (str _nextOrderMkr) + ", 10,['patrol250','self']]] spawn STB_fnc_AI_sad;";
			_wp setWaypointStatements ["true || (({alive _x}count thisList) < 3)",_next];
		};
		case "fallbackdelete" : {
			_next = "{_x allowFleeing 1;}forEach thisList; [(group this), [" + (str _nextOrderMkr) + ", 10,['delete300s','']]] spawn STB_fnc_AI_sad;";
			_wp setWaypointStatements ["true || (({alive _x}count thisList) < 3)", _next ];
		};
		case "delete300s" : {
			_wp setWaypointStatements ["true", "thisList spawn {sleep 300; {deleteVehicle _x} forEach _this;};"];
		};
		default {if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - MOVE Complete - Group %2 has no contacts. New Orders not valid : %3", time, _grp, _next];};};
	};
	if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - MOVE orders recieved - Group %2 next orders : %3", time, _grp, _next];};
	
	if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - Group %2 is moving out", time, _grp];};	
	true;
};

STB_fnc_AI_garrison =
{
	/*
		Garrisons units form a given group in thier nearest building
		
		_grp is the group you want to garrison
		_params is an array as follows:
			[radius] - number in m in which to search for buildings
			
		call on any AI group as follows: 
		[GroupName, [100, true]] spawn	STB_fnc_AI_garrison;
		
		[NOTE: This script is a modified version of ZenOccupyHouse.sqf by Zenophon]
		
	*/
	
	_grp = _this select 0;
	_params = _this select 1; 	
	
	EYE_HEIGHT = 1.53;
	CHECK_DISTANCE = 5;
	FOV_ANGLE = 15;
	ROOF_CHECK = 4;
	ROOF_EDGE = 2;

	private ["_center", "_units", "_buildingRadius", "_putOnRoof", "_fillEvenly", "_Zen_ExtendPosition", "_buildingsArray", "_buildingPosArray", "_buildingPositions", "_posArray", "_unitIndex", "_j", "_building", "_posArray", "_randomIndex", "_housePos", "_startAngle", "_i", "_checkPos", "_hitCount", "_isRoof", "_edge", "_k", "_unUsedUnits"];
	if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - Group %2 is occupying buildings", time, _grp];};
	
	_center = getPos leader _grp;
	_units = units _grp;
	_buildingRadius = _params select 0;
	_deleteUnused = if (count _params <= 1) then {false} else {_params select 1};
	_putOnRoof = true;
	_fillEvenly = true;
	
	_attempt = 1;

	_grp setVariable ["STB_AIMode", "garrison"];
	STB_SpawnedGroups = STB_SpawnedGroups + [_grp];
	
	_Zen_ExtendPosition = {
		private ["_center", "_dist", "_phi"];

		_center = _this select 0;
		_dist = _this select 1;
		_phi = _this select 2;

		([(_center select 0) + (_dist * (cos _phi)),(_center select 1) + (_dist * (sin _phi)), (_this select 3)])
	};

	if (_buildingRadius < 0) then {
		_buildingsArray = [nearestBuilding _center];
	} else {
		_buildingsArray = nearestObjects [_center, ["house"], _buildingRadius];
	};

	_buildingPosArray = [];
	{
		_buildingPositions = 0;
		for "_i" from 0 to 100 do {
			if ((_x buildingPos _buildingPositions) isEqualTo [0,0,0]) exitWith {};
			_buildingPositions = _buildingPositions + 1;
		};

		_posArray = [];
		for "_i" from 0 to (_buildingPositions - 1) do {
			_posArray set [_i, _i];
		};

		_buildingPosArray set [_forEachIndex, _posArray];
	} forEach _buildingsArray;

	_unitIndex = 0;
	for [{_j = 0}, {(_unitIndex < count _units) && {(count _buildingPosArray > 0)}}, {_j=_j+1}] do {
		scopeName "for";

		_building = _buildingsArray select (_j % (count _buildingsArray));
		_posArray = _buildingPosArray select (_j % (count _buildingsArray)); 

		if (count _posArray == 0) then {
			_buildingsArray set [(_j % (count _buildingsArray)), 0];
			_buildingPosArray set [(_j % (count _buildingPosArray)), 0];
			_buildingsArray = _buildingsArray - [0];
			_buildingPosArray = _buildingPosArray - [0];
		};

		while {(count _posArray) > 0} do {
			scopeName "while";
			if (_unitIndex >= count _units) exitWith {};

			_randomIndex = floor random count _posArray;
			_housePos = _building buildingPos (_posArray select _randomIndex);
			_housePos = [(_housePos select 0), (_housePos select 1), (_housePos select 2) + (getTerrainHeightASL _housePos) + EYE_HEIGHT];

			_posArray set [_randomIndex, _posArray select (count _posArray - 1)];
			_posArray resize (count _posArray - 1);

			_startAngle = (round random 10) * (round random 36);
			for "_i" from _startAngle to (_startAngle + 350) step 10 do {
				_checkPos = [_housePos, CHECK_DISTANCE, (90 - _i), (_housePos select 2)] call _Zen_ExtendPosition;
				if !(lineIntersects [_checkPos, [_checkPos select 0, _checkPos select 1, (_checkPos select 2) + 25], objNull, objNull]) then {
					if !(lineIntersects [_housePos, _checkPos, objNull, objNull]) then {
						_checkPos = [_housePos, CHECK_DISTANCE, (90 - _i), (_housePos select 2) + (CHECK_DISTANCE * sin FOV_ANGLE / cos FOV_ANGLE)] call _Zen_ExtendPosition;
						if !(lineIntersects [_housePos, _checkPos, objNull, objNull]) then {
							_hitCount = 0;
							for "_k" from 30 to 360 step 30 do {
								_checkPos = [_housePos, 20, (90 - _k), (_housePos select 2)] call _Zen_ExtendPosition;
								if (lineIntersects [_housePos, _checkPos, objNull, objNull]) then {
									_hitCount = _hitCount + 1;
								};

								if (_hitCount >= ROOF_CHECK) exitWith {};
							};

							_isRoof = (_hitCount < ROOF_CHECK) && {!(lineIntersects [_housePos, [_housePos select 0, _housePos select 1, (_housePos select 2) + 25], objNull, objNull])};
							if (!(_isRoof) || {((_isRoof) && {(_putOnRoof)})}) then {
								if (_isRoof) then {
									_edge = false;
									for "_k" from 30 to 360 step 30 do {
										_checkPos = [_housePos, ROOF_EDGE, (90 - _k), (_housePos select 2)] call _Zen_ExtendPosition;
										_edge = !(lineIntersects [_checkPos, [(_checkPos select 0), (_checkPos select 1), (_checkPos select 2) - EYE_HEIGHT - 1], objNull, objNull]);

										if (_edge) exitWith {
											_i = _k;
										};
									};
								};

								if (!(_isRoof) || {_edge}) then {
									(_units select _unitIndex) setPosASL [(_housePos select 0), (_housePos select 1), (_housePos select 2) - EYE_HEIGHT];
									(_units select _unitIndex) setDir (_i );

									if (_isRoof) then {
										(_units select _unitIndex) setUnitPos "MIDDLE";
									} else {
										(_units select _unitIndex) setUnitPos "UP";
									};

									(_units select _unitIndex) lookAt ([_housePos, CHECK_DISTANCE, (90 - _i), (_housePos select 2) - (getTerrainHeightASL _housePos)] call _Zen_ExtendPosition);
									doStop (_units select _unitIndex);
									
									// if position is occupied, move on to another
									_nearestDistance = 10000;									
									{
										_distance = _x distance (_units select _unitIndex);
										if (_x != (_units select _unitIndex) && _distance < _nearestDistance) then {
											_nearestDistance = _distance;
										};										
									} forEach allUnits;
									
									if (_nearestDistance > 2) then {
										_unitIndex = _unitIndex + 1;
										_attempt = 1;										
									} else {
										if (_attempt < 6) then {
											_attempt = _attempt + 1;
										} else {
											_attempt = 1; deleteVehicle (_units select _unitIndex); _unitIndex = _unitIndex + 1;
										};
									};
									
									if (_fillEvenly) then {
										breakTo "for";
									} else {
										breakTo "while";
									};
								};
							};
						};
					};
				};
			};
		};
	};

	// get unused units
	_unUsedUnits = [];

	for [{_i = _unitIndex}, {_i < count _units}, {_i=_i+1}] do {
		_unUsedUnits set [(count _unUsedUnits), (_units select _i)];
	};
	
	// put remaining units on patrol or delete them
	if (count _unUsedUnits > 0) then {
	
		if (_deleteUnused) then {
		
			{deleteVehicle _x} forEach _unUsedUnits;
			
		} else {	
		
			_groupName = "unusedGarGroup_" call STB_fnc_ancillary_randomName;		
			{_groupName = group _x} forEach _unUsedUnits;
			_groupName setVariable ["STB_AIMode","patrol"];
			[_groupName, ["self",25]] spawn STB_fnc_AI_patrol;
			
			if (STB_DebugEnabled) then {
				[_groupName, 1, "patrol"] spawn STB_fnc_debug_markGroup;
			};
		};
		
	};

	_unUsedUnits;
};

STB_fnc_AI_sad =
{
	/*
		Assigns Search and Destroy waypoints

		_grp is the group that will be given waypoints
		_params is an array as follows:
			[target (obj/marker/pos), radius (number)]

		call on any AI group as follows:
		[myGroupName, [player, 500]] spawn STB_fnc_AI_sad;
	*/

	_grp = _this select 0;
	_params = _this select 1;

	_target = _params select 0;
	_radius = _params select 1;
	//DDZ EDIT - allow for units to patrol after completing the SAD task.
	_doAfter = if (count _params <= 2) then {["none","self",["",""]]} else {_params select 2};
	
	_target = _target call STB_fnc_ancillary_toPosArray;
	
	_grp setVariable ["STB_AIMode", "sad"];
	
	if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - Group %2 is searching for enemy", time, _grp];};	
	_grpOrigin = getPos leader _grp;
	_sadWP = _grp addWaypoint [_target, _radius];
	_sadWP setWaypointType "SAD";
	_sadWP setWaypointBehaviour "AWARE";
	_sadWP setWaypointSpeed "FULL";
	_sadWP setWaypointCombatMode "RED";

	_nextOrderMkr = if(count _doAfter <= 1) then {"Nearby"} else {(_doAfter select 1) };
	_then = if(count _doAfter <= 2) then {["",""]} else {(_doAfter select 2) };
	_next = "";
	switch (_doAfter select 0) do {
		case "none" : {
			_sadWP setWaypointStatements ["true", ""];
		};
		//The NextOrders here are chainable.
		case "move" : {
			_next = "[(group this),[" + (str _nextOrderMkr) + ", 0,false,"+ (str _then) +"]] spawn STB_fnc_AI_move;";
			
			_sadWP setWaypointStatements ["true", _next];
		};
		case "sad" : {
			_next = "[(group this),[" + (str _nextOrderMkr) + ", 0,"+ (str _then) +"]] spawn STB_fnc_AI_sad;"; 
			
			_sadWP setWaypointStatements ["true", _next];
		};
		case "fallback" : {
			_next = "[(group this), [" + (str _nextOrderMkr) + ", 10,"+ (str _then) +"]] spawn STB_fnc_AI_sad;";
			_sadWP setWaypointStatements ["true || (({alive _x}count thisList) < 3)",_next];
		};
		
		//The NextOrders below are final and no other orders will be accepted after them.
		case "patrol100" : {
			_next = "[(group this),[" + (str _nextOrderMkr) + ", 100]] spawn STB_fnc_AI_patrol;";
			_sadWP setWaypointStatements ["true", _next];
		};
		case "patrol250" : {
			
			_next = "[(group this), [" + (str _nextOrderMkr) + ", 250]] spawn STB_fnc_AI_patrol;";
			_sadWP setWaypointStatements ["true", _next ];
		};
		case "buildingsearch" : {
			_next = " [this, 100, 200, " + (str _nextOrderMkr) + ", " + (str _nextOrderMkr) + ", 100, false, 'SAFE', 'RED', 'LIMITED', 'FILE', 0, 30, 0, [true,100,50,5,1]] execVM 'STB\Scripts\USPS.sqf';";
			_sadWP setWaypointStatements ["true", _next];
		};
		case "fallbackpatrol250" : {
			
			_next = "[(group this), [" + (str _nextOrderMkr) + ", 10,['patrol250','self']]] spawn STB_fnc_AI_sad;";
			_sadWP setWaypointStatements ["true || (({alive _x}count thisList) < 3)",_next];
		};
		case "retreatdelete" : {
			_next = "[]spawn {{_x allowFleeing 1;}forEach thisList; sleep 60; {_x allowFleeing 0;}forEach thisList; sleep 1; [(group this), [" + (str _nextOrderMkr) + ", 10,['delete300s','']]] spawn STB_fnc_AI_sad;}; ";
			_sadWP setWaypointStatements ["(({alive _x}count thisList) < 3)", _next ];
		};
		case "delete300s" : {
			_sadWP setWaypointStatements ["true", "thisList spawn {sleep 300; {if(!(vehicle _x == _x))then { deleteVehicle (vehicle _x); deleteVehicle _x; }else {deleteVehicle _x;}} forEach _this;};"];
		};
		default {if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - SAD Complete - Group %2 has no contacts. New Orders not valid or undefined : %3", time, _grp, _next];};};
	};
	if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - SAD orders recieved - Group %2 next orders : %3 to %4 -> %5", time, _grp, (_doAfter select 0),_nextOrderMkr,_then];};
	
};

// set AI skill
STB_fnc_AI_setSkillArray =
{               
   {_this setSkill _x} forEach STB_AISkillArray;	
};

// remove all waypoints
STB_fnc_AI_removeAllWaypoints = 
{
	_group = _this;
	while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};
	true;
};

// find all vehicle drivers
STB_fnc_AI_vehicleLightsOn =
{
	{
		_vehicle = vehicle _x;
		if (_x != _vehicle && _x == driver _vehicle && ((getPos _x) select 2) < 10) then 
		{
			_x setBehaviour "SAFE";
			_x action ["LightON", _vehicle];
		};				
	} forEach allUnits;	
	true;
};

// force use of flashlights
STB_fnc_AI_forceFlashlights =
{
	{
		private "_unit";
		_unit = _x;		

		if (side _unit != WEST) then {
			_nvgs = if (side _x == EAST) then {"NVGoggles_OPFOR"} else {"NVGoggles_INDEP"};
			_unit unassignItem _nvgs;
			_unit removeItem _nvgs;
			_unit removeWeapon "Binocular";
			_unit unassignItem "acc_pointer_IR";
			_unit removePrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "acc_flashlight";
			_unit assignItem "acc_flashlight";
			if (((getPos _x) select 2) < 10) then {_unit setBehaviour "SAFE"};
			_unit enableGunLights "ForceOn";
		};
	} foreach allunits;
	true;
};

// Define AI
call compile preprocessFileLineNumbers "STB\STB_definitions\STB_AI_definitions.sqf";
if(STB_DebugEnabled) then {
	systemchat format ["STB_Debug (%1) - Default definitions loaded %2 types", time, count STB_Infantry];
};
