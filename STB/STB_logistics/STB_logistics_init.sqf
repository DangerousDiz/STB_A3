/*
	
	Handles gear and cargo asssignment at mission start.
	Searches for units/objects/vehicles with the following
	variables defined on them:
	
		STB_Loadout - string defining the type of loadout
		STB_Cargo - [string defining the type of cargo,
					string defining which side's gear to use]
		STB_Resupply - number defining how many resupplies
					the object can provide. -1 for unlimited.
					
	when using setvariable from a unit's init line the syntax is
	
		this setVariable ["variablename", value, isPublic?];
		
	where 
		variablename - the name of the var IN QUOTES (string)
		value - is the value of the variable (any data type or 
				array of data types)
		isPublic? -  whether the variable is broadcast to all
			connected clients (bool).
			
	NOTE: for STB variables, ALWAYS SET isPublic to TRUE!
	
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	Preparing a mission in the editor:
	
	Set a variable on the unit to make it receive new loadout
	set it to one of the loadout strings.
	
	e.g. this setVariable ["STB_Loadout","ftl",true];

	Set a variable on a vehicle or crate to assign cargo to it
	in this case the variable is an array ["cargoType","side"]

	e.g. this setVariable ["STB_Cargo", ["car","west"], true];
	
	Set a variable on an object or vehicle to have it act as a 
	resupply point to all units that have the STB_Loadout or 
	STB_Cargo variables defined. Here the variable is the amount 
	of rearms the resupply point provides. a negative number will
	result in unlimited rearms.
	
	e.g. this setVariable ["STB_Resupply", 10, true];
			
*/

// ~~~~~~~~	LOAD MEDICAL PRESET ~~~~~~~~~~~~~ //
   
if (isNil "STB_medical_compiled") then {call compile preProcessFile ("STB\STB_logistics\presets\medical\" + STB_Medical + ".sqf");};

// ~~~~~~~~	LOAD "EXTRAS" PRESET ~~~~~~~~~~~~~ //

if (isNil "STB_extras_compiled") then {call compile preProcessFile ("STB\STB_logistics\presets\extras\" + STB_Extras + ".sqf");};


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
									CLIENT INTIALISATION:
								Player gear and Resupply Points
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */


// player gear and resupply points

if (hasInterface) then {

	// ~~~~~~~~~~~~~ PLAYER GEAR ~~~~~~~~~~~~~~~~ //

	// get info
	_unit = _this;	
	_class = _unit getVariable "STB_Loadout";

	// assign default class if none are assigned.
	if (!isNil "_class") then {
		// call side-specific gear
		_side = side _unit;		
		[_unit, _class, _side] execVM "STB\STB_logistics\STB_loadouts.sqf";
		if (STB_DebugEnabled) then {
			if (_unit == player) then {
				systemChat format ["STB_Debug (%1) - Assigning Player Loadout for %2 (%3).", time, name player, _class call STB_fnc_intel_getLoadoutClass];
			} else {			
				systemChat format ["STB_Debug (%1) - Assigning Unit Loadout for Unit %2", time, _unit];
			};
		};
	};	
	
	// ~~~~~~~~~~~~~ Resupply Points ~~~~~~~~~~~~~~~~ //
	if (_unit getVariable "STB_Lives" == STB_PlayerRespawns) then {

		_resupplyArray = [];

		// find vehicles
		{	_amount = _x getVariable "STB_Resupply";
			if (!isNil "_amount") then {
				_resupplyArray = _resupplyArray + [[_x,_amount]];
			};	
		} forEach vehicles;

		// find objects
		{	if (!(_x in allUnits || _x in vehicles)) then {
				_amount = _x getVariable "STB_Resupply";
				if (!isNil "_amount") then {
					_resupplyArray = _resupplyArray + [[_x,_amount]];
				};	
			};
		} forEach (allMissionObjects "ALL");

		if (count _resupplyArray != 0) then {
			// loop over all objects defined as supply points and call appropriate script	
			{	_object = _x select 0;
				_amount = _x select 1;							
				[_object, _amount] execVM "STB\STB_logistics\STB_resupply_point.sqf";			
			} forEach _resupplyArray;
			
			if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - Creating %2 Resupply Points", time, count _resupplyArray];};
		};	
	};
	
};


// exit here if not server
if (!isServer) exitWith {};
if (time > 5) exitWith {};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
									Server INTIALISATION:
								AI gear and vehicle/crate cargo
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// ~~~~~~~~~~~~~ AI GEAR ~~~~~~~~~~~~~~~~ //

_aiArray = [];
{	_class = _x getVariable "STB_Loadout";
	if (!isPlayer _x && !isNil "_class") then {
		_aiArray = _aiArray + [[_x,_class]];
	};	
} forEach allUnits;

// if none are found, exit
if (count _aiArray != 0)then {
	// loop over all units with STB_Loadout defined and call appropriate scripts	
	{	_unit = _x select 0;
		_class = _x select 1;		
		_side = side _unit;	
		[_unit, _class,_side] execVM "STB\STB_logistics\STB_loadouts.sqf";
	} forEach _aiArray;	
	
	if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - Assigning Loadouts for %2 AI units", time, count _aiArray];};	
};

// ~~~~~~~~~~~~~ Vehicle Cargo ~~~~~~~~~~~~~~~~ //

_vehicleArray = [];
{
	_params = _x getVariable "STB_Cargo";
	if (!isNil "_params") then {
		_class = _params select 0;
		_side = _params select 1;
		_vehicleArray = _vehicleArray + [[_x,_class,_side]];
	};	
} forEach vehicles;

// if none are found, exit
if (count _vehicleArray != 0) then {
	// loop over all units with STB_Loadout defined and call appropriate scripts	
	{	_unit = _x select 0;
		_class = _x select 1;
		_side = _x select 2;						
		[_unit, _class, _side] execVM "STB\STB_logistics\STB_cargo.sqf";		
	} forEach _vehicleArray;
	
	if (STB_DebugEnabled) then {systemChat format ["STB_Debug (%1) - Assigning Cargo to %2 Vehicles", time, count _vehicleArray];};
};