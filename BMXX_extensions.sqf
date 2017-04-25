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

BMXX_fnc_weapons = {
	_colour = _this select 0;
	sleep 10;
	//equipment tweeks
	//Marksman 556 ammo switch
	if ((typeOf player) isEqualTo "UK3CB_BAF_Marksman_MTP_RM") then {
		player removeMagazine "UK3CB_BAF_762_100Rnd_T";
		for "_i" from 1 to 5 do {
			player addMagazine "UK3CB_BAF_556_100Rnd_T";
		};
	};
	
	if (group player isEqualTo brimstone) then {
		if (player isKindOf "UK3CB_BAF_Explosive_MTP") then {
			player addItem "UK3CB_BAF_H_Beret_RLC_Commando";
		};
		if (player isKindOf "UK3CB_BAF_RO_MTP") then {
			player addItem "UK3CB_BAF_H_Beret_Signals";
		};
		if (player isKindOf "UK3CB_BAF_Engineer_MTP") then {
			player addItem "UK3CB_BAF_H_Beret_REng";
		};
	};
	
	if ((group player isEqualTo eng43) || (group player isEqualTo eng44)) then {
		player removeItem "UK3CB_BAF_H_Beret_RM_Bootneck";
		player addItem "UK3CB_BAF_H_Beret_REng";
	};
		
	if (group player isEqualTo clr) then {
		player removeItem "UK3CB_BAF_H_Beret_RM_Bootneck";
		player addItem "UK3CB_BAF_H_Beret_RLC_Commando";
	};
	
	if (group player isEqualTo comArt) then {
		player removeItem "UK3CB_BAF_H_Beret_RM_Bootneck";
		player addItem "UK3CB_BAF_H_Earphone";
		player addItem "UK3CB_BAF_H_Beret_CRArt";
		BMXX_Z synchronizeObjectsAdd [artSupProv];
	};
	
	{
		if (((typeOf player) isEqualTo "B_Pilot_F") || ((typeOf player) isEqualTo "UK3CB_BAF_HeliPilot_RN_MTP")) then {
			[player,"FAA"] call BIS_fnc_setUnitInsignia;
		} else {
			if ((typeOf player) isEqualTo "UK3CB_BAF_HeliPilot_Army_MTP") then {
				[player,"JHC"] call BIS_fnc_setUnitInsignia;
			} else {
				[player,"UK3CB_BAF_Insignia_RMDagger_1"] call BIS_fnc_setUnitInsignia;
			};
		};
	} remoteExec ["bis_fnc_call", -2];
	
	//weapon tweeks
	switch (_colour) do {
		case "sand": {

			_uniItems = uniformItems player;
			removeUniform player;
			player forceAddUniform ([["UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM","UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM"],[50,50]] call BIS_fnc_selectRandomWeighted);
			{player addItemToUniform _x} forEach _uniItems;
			//L85A2
			if ((primaryWeapon player) isEqualTo "UK3CB_BAF_L85A2_RIS_LDSR2D_IR") then {
				_priWPItems = primaryWeaponItems player;
				player addWeapon "UK3CB_BAF_L85A2_RIS_Tan";
				{player addPrimaryWeaponItem _x;} forEach _priWPItems;
			};
			
			//L115
			if ((primaryWeapon player) isEqualTo "UK3CB_BAF_L115A3_RKSL_PMII_525_wdl") then {
				_priWPItems = primaryWeaponItems player;
				player addWeapon "UK3CB_BAF_L115A3_DE";
				player addPrimaryWeaponItem "RKSL_optic_PMII_525";
				_bpItems = backpackItems player;
				_bpAmmo = backpackMagazines player;
				removeBackpackGlobal player;
				player addBackpackGlobal "UK3CB_BAF_B_Kitbag_MTP";
				{player addItemToBackpack _x} forEach _bpItems;
				{player addItemToBackpack _x} forEach _bpAmmo;
			};

			if ((typeOf player) isEqualTo "UK3CB_BAF_Spotter_MTP_Ghillie_L129_RM") then {
				player removePrimaryWeaponItem "UK3CB_BAF_Silencer_L115A3";
			};
		};
		case "green": {		
			//L85A2
			if ((primaryWeapon player) isEqualTo "UK3CB_BAF_L85A2_RIS_LDSR2D_IR") then {
				_priWPItems = primaryWeaponItems player;
				_priWPMag = primaryWeaponMagazine player;
				player addWeapon "UK3CB_BAF_L85A2_RIS_Green";
				{player addPrimaryWeaponItem _x;} forEach _priWPItems;
			};
		};
		
		case "default": {
			sleep 1;
		};
	};
};

//custom utility function to remove INDFOR NVGs for cosmetic effect
BMXX_fnc_removeNVGs =  {
	sleep 10; //Make sure the units are in.
	{
		if (!(side _x == west)) then {
			_x unassignItem "NVGoggles_INDEP";
			//_x removeItem "NVGoggles_INDEP";
			_x removePrimaryWeaponItem "acc_pointer_IR";
			_x addPrimaryWeaponItem "optic_MRCO";
			[_x,"TFAegis"] call BIS_fnc_setUnitInsignia;
		};
	} forEach allUnits;
};