/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	********************		ANCILLARY FUNCTIONS		************************

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

STB_fnc_ancillary_randomLocations =
{
	/*
	_markerArray = ["centerMarker",[0,5000],[30,0]] call STB_fnc_ancillary_randomLocations;

	Params:
	center position (marker/obj/posArray) - central position for the marker generation
	radii (array) - [min distance, max distance] 
	# of markers (array) - [minimum, random]
	(optional) azimuth (array) - [start angle, sector width]
	
		e.g. for attacks from coming from anywhere between 180 (s) and 270 (w) degrees the azimuth
		paramater would be [180,90]
			180 is the start angle,
			90 is the width of the arc, ending at 270 degrees
	
	returns array of markers
	*/
	
	private ["_center","_radius","_markerAmountMin","_markerAmountRnd","_markerAmount","_markerArray"];
	_center = _this select 0;
	_radii = _this select 1;	
	_markerAmountMin = (_this select 2) select 0;
	_markerAmountRnd = (_this select 2) select 1;
	_markerAmount = _markerAmountMin + (floor random (_markerAmountRnd));
	_markerArray = [];
	
	_azimuth = if (count _this <= 3) then {[0,360]} else {_this select 3};

	_center = _center call STB_fnc_ancillary_toPosArray;

	for [{_i = 0},{_i < _markerAmount},{_i=_i+1}] do
	{
		private ["_direction","_distance","_pos","_markerName","_markerHandle"];
		
		_direction = (_azimuth select 0) + random (_azimuth select 1);		
		_distance = (_radii select 0) + random (_radii select 1);		
		
		_pos = [(_center select 0) + (_distance * (sin _direction)), 
				(_center select 1) + (_distance * (cos _direction)),
				0];
				
		while {surfaceIsWater _pos} do {
		
			_direction = (_azimuth select 0) + random (_azimuth select 1);		
			_distance = (_radii select 0) + random (_radii select 1);		
			
			_pos = [(_center select 0) + (_distance * (sin _direction)), 
					(_center select 1) + (_distance * (cos _direction)),
					0];
		
		};
				
		_mname = format ["%1", random 1000];	
		_markerstr = createMarker [_mname,_pos];
		_markerstr setMarkerDir (random 360);
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "mil_dot";
		_markerstr setMarkerAlpha 0;
		_markerArray = _markerArray + [_markerstr];	
	};
	
	STB_DisposableMarkers = STB_DisposableMarkers + _markerArray;
	publicVariable "STB_Disposable_Markers";	
	
	if (STB_DebugEnabled && count _markerArray > 0) then {systemChat format ["STB_Debug (%1) - Creating %2 markers", time, count _markerArray];};	
	_markerArray;	
};

STB_fnc_ancillary_addNoise2D =
{
	/*
		Adds random variation around a given point
		
		_newPos = [startPos, radius] call STB_fnc_ancillary_addNoise2D;
		
		Params:
		center position (marker/obj/posArray) 
		radius - max amount of added noise
		
		returns new position
	*/

	private ["_startPos","_endPos","_radius","_direction","_distance"];
	_initialPos = _this select 0;
	_distance = random (_this select 1);	
	_angle = random 360;
	
	_initialPos = _initialPos call STB_fnc_ancillary_toPosArray;
	
	_xx = _initialPos select 0;
	_yy = _initialPos select 1;
	_zz = _initialPos select 2;
	
	_newPos = [_xx + (_distance * cos _angle), _yy + (_distance * sin _angle) + 0];
	_newPos;
};

STB_fnc_ancillary_safeAddNoise2D =
{
	/*
		Adds random variation around a given point
		makes the position is safe to spawn units into		
	*/
	_startPos = _this select 0;
	_radius = _this select 1;
	
	_tempPos = [_startPos,_radius] call STB_fnc_ancillary_addNoise2D;
	_safePos = [_tempPos, 0, 50, 5, 0, 50 * (pi / 180), 0] call BIS_fnc_findSafePos;
	
	_safePos;	
};

STB_fnc_ancillary_randomName = 
{
	/*
		Generates a random alphanumeric name
		
		_name = "prefix" call STB_fnc_ancillary_randomName;
		
		Params:
		Prefix (string)
	*/
	
	private ["_letters","_name","_numberOfLetters"];	
	
	_letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"];
	_name = _this;	
	
	_numberOfLetters = 8;
	
	for [{_i = 0},{_i < _numberOfLetters},{_i=_i+1}] do
	{
		_name = _name + (_letters select (floor random 36));
	};
	
	_name;
};

// find a flat empty position (safer than BIS_fnc_findSafePos)
STB_fnc_ancillary_findSafePos =
{
	// finds a flat, empty position within given radius of given initial position
	// will time out after a number of attempts and simply return the initial position
	// params: [initialPosition, radius]	
	
	_pos = _this select 0;
	_range = _this select 1;
	
	_maxAttempts = 10;
	_vehicleType = "B_Truck_01_fuel_F";
	_radius = 100;
	_safePos = _pos findEmptyPosition [ 0 , _radius , _vehicleType ];
	_attempts = 0;
	
	while {count _safePos < 1 && _attempts < _maxAttempts} do {	
		_radius = _radius + 100;
		_safePos = _pos findEmptyPosition[ 0 , 200 , _vehicleType];					
		_attempts = _attempts + 1;
		if (count _safePos > 0) then {
			if (_safePos distance [0,0,0] < 10 && !surfaceIsWater _safePos) then {_safePos = [];};
		};
		if (STB_DebugEnabled) then {
			systemchat format ["STB Debug (%1): FindSafePos Retrying With Radius = %2", time, _radius];
		};
	};	
	
	if (_attempts >= _maxAttempts) then {
		_safePos = _pos;
		if (STB_DebugEnabled) then {
			systemchat format ["STB Debug (%1): FindSafePos Timed Out, Returning Original Pos", time];
		};
	};
	
	_safePos;
};

// get all positions in a building
STB_fnc_ancillary_getBuildingPositions =
{
	/*
		Returns all positions in the nearest building from a given position
		
		Params:
		center position (marker/object/posArray) - position at which the script will search for nearest building
	*/
	
	private ["_center", "_positions", "_i", "_done"];

	_center = _this;
	_center = _center call STB_fnc_ancillary_toPosArray;
	
	_building = nearestBuilding _center;
	_positions = [];
	
	_i = 0;
	_done = false;
	
	while {!_done} do
	{
	   _next = _building buildingPos _i;
	   if (((_next select 0) == 0) && ((_next select 1) == 0) && ((_next select 2) == 0)) then
	   {
		  _done = true;
	   }
	   else 
	   {
		  _positions = _positions + [_next];
		  _i = _i + 1;
	   };
	};
	
	_positions;
};

// move in random building in random position within radius
STB_fnc_ancillary_moveInBuilding = 
{
	/*
		Moves a unit to a random position in a building 
		
		Params:
		unit - unit to move
		center (marker/object/posArray) - where to center the search for buildings
		radius (number) - radius from center point in which the script will search for buildings
		warp? (bool) - if true, units will teleport, else units will walk to building pos
	*/

	private ["_unit","_startPos","_radius","_warp","_rndPos"];
	
	_unit = _this select 0;
	_startPos = _this select 1; // where the script will look for houses
	_radius = _this select 2;
	_warp = _this select 3; // teleport or walk to building
	
	_rndPos = [_startPos,_radius] call STB_fnc_ancillary_addNoise2D;		
	_buildingPositions = _building call STB_fnc_ancillary_getBuildingPositions;	
	_buildingPos = _buildingPositions call BIS_fnc_selectRandom;
	
	if (_warp) then {_unit setPos _buildingPos} else {_unit doMove _buildingPos};	
	_buildingPos;
};

STB_fnc_ancillary_toPosArray =
{
	// takes posArray, marker name or object name and converts to posArray
	private ["_target"];
	_target = _this;
	_posArray = [];
	
	_type = nil;
	_type = if (_target in allMapMarkers) then {
				"marker"
			} else {	
				if (typeName _target == "ARRAY") then {
					"posArray"
				} else {
					if (_target in allUnits) then {
						"unit"
					} else {
						"invalid"
					};
				};
			};
	
	switch (_type) do {
		case "marker":
		{_posArray = getMarkerPos _target};
		case "unit":
		{_posArray = getPos _target};
		case "posArray":
		{_posArray = _target};
		default
		{systemchat format ["STB_Debug (%1) - Error in 'toPosArray' - Invalid Input",time];};
	};
	
	_posArray;
};	

STB_fnc_ancillary_getTowns =
{
	// takes a center position and a radius and returns all towns within the defined area in an array.	
	// ((return array) select 0) is town name string, ((return array) select 1) is town position in array format.
	// i.e. [["town1name", [town1PosX,town1PosY,town1PosZ]],["town2name", [town2PosX,town2PosY,town2PosZ]],...]
	
	_center = _this select 0;
	_radius = _this select 1;	
	
	_center = _center call STB_fnc_ancillary_toPosArray;	
	
	_townList = nearestLocations [_center, ["NameVillage","NameCity","NameCityCapital"], _radius];
	
	if (count _townList == 0) exitWith {systemchat format ["STB_Debug (%1) - Error in 'getTowns' - No Towns Found",time];};	
	
	_townArray = [];	
	for [{_i=0},{_i<count _townList},{_i=_i+1}] do {
		_townArray = _townArray + [text (_townList select _i), locationPosition (_townList select _i)];
	};	
	
	_townArray;	
};

// allows fast declaration of arrays of markers
STB_fnc_ancillary_defineMarkers = {

	_prefix = _this select 0;
	_count = _this select 1;
	_return = [];
	
	for [{_i=1},{_i<=_count},{_i=_i+1}] do {	
		_markerName = format ["%1_%2",_prefix,_i];
		_return = _return + [_markerName];		
	};
	
	_return;	
};