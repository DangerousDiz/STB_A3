/*
	UNIFORM PRESET - British Special Forces
	
	Dependencies - Massi's UKSF
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
_baseUniform = ["U_mas_uk_B_CombatUniform_sage_vest","U_mas_uk_B_CombatUniform_sage_tshirt","U_mas_uk_B_CombatUniform_sage","U_mas_uk_B_IndUniformx2"];
_baseHelmet = ["H_mas_uk_helmet_mich_sf_b","H_mas_uk_helmet_mich_sf_h_b","H_mas_uk_helmet_ops_sf_b","H_mas_uk_helmet_ops_sf_h_b"];
_baseGlasses = ["G_mas_wpn_wrap_b","G_mas_wpn_wrap_gog_b","G_mas_wpn_wrap_gog_c","G_mas_wpn_wrap_mask_b","G_mas_wpn_wrap_mask_c","G_mas_wpn_wrap_c"];

// Armored vests
_lightRig = ["V_mas_uk_PlateCarrier1_rgr_g"];
_mediumRig = ["V_mas_uk_PlateCarrier1_rgr_g"]; 	// default for all infantry classes
_heavyRig = ["V_mas_uk_PlateCarrier1_rgr_g"];

// Diver
_diverUniform =  ["U_mas_uk_B_Wetsuit"];
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