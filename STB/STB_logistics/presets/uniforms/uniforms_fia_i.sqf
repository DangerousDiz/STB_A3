/*
	UNIFORM PRESET - FIA (independant)
	
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
_baseUniform = ["U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_IG_leader"];
_baseHelmet = ["H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_gry","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs","H_Beret_blk","H_Beret_grn_SF"];
_baseGlasses = [];

// Armored vests
_lightRig = ["V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_oli"];
_mediumRig = ["V_PlateCarrier1_rgr","V_PlateCarrier2_rgr"]; 	// default for all infantry classes
_heavyRig = ["V_PlateCarrier3_rgr"];

// Diver
_diverUniform =  ["U_O_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherB"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_O_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_I"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// Crewman
_crewUniform = ["U_IG_Guerilla1_1"];
_crewHelmet = ["H_HelmetCrew_I"];
_crewRig = ["V_TacVest_blk"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_C_HunterBody_grn"];
_ghillieHelmet = ["H_Shemag_khk"];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// Spec Op
_sfUniform = ["U_IG_leader"];
_sfHelmet = ["H_Watchcap_blk","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_sgg"];
_sfRig = _mediumRig;
_sfGlasses = [];

// Company Command (officer)
_coyUniform = ["U_IG_Guerilla2_3"];
_coyHelmet = ["H_Watchcap_blk"];
_coyRig = ["V_Chestrig_oli"];
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