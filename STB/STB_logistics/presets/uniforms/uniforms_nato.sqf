/*
	UNIFORM PRESET - NATO
	
	Dependencies: NONE
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
_baseUniform = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest"];
_baseHelmet = ["H_HelmetB","H_HelmetB_plain_mcamo"];
_baseGlasses = [];

// Armored vests
_lightRig = ["V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_oli"];
_mediumRig = ["V_PlateCarrier1_rgr","V_PlateCarrier2_rgr"]; 	// default for all infantry classes
_heavyRig = ["V_PlateCarrier3_rgr"];

// Diver
_diverUniform =  ["U_B_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherB"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_B"];
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
_sfUniform = ["U_B_SpecopsUniform_sgg"];
_sfHelmet = ["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk"];
_sfRig = _mediumRig;
_sfGlasses = [];

// Company Command (officer)
_coyUniform = ["U_B_CombatUniform_mcam"];
_coyHelmet = ["H_MilCap_mcamo"];
_coyRig = ["V_BandollierB_rgr"];
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