/*
	STB_intel.sqf
	
	Contains functions for mission intelligence (e.g. briefings, troop structure, group markers)
	These functions rely on variables being set at unit init via setVariable. They
	will be called automatically according to global options in STB_init.sqf
	
*/

// STB Framework Version Number and Credits Tab in briefing

STB_fnc_intel_stbCredits = {

	_briefingString = 	"Made with <font color='#FFFF00'>STB Mission Framework</font><br/><br/>" +
						"Version: <font color='#FFFF00'>" + STB_VersionString + "</font><br/><br/>" +
						"Developed by <font color='#FFFF00'>DOM.STB</font> and <font color='#FFFF00'>Howl</font><br/>for 3 Commando Brigade";	
	
	player createDiaryRecord ["Diary", ["STB Mission Framework", _briefingString]];

};

////////// Troop Structure for briefing //////////
 
STB_fnc_intel_getTroopStructure =
{
	/*
		Called in STB_client_init.sqf. 
		Will detect any playable unit with the the following variable defined on it: STB_Description".
		
		In unit init, add the line
			this setVariable ["STB_Description", "Alpha 1-2 Rifleman", true];
		
		The function will find all the playable units with these variables defined and generate a new briefing tab
		containing an alphabetised list of all the roles in game and the player names that are occupying them.
		
		Use a three or more character group identifier to keep groups together in the briefing tab, e.g. 
			1-1 
			Alpha
			0-Coy
		The function will add space between units with different first three letters.
	*/

	// check if client
	if (!hasInterface) exitWith {};

	// init arrays
	_troopStructureWest = [];
	_troopStructureEast = [];
	_troopStructureResistance = [];
	_troopStructureCivilian = [];
	
	{
		_description = _x getVariable "STB_Description";		
		
		if (!isNil "_description") then {
			switch (side _x) do {
				case west:
				{
					_troopStructureWest = _troopStructureWest + ["<font color='#5555FF'>" + _description + ":</font> " + name _x + "<br/>"];
				};
				case east:
				{
					_troopStructureEast = _troopStructureEast + ["<font color='#FF3333'>" + _description + ":</font> " + name _x + "<br/>"];
				};
				case resistance:
				{
					_troopStructureResistance = _troopStructureResistance + ["<font color='#33FF33'>" + _description + ":</font> " + name _x + "<br/>"];
				};
				case civilian:
				{				
					_troopStructureCivilian = _troopStructureCivilian + ["<font color='#CC21BE'>" + _description + ":</font> " + name _x + "<br/>"];
				};
			};
		};
	} forEach playableUnits;
	
	// if none are found, exit
	if (count (_troopStructureWest + _troopStructureEast + _troopStructureResistance + _troopStructureCivilian) == 0) exitWith {};
	
	// generate a string for the briefing
	_briefingString = "";
	_firstletter = -1;
	_secondletter = -1;
	_thirdletter = -1;
	
	// WEST
	if (count _troopStructureWest > 0) then {
		_troopStructureWest = _troopStructureWest call BIS_fnc_sortAlphabetically;
		_briefingString = _briefingString + format ["---------- WEST (%1 players) -------------------------<br/>", count _troopStructureWest];
		{	// Add extra space between different groups (i.e. have different first/second/third letters)
				if (_firstLetter != (toArray _x) select 22 || _secondLetter != (toArray _x) select 23 || _thirdLetter != (toArray _x) select 24) then {_briefingString = _briefingString + "<br/>"};
				// get new first letter
				_firstLetter = (toArray _x) select 22; 
				_secondletter = (toArray _x) select 23;
				_thirdletter = (toArray _x) select 24;
				_briefingString = _briefingString + _x;		
		} forEach _troopStructureWest;
		_briefingString = _briefingString + "<br/>";
	};
	
	// EAST
	_firstletter = -1;
	_secondletter = -1;
	_thirdletter = -1;
	
	if (count _troopStructureEast > 0) then {
		_troopStructureEast = _troopStructureEast call BIS_fnc_sortAlphabetically;
		_briefingString = _briefingString + format ["---------- EAST (%1 players) -------------------------<br/>", count _troopStructureEast];
		{	// Add extra space between different groups (i.e. have different first letters)
				if (_firstLetter != (toArray _x) select 22 || _secondLetter != (toArray _x) select 23 || _thirdLetter != (toArray _x) select 24) then {_briefingString = _briefingString + "<br/>"};
				// get new first letter
				_firstLetter = (toArray _x) select 22; 
				_secondletter = (toArray _x) select 23;
				_thirdletter = (toArray _x) select 24;
				_briefingString = _briefingString + _x;					
		} forEach _troopStructureEast;
		_briefingString = _briefingString + "<br/>";
	};
		
	// Resistance
	_firstletter = -1;
	_secondletter = -1;
	_thirdletter = -1;
	
	if (count _troopStructureResistance > 0) then {
		_troopStructureResistance = _troopStructureResistance call BIS_fnc_sortAlphabetically;
		_briefingString = _briefingString + format ["---------- INDEPENDANT (%1 players) -------------<br/>", count _troopStructureResistance];
		{	// Add extra space between different groups (i.e. have different first letters)
				if (_firstLetter != (toArray _x) select 22 || _secondLetter != (toArray _x) select 23 || _thirdLetter != (toArray _x) select 24) then {_briefingString = _briefingString + "<br/>"};
				// get new first letter
				_firstLetter = (toArray _x) select 22;
				_secondletter = (toArray _x) select 23;
				_thirdletter = (toArray _x) select 24;				
				_briefingString = _briefingString + _x;					
		} forEach _troopStructureResistance;
		_briefingString = _briefingString + "<br/>";
	};
	
	// Civilian
	_firstletter = -1;
	_secondletter = -1;
	_thirdletter = -1;
	
	if (count _troopStructureCivilian > 0) then {
		_troopStructureCivilian = _troopStructureCivilian call BIS_fnc_sortAlphabetically;
		_briefingString = _briefingString + format ["---------- CIVILIAN (%1 players) --------------------<br/>", count _troopStructureCivilian];
		{	// Add extra space between different groups (i.e. have different first letters)
				if (_firstLetter != (toArray _x) select 22 || _secondLetter != (toArray _x) select 23 || _thirdLetter != (toArray _x) select 24) then {_briefingString = _briefingString + "<br/>"};
				// get new first letter
				_firstLetter = (toArray _x) select 22;
				_secondletter = (toArray _x) select 23;	
				_thirdletter = (toArray _x) select 24;
				_briefingString = _briefingString + _x;		
		} forEach _troopStructureCivilian;
		_briefingString = _briefingString + "<br/>";
	};
	
	// create briefing entry
	player createDiaryRecord ["Diary", ["Company Structure", _briefingString]];
	
};

////////// Local Group Markers //////////

STB_fnc_intel_groupMarkers =
{
	/*
		Called in STB_client_init.sqf. 
		Will detect any playable unit with the the following variable defined on it: STB_GroupMarker.
		
		In group leader init, add the line
			this setVariable ["STB_GroupMarker", paramters, true];
			
		Only necessary for this line to be in one unit per group (e.g. group leader). If this leader
		gets killed, marker will dynamically switch to the new group leader. 
			
		parameters is an array containing the following elements:
		
		(required)
			Marker Symbol - String - "infantry", "motorized", "mechanized", "armored", "artillery"
									"helicopter", "plane", "hq" or "recon"
			Marker Colour - String - "red", "green", "yellow", "blue", "orange", "purple", 
									"white", "black", "grey", "pink", or "brown".
			Marker Text	-	String - e.g. "Alpha"

		e.g.
			this setVariable ["STB_GroupMarker", [0,"blue","ASL"], true];
		for a blue infantry marker on the unit's group leader's position, with the text "ASL".
		
		The function will find all the playable units with these variables defined and generate group markers
		on client machines.
	*/
	
	// check if client
	if (!hasInterface || STB_cancelGroupMkrs) exitWith {};
	
	// if respawn delete all markers
	if (!isNil "STB_LocalGroupMarkers") then {
		{deleteMarkerLocal _x} forEach STB_LocalGroupMarkers;
	};
	
	// init arrays
	_groupArrayTemp = [];
	_groupArray = [];	

	// find all groups to be marked
	{
		// ignore different sides
		if (side _x == side player) then {
			_params = _x getVariable "STB_GroupMarker";
			if (!isNil "_params") then {
				_groupArrayTemp = _groupArrayTemp + [[group _x, _params]];
			};	
		};
	} forEach allUnits;
	
	// remove duplicates by copying into a new array
	for [{_i=0},{_i<(count _groupArrayTemp)},{_i=_i+1}] do {
		_grp = _groupArrayTemp select _i;		
		// if the group is already copied in, don't copy again
		if (!(_grp in _groupArray)) then {
			_groupArray = _groupArray + [_grp];
		};
	};	
	
	// set up globals for monitoring groups and storing markers
	STB_LocalGroupMarkers = [];
	STB_LocalMarkedGroups = [];
	STB_GlobalMarkedGroups = _groupArray;
	
	// if game is already in progress, re-broadcast
	if (STB_isJIP) then {publicVariable "STB_GlobalMarkedGroups"};
	
	// start loop to monitor new groups and mark
	while {true} do {	
		{
			if (!(_x in STB_LocalMarkedGroups)) then {
				if (side leader (_x select 0) == side player) then {
					_x spawn STB_fnc_intel_markGroupLocal;
				} else {					
					STB_LocalMarkedGroups = STB_LocalMarkedGroups + [_x];
				};
			};				
		} forEach STB_GlobalMarkedGroups;
		sleep 5.61;		
	};	
};

////////// Speciaist Markers //////////

STB_fnc_intel_specialMarkers =
{
	/*
		Called in STB_client_init.sqf. 
		Will detect any playable unit with the the following variable defined on it: STB_SpecialMarker.
		
		In unit/vehicle init, add the line
			this setVariable ["STB_SpecialMarker", paramters, true];
			
		The main difference here is that it marks a specific unit rather than a dynamically chosen group leader
		and updates until that unit is dead, regardless of the state of the rest of that unit's group.
			
		Use this version for things like medic markers or if you want to tie a marker to a vehicle rather
		than a group or player.
			
		parameters is an array containing the following elements:
		
		(required)
			Marker Symbol - String - "infantry", "motorized", "mechanized", "armored", "artillery"
									"helicopter", "plane", "hq" or "recon"
			Marker Colour - String - "red", "green", "yellow", "blue", "orange", "purple", 
									"white", "black", "grey", "pink", or "brown".
			Marker Text	-	String - e.g. "Alpha"

		e.g.
			this setVariable ["STB_SpecialMarker", ["medical","black","A-Med"], true];
		for a black medic marker on the unit's position, with the text "A-Med".
		
		The function will find all the playable units with these variables defined and generate group markers
		on client machines.
	*/
	
	// check if client
	if (!hasInterface) exitWith {};		
	
	// if respawn delete all markers
	if (!isNil "STB_LocalSpecialMarkers") then {
		{deleteMarkerLocal _x} forEach STB_LocalSpecialMarkers;
	};
	
	// init arrays
	_unitArray = [];

	// find all groups to be marked
	{
		// ignore different sides
		if (side _x == side player) then {
			_params = _x getVariable "STB_SpecialMarker";
			if (!isNil "_params") then {
				_unitArray = _unitArray + [[_x,_params]];
			};	
		};
	} forEach allUnits;	
	
	// create globals
	STB_LocalSpecialMarkers = [];
	STB_LocalMarkedUnits = [];
	STB_GlobalMarkedUnits = _unitArray;
	
	// if game is already in progress (JIP), re-broadcast to sync markers across network
	if (STB_isJIP) then {publicVariable "STB_GlobalMarkedUnits"};
	
	// start loop to monitor new groups and mark
	while {true} do {	
		{
			if (!(_x in STB_LocalMarkedUnits)) then {
				if (side leader (_x select 0) == side player) then {
					_x spawn STB_fnc_intel_markUnitLocal;
				} else {					
					STB_LocalMarkedUnits = STB_LocalMarkedUnits + [_x];
				};
			};				
		} forEach STB_GlobalMarkedUnits;
		sleep 6.75;		
	};	
};

/////////// Marker Subfunctions ///////////////////

// subfunction for group markers
STB_fnc_intel_markGroupLocal =
{
	// group of interest
	_group = _this select 0;

	// marker params
	_markerParams = _this select 1;
	
	// derive params
	_markerIconString = toLower (_markerParams select 0);
	_markerColorString = toLower (_markerParams select 1);
	_markerText = _markerParams select 2;			
	_markerIcon = _markerIconString call STB_fnc_intel_getMarkerIcon;	
	_markerColor = 	_markerColorString call STB_fnc_intel_getMarkerColor;		

	// generate marker
	_markerName = "groupMarker_" call STB_fnc_ancillary_randomName;	
	_markerHandle = createMarkerLocal [_markerName,getPos leader _group];		
	_markerHandle setMarkerShapeLocal "ICON";
	
	// apply params
	_markerHandle setMarkerTypeLocal _markerIcon;
	_markerHandle setMarkerColorLocal _markerColor;
	_markerHandle setMarkerSizeLocal [0.5,0.5];
	_markerHandle setMarkerTextLocal _markerText;
	_markerHandle setMarkerAlphaLocal 0.75;
	
	// add to global
	STB_LocalGroupMarkers = STB_LocalGroupMarkers + [_markerName];
	STB_LocalMarkedGroups = STB_LocalMarkedGroups + [_this];
	
	// spawn function to keep marker updated
	[_markerName, _group] spawn {
		_marker = _this select 0;
		_grp = _this select 1;
		while {({alive _x} count (units _grp)) > 0} do {
			sleep 5;
			_marker setMarkerPosLocal getPos leader _grp; 
		};
		sleep 600;
		deleteMarkerLocal _marker;
	};
};

// subfunction for special markers
STB_fnc_intel_markUnitLocal =
{
	// unit of interest
	_unit = _this select 0;

	// marker params
	_markerParams = _this select 1;
	
	// derive params
	_markerIconString = toLower (_markerParams select 0);
	_markerColorString = toLower (_markerParams select 1);
	_markerText = _markerParams select 2;			
	_markerIcon = _markerIconString call STB_fnc_intel_getMarkerIcon;	
	_markerColor = 	_markerColorString call STB_fnc_intel_getMarkerColor;		

	// generate marker
	_markerName = "specialMarker_" call STB_fnc_ancillary_randomName;
	_markerHandle = createMarkerLocal [_markerName,getPos _unit];		
	_markerHandle setMarkerShapeLocal "ICON";
	
	// apply params
	_markerHandle setMarkerTypeLocal _markerIcon;
	_markerHandle setMarkerColorLocal _markerColor;
	_markerHandle setMarkerSizeLocal [0.4,0.4];
	_markerHandle setMarkerTextLocal _markerText;
	_markerHandle setMarkerAlphaLocal 0.5;
	
	// add to global
	STB_LocalSpecialMarkers = STB_LocalSpecialMarkers + [_markerName];
	STB_LocalMarkedUnits = STB_LocalMarkedUnits + [_this];
	
	// spawn function to keep marker updated
	[_markerName, _unit] spawn {
		_marker = _this select 0;
		_unit = _this select 1;
		while {alive _unit} do {
			sleep 5;
			_marker setMarkerPosLocal getPos _unit; 
		};
		sleep 600;
		deleteMarkerLocal _marker;
	};
};

///////////////// functions for deciphering parameter strings //////////////

// icons
STB_fnc_intel_getMarkerIcon =
{	_input = toLower _this;
	_output = switch (_input) do {
		case "infantry": {"b_inf"};
		case "motorized": {"b_motor_inf"};
		case "mechanized": {"b_mech_inf"};
		case "armor": {"b_armor"};
		case "helicopter": {"b_air"};
		case "plane": {"b_plane"};
		case "recon": {"b_recon"};
		case "hq": {"b_hq"};
		case "artillery": {"b_art"};
		case "medical": {"b_med"};
		default {"b_inf"};
	};
	_output;
};

// colors
STB_fnc_intel_getMarkerColor =
{	
	_input = toLower _this;
	_output = switch (_input) do {
		case "red": {"colorRed"};
		case "green": {"colorGreen"};
		case "yellow": {"colorYellow"};
		case "blue": {"colorBlue"};
		case "orange": {"colorOrange"};
		case "purple": {"colorCIV"};
		case "pink": {"colorPink"};
		case "black": {"colorBlack"};
		case "grey": {"colorGrey"};
		case "brown": {"colorBrown"};
		case "white": {"colorWhite"};
		default {"colorBlack"};
	};	
	_output;	
};

// classes
STB_fnc_intel_getLoadoutClass =
{
	_input = toLower _this;
	_output = switch (_input) do {
		case "coy":		{"Company Commander"};
		case "co": 		{"Troop Commander"};
		case "dc": 		{"Troop Sergeant"};
		case "fac":		{"Forward Air Controller"};
		case "m": 		{"Medic"};
		case "sl": 		{"Section Leader"};
		case "ftl":		{"Fire-Team Leader"};
		case "ar":		{"Autorifleman"};
		case "aar":		{"Asst. Autorifleman"};
		case "dmr":		{"Designated Marksman"};
		case "mmgg": 	{"MMG Gunner"};
		case "mmgag": 	{"MMG Asst. Gunner"};
		case "hmgg": 	{"HMG Gunner"};
		case "hmgag": 	{"HMG Asst. Gunner"};
		case "matg": 	{"Medium AT Gunner"};
		case "matag": 	{"Medium AT Asst. Gunner"};
		case "hatg": 	{"Heavy AT Gunner"};
		case "hatag": 	{"Heavy AT Asst. Gunner"};
		case "mtrg": 	{"Mortar Gunner"};
		case "mtrag": 	{"Mortar Asst. Gunner"};
		case "msamg": 	{"Medium SAM Gunner"};
		case "msamag": 	{"Medium SAM Asst. Gunner"};
		case "hsamg": 	{"Heavy SAM Gunner"};
		case "hsamag": 	{"Heavy SAM Asst. Gunner"};
		case "sn": 		{"Sniper"};
		case "sp": 		{"Spotter"};
		case "lg":		{"Long Gunner"};
		case "vc":		{"Vehicle Crew"};
		case "vd":		{"Vehicle Driver"};
		case "vg":		{"Vehicle Gunner"};
		case "pp":		{"Pilot"};
		case "pcc":		{"Air Vehicle Crew Chief"};
		case "pc":		{"Air Vehicle Crew"};
		case "eng":		{"Enginner (Demo)"};
		case "engm":	{"Enginner (Mines)"};
		case "uav":		{"UAV Operator"};
		case "div":		{"Diver"};
		case "r":		{"Rifleman"};
		case "lsw":		{"Light Support Rifleman"};
		case "car":		{"Carbiner"};
		case "smg":		{"Sub-machinegunner"};
		case "gren": 	{"Grenadier"};
		default 		{"Undefined"};	
	};
	_output;
};

// classes (cargo)
STB_fnc_intel_getCargoClass =
{
	_input = toLower _this;
	_output = switch (_input) do {	
		case "car": 		{"Car"};
		case "truck": 		{"Truck"};
		case "ifv": 		{"IFV"};
		case "tank": 		{"Tank"};
		case "helo":		{"Helicopter"};
		case "crate_small":	{"Small Crate"};
		case "crate_med":	{"Medium Crate"};
		case "crate_large":	{"Large Crate"};
		default 			{"undefined"};	
	};
	_output;
};	

// side specific hints for MP
STB_fnc_intel_hintMP = {
	_hintText = _this select 0;
	_sides = _this select 1;
	if ((side player) in _sides) then {
		hint parseText _hintText;
	};
};
	

