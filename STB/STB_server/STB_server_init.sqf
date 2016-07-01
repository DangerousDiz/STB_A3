/*	
	
	USE THIS SCRIPT FOR GENERAL SERVER-SIDE FUNCTIONS
		   (equivalent to init.Server.sqf)
		   
*/

// monitor all created groups
[] spawn STB_fnc_debug_monitorGroups;
[] spawn STB_fnc_debug_monitorMarkers;

// run logistics for vehicles and crates
if (isDedicated) then {objNull execVM "STB\STB_logistics\STB_logistics_init.sqf";};

