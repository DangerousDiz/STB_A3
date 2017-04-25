/*
	STB_Extensions: 
		BMXX_Extensions.sqf
		Author: Bluemaxx [3CB]
*/
/*--------------------------------------------------------------------------
----------------------------------------------------------------------------*/
/*
	Usage: call function in hasInterface section of STB_Mission_Init.sqf
	Change 3CB standard kit to smocks
*/
BMXX_fnc_smocks = {
	waitUntil {!isNull player};
	waitUntil {player == player};
	// Delay until the server time has sync'd
	waitUntil {time > 1};
	// For JIP, wait until the main screen loads
	waitUntil {!isNull (findDisplay 46)};
	// Delay for further 10 secs (the 3CB loadouts are added at 6 secs)
	sleep 10.0;   

	_uniItems = uniformItems player;
	_vestItems = vestItems player;
	_3cbFaction = (faction player) splitString "_";
	_faction = _3cbFaction select 4;
	_3cbRole = (typeOf player) splitString "_";
	_role = _3cbRole select 2;
	
	if (_role in ["Crewman", "HeliPilot", "HeliCrew", "Sniper", "Spotter"]) then {
		sleep 1;
	} else {
		switch (_faction) do 
		{
			case "MTP":
			{
				_smock = [[
				"UK3CB_BAF_U_Smock_DPMW_MTP",
				"UK3CB_BAF_U_Smock_MTP_DPMW",
				"UK3CB_BAF_U_Smock_MTP"],[10,10,80]
				] call BIS_fnc_selectRandomWeighted;
				_webbing = [[
				"UK3CB_BAF_V_PLCE_Webbing_Plate_MTP",
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DPMW"
				],[90,10]
				] call BIS_fnc_selectRandomWeighted;			
				player forceAddUniform _smock;
				player addVest _webbing;
				{player addItemToUniform _x} forEach _uniItems;
				{player addItemToVest _x} forEach _vestItems;
			};

			case "Desert":
			{
				_smock = [[
				"UK3CB_BAF_U_Smock_MTP_DDPM",
				"UK3CB_BAF_U_Smock_DPMW_DDPM",
				"UK3CB_BAF_U_Smock_DDPM"],[10,10,80]
				] call BIS_fnc_selectRandomWeighted;
				_webbing = [[
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DDPM",
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DPMW"
				],[90,10]
				] call BIS_fnc_selectRandomWeighted;
				
				player forceAddUniform _smock;
				player addVest _webbing;

				{player addItemToUniform _x} forEach _uniItems;
				{player addItemToVest _x} forEach _vestItems;
			};

			case "Temperate":
			{
				_smock = "UK3CB_BAF_U_Smock_DPMT";
				_webbing = [[
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DPMT",
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DPMW"
				],[90,10]
				] call BIS_fnc_selectRandomWeighted;
				
				player forceAddUniform _smock;
				player addVest _webbing;

				{player addItemToUniform _x} forEach _uniItems;
				{player addItemToVest _x} forEach _vestItems;
			};

			case "Woodland":
			{
				_smock = [[
				"UK3CB_BAF_U_Smock_DPMW_MTP",
				"UK3CB_BAF_U_Smock_DPMW_OLI",
				"UK3CB_BAF_U_Smock_DPMW"],[10,10,80]
				] call BIS_fnc_selectRandomWeighted;
				_webbing = [[
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DPMW",
				"UK3CB_BAF_V_PLCE_Webbing_Plate_OLI"
				],[90,10]
				] call BIS_fnc_selectRandomWeighted;
				
				player forceAddUniform _smock;
				player addVest _webbing;

				{player addItemToUniform _x} forEach _uniItems;
				{player addItemToVest _x} forEach _vestItems;
			};

			case "Tropical":
			{
				_smock = [[
				"UK3CB_BAF_U_Smock_DPMW_MTP",
				"UK3CB_BAF_U_Smock_DPMW_OLI",
				"UK3CB_BAF_U_Smock_DPMW"],[10,10,80]
				] call BIS_fnc_selectRandomWeighted;
				_webbing = [[
				"UK3CB_BAF_V_PLCE_Webbing_Plate_OLI",
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DPMW",
				"UK3CB_BAF_V_PLCE_Webbing_Plate_DPMT"
				],[80,10,10]
				] call BIS_fnc_selectRandomWeighted;
				
				player forceAddUniform _smock;
				player addVest _webbing;

				{player addItemToUniform _x} forEach _uniItems;
				{player addItemToVest _x} forEach _vestItems;
			};
		};
	};
};

BMXX_fnc_weapons =
{
	waitUntil {!isNull player};
	waitUntil {player == player};
	// Delay until the server time has sync'd
	waitUntil {time > 1};
	// For JIP, wait until the main screen loads
	waitUntil {!isNull (findDisplay 46)};
	// Delay for further 10 secs (the 3CB loadouts are added at 6 secs)
	sleep 10.0;
	//L85A2
	if ((primaryWeapon player) == "UK3CB_BAF_L85A2_RIS_LDSR2D_IR") then {
		_priWPItems = primaryWeaponItems player;
		_priWPMag = primaryWeaponMagazine player;
		player addWeapon "UK3CB_BAF_L85A2_RIS_Tan";
		{player addPrimaryWeaponItem _x;} forEach _priWPItems;
	};
	
	//L7A2
	if ((primaryWeapon player) == "UK3CB_BAF_L7A2") then {
		_priWPItems = primaryWeaponItems player;
		_priWPMag = primaryWeaponMagazine player;
		player addWeapon "UK3CB_BAF_L7A2_FIST";
		{player addPrimaryWeaponItem _x;} forEach _priWPItems;
	};
	
	//L115
	if ((primaryWeapon player) == "UK3CB_BAF_L115A3_RKSL_PMII_525_wdl") then {
		_priWPItems = primaryWeaponItems player;
		player addWeapon "UK3CB_BAF_L115A3_DE_Ghillie";
		player addPrimaryWeaponItem "UK3CB_BAF_Silencer_L115A3";
		player addPrimaryWeaponItem "RKSL_optic_PMII_525";
	};
};