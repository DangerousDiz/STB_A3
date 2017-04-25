/*

	STB mission framework v3.0.0
	INITIALISE STB FUNCTIONS
	
	Usage (init.sqf):
	
	nul = execVM "STB\STB_init.sqf";	

*/
//Use a forEach loop to set all the mission params into global variables - regardless of the order or amount of server params
//Credit: Goodson
//Just make sure you set the param class for the setting to the variable name you wish to create. See STB\STB_settings.sqf

{
   missionNamespace setVariable [configName _x, paramsArray select _forEachIndex];
} forEach ("true" configClasses (getMissionConfig "Params"));

// compile user settings
call compile preProcessFileLineNumbers "STB\STB_settings.sqf";	

// declare public variables 
STB_SpawnedGroups = [];
STB_DisposableMarkers = [];
STB_ProtectedMarkers = [];
STB_MarkerCleanupTime = 300;
STB_isJIP = if (isNull player and !isDedicated) then {true} else {false};

// find the server admin
if (serverCommandAvailable "#logout") then {
	STB_ServerAdmin = player;
	publicVariable "STB_ServerAdmin";
};


// define condition to identify the machine that will control the AI
STB_isAIController = 	if ((!isMultiplayer) || (isNil STB_HC_Name)) then {
							isServer;
						} else {						
							if (!STB_useAvailableHC) then {isServer;} else {!isServer && !hasInterface && {player == (call compile STB_HC_Name)};};
						};	
						
// another variable that's true everywhere if the HC is connected						
STB_HC_Connected = if (isMultiplayer && !isNil STB_HC_Name) then {true} else {false};

// set version string
STB_VersionString = "3.5 Beta";

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			all STB functions are compiled on every connected machine
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// compile functions
call compile preprocessFileLineNumbers "STB\STB_functions\STB_functions_ancillary.sqf";
call compile preprocessFileLineNumbers "STB\STB_functions\STB_functions_debug.sqf";
call compile preprocessFileLineNumbers "STB\STB_functions\STB_functions_intel.sqf";
if (!STB_NoAI) then {call compile preprocessFileLineNumbers "STB\STB_functions\STB_functions_AI.sqf"};
// after this point, all STB functions are available to use


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						client specific functions
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
if (hasInterface) then {
	STB_client_script = [] execVM "STB\STB_client\STB_client_init.sqf";
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						server specific functions
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
if (isServer) then {
	STB_server_script = [] execVM "STB\STB_server\STB_server_init.sqf";
	
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					STB Extensions (all clients)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
call compile preprocessFileLineNumbers "STB\STB_extensions\STB_extensions_init.sqf";

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				 run TFAR radio frequency initialization (all clients)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
if (STB_useTFAR) then {
	STB_radio_script = STB_TFAR_Encryption execVM "STB\STB_radio\STB_tfar_init.sqf";
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				 mission specific functions (all clients)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */


STB_mission_script = [] execVM "STB\STB_mission_init.sqf";
