/*
	UNIFORM PRESET - British Armed Forces (Royal Marines)
	
	Dependencies: 3CB BAF uniforms
*/

// privatise variables
private ["_baseUniform","_baseHelmet","_baseGlasses",
		"_lightRig", "_mediumRig", "_heavyRig",
		"_diverUniform","_diverHelmet","_diverRig","_diverGlasses",
		"_pilotUniform","_pilotHelmet","_pilotRig","_pilotGlasses",
		"_crewUniform","_crewHelmet","_crewRig","_crewGlasses",
		"_ghillieUniform","_ghillieHelmet","_ghillieRig","_ghillieGlasses",
		"_sfUniform","_sfHelmet","_sfRig","_sfGlasses",
		"_coyUniform","_coyHelmet","_coyRig","_coyGlasses"];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit
_baseUniform = ["UK3CB_BAF_Uniform_MTP","UK3CB_BAF_Uniform_MTP_ShortSleeve"];
_baseHelmet = ["STKR_MK7","STKR_MK7_Scrim"];
_baseGlasses = [];

// Armored vests
_lightRig = ["V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_oli"];
_mediumRig = ["STKR_Osprey_MG","STKR_Osprey_R","STKR_Osprey_G"]; 	// default for all infantry classes
_heavyRig = ["STKR_Osprey_SL"];

// Diver
_diverUniform =  ["U_B_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherB"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["UK3CB_BAF_Uniform_HeliPilot_RN"];
_pilotHelmet = ["UK3CB_BAF_Helmet_HeliPilot_RN"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// Crewman
_crewUniform = ["U_B_CombatUniform_mcam_vest"];
_crewHelmet = ["H_HelmetCrew_B"];
_crewRig = ["V_TacVest_blk"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// Spec Op
_sfuniform = ["U_B_SpecopsUniform_sgg"];
_sfhelmet = ["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk"];
_sfRig = _mediumRig;
_sfGlasses = [];

// Company Command (officer)
_coyUniform = ["UK3CB_BAF_Uniform_MTP"];
_coyHelmet = ["B_P_BeretOff"];
_coyRig = ["STKR_Osprey_SL"];
_coyGlasses = [];

// Return Values
_return = 	[_baseUniform,_baseHelmet,_baseGlasses,
			_lightRig, _mediumRig, _heavyRig,
			_diverUniform,_diverHelmet,_diverRig,_diverGlasses,
			_pilotUniform,_pilotHelmet,_pilotRig,_pilotGlasses,
			_crewUniform,_crewHelmet,_crewRig,_crewGlasses,
			_ghillieUniform,_ghillieHelmet,_ghillieRig,_ghillieGlasses,
			_sfUniform,_sfHelmet,_sfRig,_sfGlasses,
			_coyUniform,_coyHelmet,_coyRig,_coyGlasses];
_return;