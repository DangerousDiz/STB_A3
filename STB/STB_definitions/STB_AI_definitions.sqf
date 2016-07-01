/*

	This is where all the arrays of AI to be used in the spawning scripts
	are defined, along with a master list of classes and group types for 
	use with randomising scripts.

*/

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						ALL DEFINED CLASSES/GROUPS
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// the classlist is a nested array that keeps the sub-classes in the correct structure wrt the main classes
// this variable is used to allow randomisation of the AI groups to be called in the high-level spawning scripts

STB_ClassList = [ ["infantry", 		["section","fireteam","weapons","at","aa","sentry","sniper","mortar"]],
				  ["motorized", 	["section","fireteam","at","aa","hmg","gmg","mortar"]],
				  ["mechanized", 	["section","at","aa","support"]],
				  ["vehicle",		["unarmed","light","medium","heavy"]],
				  ["air",			["transport","rw_cas","fw_cas"]],
				  ["static",		["mortar","hmg","gmg","at","aa"]]
				];

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								NATO Units
							  (faction #: 0)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								
								
// infantry groups
_nato_Men_riflesquad	=	["B_soldier_SL_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_soldier_AAR_F","B_soldier_LAT_F","B_medic_F","B_soldier_A_F"];
_nato_Men_weaponsSquad	=	["B_soldier_SL_F","B_soldier_AR_F","B_soldier_AAR_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_A_F","B_soldier_F","B_medic_F"];
_nato_Men_fireTeam		=	["B_Soldier_TL_F","B_Soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F"];
_nato_Men_at			=	["B_Soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"];
_nato_Men_aa			=	["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"];
_nato_Men_sentry		=	["B_soldier_GL_F","B_soldier_F"];
_nato_Men_sniperTeam	=	["B_sniper_F","B_spotter_F"];
_nato_Men_mortarTeam	=	["B_soldier_TL_F","B_support_Mort_F","B_support_AMort_F"];

// motorized groups
_nato_Moto_section		=	["B_soldier_TL_F","B_MRAP_02_hmg_F","B_MRAP_02_gmg_F","B_soldier_AR_F","B_soldier_LAT_F","B_soldier_AR_F","B_soldier_LAT_F","B_soldier_F"];
_nato_Moto_fireteam		=	["B_MRAP_01_hmg_F","B_soldier_AR_F","B_soldier_AT_F"];
_nato_Moto_at			=	["B_MRAP_01_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"];
_nato_Moto_aa			=	["B_MRAP_01_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"];
_nato_Moto_hmg			=	["B_MRAP_01_F","B_soldier_TL_F","B_support_MG_F","B_support_AMG_F"];
_nato_Moto_gmg			=	["B_MRAP_01_F","B_soldier_TL_F","B_support_GMG_F","B_support_AMG_F"];
_nato_Moto_mortar		=	["B_MRAP_01_F","B_soldier_TL_F","B_support_Mort_F","B_support_AMort_F"];

// mechaniszed groups
_nato_Mech_riflesquad	=	["B_APC_Wheeled_01_cannon_F","B_soldier_SL_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_soldier_AAR_F","B_soldier_LAT_F","B_medic_F","B_soldier_F"];
_nato_Mech_at			=	["B_APC_Wheeled_01_cannon_F","B_soldier_SL_F","B_soldier_AR_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F","B_soldier_AAT_F","B_soldier_AAT_F"];
_nato_Mech_aa			=	["B_APC_Tracked_01_aa_F","B_soldier_SL_F","B_soldier_AR_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F","B_soldier_AAA_F","B_soldier_AAA_F"];
_nato_Mech_support		=	["B_APC_Tracked_01_aa_F","B_soldier_SL_F","B_soldier_AR_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F","B_soldier_AAA_F","B_soldier_AAA_F"];

// ground vehicles
_nato_UnarmedVehicles 		= 	["B_MRAP_01_F","B_Truck_01_transport_F","B_Truck_01_covered_F"];
_nato_ArmedVehicles_Light 	= 	["B_MRAP_01_hmg_F"];
_nato_ArmedVehicles_Medium 	=	["B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_CRV_F","B_APC_Wheeled_01_cannon_F"];
_nato_ArmedVehicles_Heavy 	=	["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"];

// air vehicles
_nato_RW_Transport 	= 	["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"];
_nato_RW_CAS 		= 	["B_Heli_Attack_01_F"];
_nato_FW_CAS 		= 	["B_Plane_CAS_01_F"];

// static weapons
_nato_Static_Mortar 	= 	["B_Mortar_01_F"];							
_nato_Static_HMG		= 	["B_HMG_01_high_F"];
_nato_Static_GMG		=	["B_GMG_01_high_F"];
_nato_Static_AT			= 	["B_static_AT_F"];
_nato_Static_AA			=	["B_static_AA_F"];

// consolidate infantry groups
_NATO_Infantry = [	_nato_Men_riflesquad,
					_nato_Men_weaponsSquad,
					_nato_Men_fireTeam,
					_nato_Men_at,
					_nato_Men_aa,
					_nato_Men_sentry,
					_nato_Men_sniperTeam,
					_nato_Men_mortarTeam
				];
				
// consolidate motorised groups				
_NATO_Motorized = [	_nato_Moto_section,
					_nato_Moto_fireteam,
					_nato_Moto_at,
					_nato_Moto_aa,
					_nato_Moto_hmg,
					_nato_Moto_gmg,
					_nato_Moto_mortar
				];

// consolidate mechanized groups					
_NATO_Mechanized = 	[	_nato_Mech_riflesquad,
						_nato_Mech_at,
						_nato_Mech_aa,
						_nato_Mech_support
					];	

// consolidate ground vehicles					
_NATO_groundVehicles = 	[	_nato_UnarmedVehicles,
							_nato_ArmedVehicles_Light,
							_nato_ArmedVehicles_Medium,
							_nato_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_NATO_AirVehicles = [	_nato_RW_Transport,
						_nato_RW_CAS,
						_nato_FW_CAS
					];

// consolidate static weapons
_NATO_StaticWeapons	 = 	[	_nato_Static_Mortar,
							_nato_Static_HMG,
							_nato_Static_GMG,
							_nato_Static_AT,
							_nato_Static_AA
						];
				
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								AAF Units
							  (faction #: 1)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */				
					
// infantry groups				
_aaf_Men_riflesquad		=	["I_soldier_SL_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_AR_F","I_soldier_AAR_F","I_soldier_LAT_F","I_medic_F","I_soldier_A_F"];
_aaf_Men_weaponsquad	=	["I_soldier_SL_F","I_soldier_AR_F","I_soldier_AAR_F","I_soldier_AT_F","I_soldier_AAT_F","I_soldier_A_F","I_soldier_F","I_medic_F"];
_aaf_Men_fireteam		=	["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_GL_F","I_soldier_LAT_F"];
_aaf_Men_at				=	["I_Soldier_TL_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"];
_aaf_Men_aa				=	["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"];
_aaf_Men_sentry			=	["I_Soldier_GL_F","I_soldier_F"];
_aaf_Men_sniperTeam		=	["I_Sniper_F","I_Spotter_F"];
_aaf_Men_mortarTeam		=	["I_soldier_TL_F","I_support_Mort_F","I_support_AMort_F"];

// motorized groups
_aaf_Moto_section		=	["I_soldier_TL_F","I_MRAP_02_hmg_F","I_MRAP_02_gmg_F","I_soldier_AR_F","I_soldier_LAT_F","I_soldier_AR_F","I_soldier_LAT_F","I_soldier_F"];
_aaf_Moto_fireteam		=	["I_MRAP_03_hmg_F","I_Soldier_AR_F","I_Soldier_AT_F"];
_aaf_Moto_at			=	["I_MRAP_03_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"];
_aaf_Moto_aa			=	["I_MRAP_03_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"];
_aaf_Moto_HMG			=	["I_MRAP_03_F","I_soldier_TL_F","I_support_MG_F","I_support_AMG_F"];
_aaf_Moto_GMG			=	["I_MRAP_03_F","I_soldier_TL_F","I_support_GMG_F","I_support_AMG_F"];
_aaf_Moto_mortar		=	["I_MRAP_03_F","I_soldier_TL_F","I_support_Mort_F","I_support_AMort_F"];

// mechanized groups
_aaf_Mech_riflesquad	=	["I_APC_Wheeled_03_cannon_F","I_soldier_SL_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_AR_F","I_soldier_AAR_F","I_soldier_LAT_F","I_medic_F","I_soldier_F"];
_aaf_Mech_at			=	["I_APC_Wheeled_03_cannon_F","I_soldier_SL_F","I_soldier_AR_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AAT_F","I_soldier_AAT_F","I_soldier_AAT_F"];
_aaf_Mech_aa			=	["I_APC_Wheeled_03_cannon_F","I_soldier_SL_F","I_soldier_AR_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AA_F","I_soldier_AAA_F","I_soldier_AAA_F","I_soldier_AAA_F"];
_aaf_Mech_support		=	["I_APC_Wheeled_03_cannon_F","I_soldier_SL_F","I_soldier_TL_F","I_soldier_repair_F","I_engineer_F","I_medic_F","I_soldier_AR_F","I_soldier_exp_F","I_soldier_A_F"];

// ground vehicles
_aaf_UnarmedVehicles 		= 	["I_MRAP_01_F","I_Truck_01_transport_F","I_Truck_01_covered_F"];
_aaf_ArmedVehicles_Light 	= 	["I_G_Offroad_01_armed_F","I_MRAP_03_hmg_F"];
_aaf_ArmedVehicles_Medium 	=	["I_APC_Wheeled_03_cannon_F"];
_aaf_ArmedVehicles_Heavy 	=	["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F"];

// air vehicles
_aaf_RW_Transport 	= 	["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"];
_aaf_RW_CAS 		= 	["I_Heli_light_03_F"];
_aaf_FW_CAS 		= 	["I_Plane_Fighter_03_CAS_F"];

// static weapons
_aaf_Static_Mortar 	= 	["I_Mortar_01_F"];							
_aaf_Static_HMG		= 	["I_HMG_01_high_F"];
_aaf_Static_GMG		=	["I_GMG_01_high_F"];
_aaf_Static_AT		= 	["I_static_AT_F"];
_aaf_Static_AA		=	["I_static_AA_F"];

// consolidate infantry groups
_AAF_Infantry = [	_aaf_Men_riflesquad,
					_aaf_Men_weaponsquad,
					_aaf_Men_fireteam,
					_aaf_Men_at,
					_aaf_Men_aa,
					_aaf_Men_sentry,
					_aaf_Men_sniperTeam,
					_aaf_Men_mortarTeam						
				];
				
// consolidate motorised groups				
_AAF_Motorized = [	_aaf_Moto_section,
					_aaf_Moto_fireteam,
					_aaf_Moto_at,
					_aaf_Moto_aa,
					_aaf_Moto_HMG,
					_aaf_Moto_GMG,
					_aaf_Moto_mortar
				];
					
// consolidate mechanised groups				
_AAF_Mechanized = [	_aaf_Mech_riflesquad,
					_aaf_Mech_at,
					_aaf_Mech_aa,
					_aaf_Mech_support
				];
				
// consolidate ground vehicles					
_AAF_groundVehicles = 	[	_aaf_UnarmedVehicles,
							_aaf_ArmedVehicles_Light,
							_aaf_ArmedVehicles_Medium,
							_aaf_ArmedVehicles_Heavy
						];
						
// consolidate air vehicles
_AAF_AirVehicles = [	_aaf_RW_Transport,
						_aaf_RW_CAS,
						_aaf_FW_CAS
					];
						
// consolidate static weapons
_AAF_StaticWeapons	= 	[	_aaf_Static_Mortar,
							_aaf_Static_HMG,
							_aaf_Static_GMG,
							_aaf_Static_AT,
							_aaf_Static_AA
						];	

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								CSAT Units
							  (faction #: 2)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
// infantry groups
_csat_Men_rifleSquad	=	["O_soldier_SL_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_AR_F","O_soldier_AAR_F","O_soldier_LAT_F","O_medic_F","O_soldier_F"];
_csat_Men_weaponSquad	=	["O_soldier_SL_F","O_soldier_AR_F","O_soldier_AAR_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_A_F","O_soldier_F","O_medic_F"];
_csat_Men_fireTeam		=	["O_soldier_TL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F"];
_csat_Men_at			=	["O_soldier_TL_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"];
_csat_Men_aa			=	["O_soldier_TL_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"];
_csat_Men_sentry		=	["O_soldier_GL_F","O_soldier_F"];
_csat_Men_sniperTeam	=	["O_sniper_F","O_spotter_F"];
_csat_Men_mortarTeam	=	["O_soldier_TL_F","O_support_Mort_F","O_support_AMort_F"];

// motorised groups
_csat_Moto_section		=	["O_soldier_TL_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_soldier_AR_F","O_soldier_LAT_F","O_soldier_AR_F","O_soldier_LAT_F","O_soldier_F"];
_csat_Moto_fireTeam		=	["O_MRAP_02_GMG_F","O_soldier_AR_F","O_soldier_AT_F",""];
_csat_Moto_at			=	["O_MRAP_02_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"];
_csat_Moto_aa			=	["O_MRAP_02_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"];
_csat_Moto_HMG			=	["O_MRAP_02_F","O_soldier_TL_F","O_support_MG_F","O_support_AMG_F"];
_csat_Moto_GMG			=	["O_MRAP_02_F","O_soldier_TL_F","O_support_GMG_F","O_support_AMG_F"];
_csat_Moto_mortar		=	["O_MRAP_02_F","O_soldier_TL_F","O_support_Mort_F","O_support_AMort_F"];

// mechanized groups
_csat_Mech_rifleSquad	=	["O_APC_Wheeled_02_rcws_F","O_soldier_SL_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_AR_F","O_soldier_AAR_F","O_soldier_LAT_F","O_medic_F","O_soldier_F"];
_csat_Mech_at			=	["O_APC_Tracked_02_cannon_F","O_soldier_SL_F","O_soldier_AR_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_AAT_F","O_soldier_AAT_F"];
_csat_Mech_aa			=	["O_APC_Tracked_02_cannon_F","O_soldier_SL_F","O_soldier_AR_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F","O_soldier_AAA_F","O_soldier_AAA_F"];
_csat_Mech_support		=	["O_APC_Wheeled_02_rcws_F","O_soldier_SL_F","O_soldier_TL_F","O_soldier_repair_F","O_engineer_F","O_medic_F","O_soldier_AR_F","O_soldier_exp_F","O_soldier_A_F"];

// ground vehicles
_csat_UnarmedVehicles 		= 	["O_MRAP_02_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_03_covered_F"];
_csat_ArmedVehicles_Light 	= 	["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"];
_csat_ArmedVehicles_Medium 	=	["O_APC_Tracked_02_cannon_F"];
_csat_ArmedVehicles_Heavy 	=	["O_MBT_02_cannon_F"];

// air vehicles
_csat_RW_Transport 	= 	["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F"];
_csat_RW_CAS 		= 	["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F"];
_csat_FW_CAS 		= 	["I_Plane_Fighter_03_CAS_F"];

// static weapons
_csat_Static_Mortar 	= 	["O_Mortar_01_F"];							
_csat_Static_HMG		= 	["O_HMG_01_high_F"];
_csat_Static_GMG		=	["O_GMG_01_high_F"];
_csat_Static_AT		= 	["O_static_AT_F"];
_csat_Static_AA		=	["O_static_AA_F"];

// consolidate infantry groups
_CSAT_Infantry = [	_csat_Men_rifleSquad,
					_csat_Men_weaponSquad,
					_csat_Men_fireTeam,
					_csat_Men_at,
					_csat_Men_aa,
					_csat_Men_sentry,
					_csat_Men_sniperTeam,
					_csat_Men_mortarTeam		
				];

// consolidate motorized groups				
_CSAT_Motorized = [	_csat_Moto_section,
					_csat_Moto_fireTeam,
					_csat_Moto_at,
					_csat_Moto_aa,
					_csat_Moto_HMG,
					_csat_Moto_GMG,
					_csat_Moto_mortar
				];

// consolidate mechanized groups				
_CSAT_Mechanized = [	_csat_Mech_rifleSquad,
						_csat_Mech_at,
						_csat_Mech_aa,
						_csat_Mech_support
					];
				
// consolidate ground vehicles					
_CSAT_GroundVehicles = 	[	_csat_UnarmedVehicles,
							_csat_ArmedVehicles_Light,
							_csat_ArmedVehicles_Medium,
							_csat_ArmedVehicles_Heavy
						];
						
// consolidate air vehicles
_CSAT_AirVehicles = [	_csat_RW_Transport,
						_csat_RW_CAS,
						_csat_FW_CAS
					];
						
// consolidate static weapons
_CSAT_StaticWeapons	= 	[	_csat_Static_Mortar,
							_csat_Static_HMG,
							_csat_Static_GMG,
							_csat_Static_AT,
							_csat_Static_AA
						];	

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								FIA Units (BLU)
							  (faction #: 3)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								
								
// infantry groups
_FIA_B_Men_riflesquad	=	["B_G_Soldier_SL_F","B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_AR_F","B_G_Soldier_A_F","B_G_Soldier_LAT_F","B_G_medic_F","B_G_Soldier_F"];
_FIA_B_Men_weaponsSquad	=	["B_G_Soldier_SL_F","B_G_Soldier_AR_F","B_G_Soldier_A_F","B_G_Soldier_LAT_F","B_G_Soldier_A_F","B_G_Soldier_F","B_G_Soldier_M_F","B_G_medic_F"];
_FIA_B_Men_fireTeam		=	["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F"];
_FIA_B_Men_at			=	["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_A_F"];
_FIA_B_Men_aa			=	["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_A_F"];
_FIA_B_Men_sentry		=	["B_G_Soldier_GL_F","B_G_Soldier_TL_F"];
_FIA_B_Men_sniperTeam	=	["B_sniper_F","B_spotter_F"];
_FIA_B_Men_mortarTeam	=	["B_G_Soldier_TL_F","B_G_Soldier_exp_F","B_G_engineer_F"];

// motorized groups
_FIA_B_Moto_section		=	["B_G_Soldier_SL_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_soldier_F"];
_FIA_B_Moto_fireteam	=	["B_G_Offroad_01_armed_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F"];
_FIA_B_Moto_at			=	["B_G_Offroad_01_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_AR_F"];
_FIA_B_Moto_aa			=	["B_G_Offroad_01_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_AR_F"];
_FIA_B_Moto_hmg			=	["B_G_Offroad_01_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_AR_F"];
_FIA_B_Moto_gmg			=	["B_G_Offroad_01_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_AR_F"];
_FIA_B_Moto_mortar		=	["B_G_Offroad_01_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_AR_F"];

// mechaniszed groups
_FIA_B_Mech_riflesquad	=	["B_G_Offroad_01_armed_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_AR_F","B_G_Soldier_A_F","B_G_Soldier_LAT_F","B_G_medic_F","B_G_soldier_F"];
_FIA_B_Mech_at			=	["B_G_Offroad_01_armed_F","B_G_Soldier_SL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F"];
_FIA_B_Mech_aa			=	["B_G_Offroad_01_armed_F","B_G_Soldier_SL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F"];
_FIA_B_Mech_support		=	["B_G_Offroad_01_armed_F","B_G_Soldier_SL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F"];

// ground vehicles
_FIA_B_UnarmedVehicles 		= 	["B_G_Offroad_01_F","B_G_Van_01_transport_F"];
_FIA_B_ArmedVehicles_Light 	= 	["B_G_Offroad_01_armed_F"];
_FIA_B_ArmedVehicles_Medium =	["B_G_Offroad_01_armed_F"];
_FIA_B_ArmedVehicles_Heavy 	=	["B_G_Offroad_01_armed_F"];

// air vehicles
_FIA_B_RW_Transport = 	[""];
_FIA_B_RW_CAS 		= 	[""];
_FIA_B_FW_CAS 		= 	[""];

// static weapons
_FIA_B_Static_Mortar 	= 	["B_G_Mortar_01_F"];							
_FIA_B_Static_HMG		= 	["B_G_Mortar_01_F"];
_FIA_B_Static_GMG		=	["B_G_Mortar_01_F"];
_FIA_B_Static_AT		= 	["B_G_Mortar_01_F"];
_FIA_B_Static_AA		=	["B_G_Mortar_01_F"];

// consolidate infantry groups
_FIA_B_Infantry = [	_FIA_B_Men_riflesquad,
					_FIA_B_Men_weaponsSquad,
					_FIA_B_Men_fireTeam,
					_FIA_B_Men_at,
					_FIA_B_Men_aa,
					_FIA_B_Men_sentry,
					_FIA_B_Men_sniperTeam,
					_FIA_B_Men_mortarTeam
				];
				
// consolidate motorised groups				
_FIA_B_Motorized = [_FIA_B_Moto_section,
					_FIA_B_Moto_fireteam,
					_FIA_B_Moto_at,
					_FIA_B_Moto_aa,
					_FIA_B_Moto_hmg,
					_FIA_B_Moto_gmg,
					_FIA_B_Moto_mortar
				];

// consolidate mechanized groups					
_FIA_B_Mechanized = 	[	_FIA_B_Mech_riflesquad,
						_FIA_B_Mech_at,
						_FIA_B_Mech_aa,
						_FIA_B_Mech_support
					];	

// consolidate ground vehicles					
_FIA_B_groundVehicles = 	[	_FIA_B_UnarmedVehicles,
							_FIA_B_ArmedVehicles_Light,
							_FIA_B_ArmedVehicles_Medium,
							_FIA_B_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_FIA_B_AirVehicles = [	_FIA_B_RW_Transport,
						_FIA_B_RW_CAS,
						_FIA_B_FW_CAS
					];

// consolidate static weapons
_FIA_B_StaticWeapons	 = 	[	_FIA_B_Static_Mortar,
							_FIA_B_Static_HMG,
							_FIA_B_Static_GMG,
							_FIA_B_Static_AT,
							_FIA_B_Static_AA
						];
						
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								FIA Units (GREEN)
							  (faction #: 4)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								
								
// infantry groups
_FIA_I_Men_riflesquad	=	["I_G_Soldier_SL_F","I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_A_F","I_G_Soldier_LAT_F","I_G_medic_F","I_G_Soldier_F"];
_FIA_I_Men_weaponsSquad	=	["I_G_Soldier_SL_F","I_G_Soldier_AR_F","I_G_Soldier_A_F","I_G_Soldier_LAT_F","I_G_Soldier_A_F","I_G_Soldier_F","I_G_Soldier_M_F","I_G_medic_F"];
_FIA_I_Men_fireTeam		=	["I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_GL_F","I_G_Soldier_LAT_F"];
_FIA_I_Men_at			=	["I_G_Soldier_TL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_A_F"];
_FIA_I_Men_aa			=	["I_G_Soldier_TL_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_A_F"];
_FIA_I_Men_sentry		=	["I_G_Soldier_GL_F","I_G_Soldier_TL_F"];
_FIA_I_Men_sniperTeam	=	["I_sniper_F","I_spotter_F"];
_FIA_I_Men_mortarTeam	=	["I_G_Soldier_TL_F","I_G_Soldier_exp_F","I_G_engineer_F"];

// motorized groups
_FIA_I_Moto_section		=	["I_G_Soldier_SL_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F","I_G_Soldier_AR_F","I_G_Soldier_LAT_F","I_G_Soldier_AR_F","I_G_Soldier_LAT_F","I_G_soldier_F"];
_FIA_I_Moto_fireteam	=	["I_G_Offroad_01_armed_F","I_G_Soldier_AR_F","I_G_Soldier_LAT_F"];
_FIA_I_Moto_at			=	["I_G_Offroad_01_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_AR_F"];
_FIA_I_Moto_aa			=	["I_G_Offroad_01_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_AR_F"];
_FIA_I_Moto_hmg			=	["I_G_Offroad_01_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_AR_F"];
_FIA_I_Moto_gmg			=	["I_G_Offroad_01_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_AR_F"];
_FIA_I_Moto_mortar		=	["I_G_Offroad_01_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_AR_F"];

// mechaniszed groups
_FIA_I_Mech_riflesquad	=	["I_G_Offroad_01_armed_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_Soldier_AR_F","I_G_Soldier_A_F","I_G_Soldier_LAT_F","I_G_medic_F","I_G_soldier_F"];
_FIA_I_Mech_at			=	["I_G_Offroad_01_armed_F","I_G_Soldier_SL_F","I_G_Soldier_AR_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_Soldier_F"];
_FIA_I_Mech_aa			=	["I_G_Offroad_01_armed_F","I_G_Soldier_SL_F","I_G_Soldier_AR_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_Soldier_F"];
_FIA_I_Mech_support		=	["I_G_Offroad_01_armed_F","I_G_Soldier_SL_F","I_G_Soldier_AR_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_Soldier_F"];

// ground vehicles
_FIA_I_UnarmedVehicles 		= 	["I_G_Offroad_01_F","I_G_Van_01_transport_F"];
_FIA_I_ArmedVehicles_Light 	= 	["I_G_Offroad_01_armed_F"];
_FIA_I_ArmedVehicles_Medium =	["I_G_Offroad_01_armed_F"];
_FIA_I_ArmedVehicles_Heavy 	=	["I_G_Offroad_01_armed_F"];

// air vehicles
_FIA_I_RW_Transport = 	[""];
_FIA_I_RW_CAS 		= 	[""];
_FIA_I_FW_CAS 		= 	[""];

// static weapons
_FIA_I_Static_Mortar 	= 	["I_G_Mortar_01_F"];							
_FIA_I_Static_HMG		= 	["I_G_Mortar_01_F"];
_FIA_I_Static_GMG		=	["I_G_Mortar_01_F"];
_FIA_I_Static_AT		= 	["I_G_Mortar_01_F"];
_FIA_I_Static_AA		=	["I_G_Mortar_01_F"];

// consolidate infantry groups
_FIA_I_Infantry = [	_FIA_I_Men_riflesquad,
					_FIA_I_Men_weaponsSquad,
					_FIA_I_Men_fireTeam,
					_FIA_I_Men_at,
					_FIA_I_Men_aa,
					_FIA_I_Men_sentry,
					_FIA_I_Men_sniperTeam,
					_FIA_I_Men_mortarTeam
				];
				
// consolidate motorised groups				
_FIA_I_Motorized = [_FIA_I_Moto_section,
					_FIA_I_Moto_fireteam,
					_FIA_I_Moto_at,
					_FIA_I_Moto_aa,
					_FIA_I_Moto_hmg,
					_FIA_I_Moto_gmg,
					_FIA_I_Moto_mortar
				];

// consolidate mechanized groups					
_FIA_I_Mechanized = 	[	_FIA_I_Mech_riflesquad,
						_FIA_I_Mech_at,
						_FIA_I_Mech_aa,
						_FIA_I_Mech_support
					];	

// consolidate ground vehicles					
_FIA_I_groundVehicles = 	[	_FIA_I_UnarmedVehicles,
							_FIA_I_ArmedVehicles_Light,
							_FIA_I_ArmedVehicles_Medium,
							_FIA_I_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_FIA_I_AirVehicles = [	_FIA_I_RW_Transport,
						_FIA_I_RW_CAS,
						_FIA_I_FW_CAS
					];

// consolidate static weapons
_FIA_I_StaticWeapons	 = 	[	_FIA_I_Static_Mortar,
							_FIA_I_Static_HMG,
							_FIA_I_Static_GMG,
							_FIA_I_Static_AT,
							_FIA_I_Static_AA
						];

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								FIA Units (RED)
							  (faction #: 5)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								
								
// infantry groups
_FIA_O_Men_riflesquad	=	["O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_A_F","O_G_Soldier_LAT_F","O_G_medic_F","O_G_Soldier_F"];
_FIA_O_Men_weaponsSquad	=	["O_G_Soldier_SL_F","O_G_Soldier_AR_F","O_G_Soldier_A_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_Soldier_F","O_G_Soldier_M_F","O_G_medic_F"];
_FIA_O_Men_fireTeam		=	["O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F"];
_FIA_O_Men_at			=	["O_G_Soldier_TL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F"];
_FIA_O_Men_aa			=	["O_G_Soldier_TL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F"];
_FIA_O_Men_sentry		=	["O_G_Soldier_GL_F","O_G_Soldier_TL_F"];
_FIA_O_Men_sniperTeam	=	["O_sniper_F","O_spotter_F"];
_FIA_O_Men_mortarTeam	=	["O_G_Soldier_TL_F","O_G_Soldier_exp_F","O_G_engineer_F"];

// motorized groups
_FIA_O_Moto_section		=	["O_G_Soldier_SL_F","O_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_soldier_F"];
_FIA_O_Moto_fireteam	=	["O_G_Offroad_01_armed_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F"];
_FIA_O_Moto_at			=	["O_G_Offroad_01_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_AR_F"];
_FIA_O_Moto_aa			=	["O_G_Offroad_01_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_AR_F"];
_FIA_O_Moto_hmg			=	["O_G_Offroad_01_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_AR_F"];
_FIA_O_Moto_gmg			=	["O_G_Offroad_01_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_AR_F"];
_FIA_O_Moto_mortar		=	["O_G_Offroad_01_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_AR_F"];

// mechaniszed groups
_FIA_O_Mech_riflesquad	=	["O_G_Offroad_01_armed_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_A_F","O_G_Soldier_LAT_F","O_G_medic_F","O_G_soldier_F"];
_FIA_O_Mech_at			=	["O_G_Offroad_01_armed_F","O_G_Soldier_SL_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F"];
_FIA_O_Mech_aa			=	["O_G_Offroad_01_armed_F","O_G_Soldier_SL_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F"];
_FIA_O_Mech_support		=	["O_G_Offroad_01_armed_F","O_G_Soldier_SL_F","O_G_Soldier_AR_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F"];

// ground vehicles
_FIA_O_UnarmedVehicles 		= 	["O_G_Offroad_01_F","O_G_Van_01_transport_F"];
_FIA_O_ArmedVehicles_Light 	= 	["O_G_Offroad_01_armed_F"];
_FIA_O_ArmedVehicles_Medium =	["O_G_Offroad_01_armed_F"];
_FIA_O_ArmedVehicles_Heavy 	=	["O_G_Offroad_01_armed_F"];

// air vehicles
_FIA_O_RW_Transport = 	[""];
_FIA_O_RW_CAS 		= 	[""];
_FIA_O_FW_CAS 		= 	[""];

// static weapons
_FIA_O_Static_Mortar 	= 	["O_G_Mortar_01_F"];							
_FIA_O_Static_HMG		= 	["O_G_Mortar_01_F"];
_FIA_O_Static_GMG		=	["O_G_Mortar_01_F"];
_FIA_O_Static_AT		= 	["O_G_Mortar_01_F"];
_FIA_O_Static_AA		=	["O_G_Mortar_01_F"];

// consolidate infantry groups
_FIA_O_Infantry = [	_FIA_O_Men_riflesquad,
					_FIA_O_Men_weaponsSquad,
					_FIA_O_Men_fireTeam,
					_FIA_O_Men_at,
					_FIA_O_Men_aa,
					_FIA_O_Men_sentry,
					_FIA_O_Men_sniperTeam,
					_FIA_O_Men_mortarTeam
				];
				
// consolidate motorised groups				
_FIA_O_Motorized = [_FIA_O_Moto_section,
					_FIA_O_Moto_fireteam,
					_FIA_O_Moto_at,
					_FIA_O_Moto_aa,
					_FIA_O_Moto_hmg,
					_FIA_O_Moto_gmg,
					_FIA_O_Moto_mortar
				];

// consolidate mechanized groups					
_FIA_O_Mechanized = 	[	_FIA_O_Mech_riflesquad,
						_FIA_O_Mech_at,
						_FIA_O_Mech_aa,
						_FIA_O_Mech_support
					];	

// consolidate ground vehicles					
_FIA_O_groundVehicles = 	[	_FIA_O_UnarmedVehicles,
							_FIA_O_ArmedVehicles_Light,
							_FIA_O_ArmedVehicles_Medium,
							_FIA_O_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_FIA_O_AirVehicles = [	_FIA_O_RW_Transport,
						_FIA_O_RW_CAS,
						_FIA_O_FW_CAS
					];

// consolidate static weapons
_FIA_O_StaticWeapons = 	[	_FIA_O_Static_Mortar,
							_FIA_O_Static_HMG,
							_FIA_O_Static_GMG,
							_FIA_O_Static_AT,
							_FIA_O_Static_AA
						];
	
	
	
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							3CB BAF Units (Army)
							  (faction #: 6)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								
   
// infantry groups
_3CB_BAF_Men_riflesquad	=	["UK3CB_BAF_SC_MTP_H","UK3CB_BAF_LSW_MTP_H","UK3CB_BAF_MGLMG_MTP_H","UK3CB_BAF_Rifleman_MTP_H","UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MGLMG_MTP_H","UK3CB_BAF_LAT_MTP","UK3CB_BAF_Medic_MTP_H"];
_3CB_BAF_Men_weaponsSquad	=	["UK3CB_BAF_SC_MTP_H","UK3CB_BAF_LSW_MTP_H","UK3CB_BAF_MGGPMG_MTP_H","UK3CB_BAF_MGGPMG_MTP_H","UK3CB_BAF_LAT_MTP_H","UK3CB_BAF_Medic_MTP_H"];
_3CB_BAF_Men_fireTeam		=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MGLMG_MTP_H","UK3CB_BAF_Rifleman_MTP_H","UK3CB_BAF_Medic_MTP_H"];
_3CB_BAF_Men_at			=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MAT_MTP_H","UK3CB_BAF_LAT_ILAW_MTP_H","UK3CB_BAF_Medic_MTP"];
_3CB_BAF_Men_aa			=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MAT_MTP_H","UK3CB_BAF_LAT_ILAW_MTP_H","UK3CB_BAF_Medic_MTP"];
_3CB_BAF_Men_sentry		=	["UK3CB_BAF_Pointman_MTP_H","UK3CB_BAF_Marksman_MTP_H"];
_3CB_BAF_Men_sniperTeam	=	["UK3CB_BAF_Sharpshooter_MTP_H","UK3CB_BAF_Sharpshooter_MTP_H"];
_3CB_BAF_Men_mortarTeam	=	["UK3CB_BAF_GunnerStatic_MTP","UK3CB_BAF_GunnerStatic_MTP_H","UK3CB_BAF_Grenadier_MTP_H"];

// motorized groups
_3CB_BAF_Moto_section		=	["UK3CB_BAF_SC_MTP_H","UK3CB_BAF_LSW_MTP_H","UK3CB_BAF_MGLMG_MTP_H","UK3CB_BAF_Rifleman_MTP_H","UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MGLMG_MTP_H","UK3CB_BAF_LAT_MTP","UK3CB_BAF_Medic_MTP_H","UK3CB_BAF_Coyote_Passenger_L134A1_W"];
_3CB_BAF_Moto_fireteam		=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MGLMG_MTP_H","UK3CB_BAF_Rifleman_MTP_H","UK3CB_BAF_Medic_MTP_H", "UK3CB_BAF_Jackal2_L2A1_W"];
_3CB_BAF_Moto_at			=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MAT_MTP_H","UK3CB_BAF_LAT_ILAW_MTP_H","UK3CB_BAF_Medic_MTP", "UK3CB_BAF_Jackal2_L2A1_W"];
_3CB_BAF_Moto_aa			=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MAT_MTP_H","UK3CB_BAF_LAT_ILAW_MTP_H","UK3CB_BAF_Medic_MTP", "UK3CB_BAF_Jackal2_L2A1_W"];
_3CB_BAF_Moto_hmg			=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MAT_MTP_H","UK3CB_BAF_LAT_ILAW_MTP_H","UK3CB_BAF_Medic_MTP", "UK3CB_BAF_Jackal2_L2A1_W"];
_3CB_BAF_Moto_gmg			=	["UK3CB_BAF_FT_MTP_H","UK3CB_BAF_MAT_MTP_H","UK3CB_BAF_LAT_ILAW_MTP_H","UK3CB_BAF_Medic_MTP", "UK3CB_BAF_Jackal2_GMG_W"];
_3CB_BAF_Moto_mortar		=	["UK3CB_BAF_GunnerStatic_MTP","UK3CB_BAF_GunnerStatic_MTP_H","UK3CB_BAF_Grenadier_MTP_H","UK3CB_BAF_Jackal2_GMG_W"];

// mechaniszed groups
_3CB_BAF_Mech_riflesquad	=	_3CB_BAF_Moto_section;
_3CB_BAF_Mech_at			=	_3CB_BAF_Moto_at;
_3CB_BAF_Mech_aa			=	_3CB_BAF_Moto_gmg;
_3CB_BAF_Mech_support		=	["UK3CB_BAF_Coyote_Passenger_L134A1_W","UK3CB_BAF_Medic_MTP_H","UK3CB_BAF_Medic_MTP_H"];

// ground vehicles
_3CB_BAF_UnarmedVehicles 		= 	["UK3CB_BAF_Jackal2_GMG_W","UK3CB_BAF_Jackal2_GMG_W","UK3CB_BAF_Jackal2_GMG_W"];
_3CB_BAF_ArmedVehicles_Light 	= 	["UK3CB_BAF_Jackal2_GMG_W","UK3CB_BAF_Jackal2_L2A1_W"];
_3CB_BAF_ArmedVehicles_Medium 	=	["UK3CB_BAF_Coyote_Logistics_L134A1_W"];
_3CB_BAF_ArmedVehicles_Heavy 	=	["UK3CB_BAF_Coyote_Passenger_L134A1_D","UK3CB_BAF_Coyote_Passenger_L134A1_W","UK3CB_BAF_Coyote_Passenger_L111A1_D","UK3CB_BAF_Coyote_Passenger_L111A1_W"];

// air vehicles
_3CB_BAF_RW_Transport = 	["UK3CB_BAF_Merlin_RAF_ZJ124","UK3CB_BAF_Wildcat_Transport_RN_ZZ396"];
_3CB_BAF_RW_CAS 		= 	["UK3CB_BAF_Wildcat_Armed_Army_ZZ400"];
_3CB_BAF_FW_CAS 		= 	[""];

// static weapons
_3CB_BAF_Static_Mortar 	= 	["UK3CB_BAF_GunnerStatic_MTP","UK3CB_BAF_GunnerStatic_MTP_H","UK3CB_BAF_Grenadier_MTP_H"];							
_3CB_BAF_Static_HMG		= 	["UK3CB_BAF_GunnerStatic_MTP","UK3CB_BAF_GunnerStatic_MTP_H","UK3CB_BAF_Grenadier_MTP_H"];
_3CB_BAF_Static_GMG		=	["UK3CB_BAF_GunnerStatic_MTP","UK3CB_BAF_GunnerStatic_MTP_H","UK3CB_BAF_Grenadier_MTP_H"];
_3CB_BAF_Static_AT		= 	["UK3CB_BAF_GunnerStatic_MTP","UK3CB_BAF_GunnerStatic_MTP_H","UK3CB_BAF_MAT_MTP_H"];
_3CB_BAF_Static_AA		=	["UK3CB_BAF_GunnerStatic_MTP","UK3CB_BAF_GunnerStatic_MTP_H","UK3CB_BAF_MAT_MTP_H"];

// consolidate infantry groups
_3CB_BAF_Infantry = [	_3CB_BAF_Men_riflesquad,
						_3CB_BAF_Men_weaponsSquad,
						_3CB_BAF_Men_fireTeam,
						_3CB_BAF_Men_at,
						_3CB_BAF_Men_aa,
						_3CB_BAF_Men_sentry,
						_3CB_BAF_Men_sniperTeam,
						_3CB_BAF_Men_mortarTeam
					];
				
// consolidate motorised groups				
_3CB_BAF_Motorized = [	_3CB_BAF_Moto_section,
						_3CB_BAF_Moto_fireteam,
						_3CB_BAF_Moto_at,
						_3CB_BAF_Moto_aa,
						_3CB_BAF_Moto_hmg,
						_3CB_BAF_Moto_gmg,
						_3CB_BAF_Moto_mortar
					];

// consolidate mechanized groups					
_3CB_BAF_Mechanized = 	[	_3CB_BAF_Mech_riflesquad,
							_3CB_BAF_Mech_at,
							_3CB_BAF_Mech_aa,
							_3CB_BAF_Mech_support
						];	

// consolidate ground vehicles					
_3CB_BAF_GroundVehicles = 	[	_3CB_BAF_UnarmedVehicles,
								_3CB_BAF_ArmedVehicles_Light,
								_3CB_BAF_ArmedVehicles_Medium,
								_3CB_BAF_ArmedVehicles_Heavy
							];	
						
// consolidate air vehicles
_3CB_BAF_AirVehicles = [	_3CB_BAF_RW_Transport,
							_3CB_BAF_RW_CAS,
							_3CB_BAF_FW_CAS
						];

// consolidate static weapons
_3CB_BAF_StaticWeapons	 = 	[	_3CB_BAF_Static_Mortar,
								_3CB_BAF_Static_HMG,
								_3CB_BAF_Static_GMG,
								_3CB_BAF_Static_AT,
								_3CB_BAF_Static_AA
							];
						
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							RHS Russian Units
							(faction #: 7)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								
   
// infantry groups
_RHS_RUS_Men_riflesquad	=	["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_machinegunner","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_LAT","rhs_msv_medic","rhs_msv_rifleman"];
_RHS_RUS_Men_weaponsSquad	=	["rhs_msv_sergeant","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_LAT","rhs_msv_strelok_rpg_assist","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_medic"];
_RHS_RUS_Men_fireTeam		=	["rhs_msv_junior_sergeant","rhs_msv_machinegunner","rhs_msv_grenadier","rhs_msv_LAT"];
_RHS_RUS_Men_at			=	["rhs_msv_junior_sergeant","rhs_msv_LAT","rhs_msv_LAT","rhs_msv_strelok_rpg_assist"];
_RHS_RUS_Men_aa			=	["rhs_msv_junior_sergeant","rhs_msv_aa","rhs_msv_aa","rhs_msv_aa"];
_RHS_RUS_Men_sentry		=	["rhs_msv_grenadier","rhs_msv_rifleman"];
_RHS_RUS_Men_sniperTeam	=	["rhs_msv_marksman","rhs_msv_marksman"];
_RHS_RUS_Men_mortarTeam	=	["rhs_msv_junior_sergeant","rhs_msv_grenadier","rhs_msv_grenadier","rhs_msv_machinegunner","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant"];

// motorized groups
_RHS_RUS_Moto_section		=	["rhs_msv_sergeant","rhs_tigr_msv","rhs_tigr_msv","rhs_msv_machinegunner","rhs_msv_LAT","rhs_msv_machinegunner","rhs_msv_LAT","rhs_msv_rifleman"];
_RHS_RUS_Moto_fireteam		=	["rhs_tigr_msv","rhs_msv_machinegunner","rhs_msv_LAT"];
_RHS_RUS_Moto_at			=	["rhs_tigr_msv","rhs_msv_at","rhs_msv_at","rhs_msv_strelok_rpg_assist"];
_RHS_RUS_Moto_aa			=	["rhs_tigr_msv","rhs_msv_aa","rhs_msv_aa","rhs_msv_rifleman"];
_RHS_RUS_Moto_hmg			=	["rhs_tigr_msv","rhs_msv_junior_sergeant","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant"];
_RHS_RUS_Moto_gmg			=	["rhs_tigr_msv","rhs_msv_junior_sergeant","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant"];
_RHS_RUS_Moto_mortar		=	["rhs_tigr_msv","rhs_msv_junior_sergeant","rhs_msv_aa","rhs_msv_at"];

// mechaniszed groups
_RHS_RUS_Mech_riflesquad	=	["rhs_btr80a_msv","rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_machinegunner","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_LAT","rhs_msv_medic","rhs_msv_rifleman"];
_RHS_RUS_Mech_at			=	["rhs_btr70_msv","rhs_msv_sergeant","rhs_msv_machinegunner","rhs_msv_at","rhs_msv_at","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_strelok_rpg_assist","rhs_msv_strelok_rpg_assist"];
_RHS_RUS_Mech_aa			=	["rhs_btr80_msv","rhs_msv_sergeant","rhs_msv_machinegunner","rhs_msv_aa","rhs_msv_aa","rhs_msv_aa","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_rifleman"];
_RHS_RUS_Mech_support		=	["rhs_msv_sergeant","rhs_msv_grenadier","rhs_msv_aa","rhs_msv_machinegunner","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_btr70_msv"];

// ground vehicles
_RHS_RUS_UnarmedVehicles 		= 	["rhs_tigr_msv","RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01"];
_RHS_RUS_ArmedVehicles_Light 	= 	["rhs_btr60_msv","rhs_btr60_vdv","rhs_btr60_vmf","rhs_btr60_vv"];
_RHS_RUS_ArmedVehicles_Medium 	=	["rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp2_msv","rhs_bmp2e_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_brm1k_msv","rhs_prp3_msv"];
_RHS_RUS_ArmedVehicles_Heavy 	=	["rhs_t72ba_tv","rhs_t72bb_tv","rhs_t80u","rhs_t80bv","rhs_t80bv","rhs_t80bk","rhs_t80b","rhs_t80a","rhs_t72bd_tv","rhs_t72bd_tv","rhs_t72bc_tv"];

// air vehicles
_RHS_RUS_RW_Transport = 	["RHS_Mi8AMT_vdv","RHS_Mi8mt_vdv","RHS_Mi8MTV3_vdv"];
_RHS_RUS_RW_CAS 		= 	["RHS_Mi8MTV3_vdv","RHS_Mi24P_vdv","RHS_Mi24V_vdv"];
_RHS_RUS_FW_CAS 		= 	["RHS_Mi8MTV3_vdv","RHS_Mi24P_vdv","RHS_Mi24V_vdv"];

// static weapons
_RHS_RUS_Static_Mortar 	= 	["rhs_msv_LAT","rhs_msv_grenadier"];							
_RHS_RUS_Static_HMG		= 	["RHS_NSV_TriPod_VDV"];
_RHS_RUS_Static_GMG		=	["rhs_msv_machinegunner","RHS_NSV_TriPod_VDV"];
_RHS_RUS_Static_AT		= 	["rhs_msv_at","rhs_msv_at"];
_RHS_RUS_Static_AA		=	["rhs_msv_aa","rhs_msv_aa"];

// consolidate infantry groups
_RHS_RUS_Infantry = [	_RHS_RUS_Men_riflesquad,
					_RHS_RUS_Men_weaponsSquad,
					_RHS_RUS_Men_fireTeam,
					_RHS_RUS_Men_at,
					_RHS_RUS_Men_aa,
					_RHS_RUS_Men_sentry,
					_RHS_RUS_Men_sniperTeam,
					_RHS_RUS_Men_mortarTeam
				];
				
// consolidate motorised groups				
_RHS_RUS_Motorized = [_RHS_RUS_Moto_section,
					_RHS_RUS_Moto_fireteam,
					_RHS_RUS_Moto_at,
					_RHS_RUS_Moto_aa,
					_RHS_RUS_Moto_hmg,
					_RHS_RUS_Moto_gmg,
					_RHS_RUS_Moto_mortar
				];

// consolidate mechanized groups					
_RHS_RUS_Mechanized = 	[	_RHS_RUS_Mech_riflesquad,
						_RHS_RUS_Mech_at,
						_RHS_RUS_Mech_aa,
						_RHS_RUS_Mech_support
					];	

// consolidate ground vehicles					
_RHS_RUS_GroundVehicles = 	[	_RHS_RUS_UnarmedVehicles,
							_RHS_RUS_ArmedVehicles_Light,
							_RHS_RUS_ArmedVehicles_Medium,
							_RHS_RUS_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_RHS_RUS_AirVehicles = [	_RHS_RUS_RW_Transport,
						_RHS_RUS_RW_CAS,
						_RHS_RUS_FW_CAS
					];

// consolidate static weapons
_RHS_RUS_StaticWeapons	 = 	[	_RHS_RUS_Static_Mortar,
							_RHS_RUS_Static_HMG,
							_RHS_RUS_Static_GMG,
							_RHS_RUS_Static_AT,
							_RHS_RUS_Static_AA
						];			

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							MAS African Gov (Ind) Units
							(faction #: 8)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								

// infantry groups
_MAS_IND_Men_riflesquad	=	["I_mas_afr_Soldier_SL_F","I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_MG_F","I_mas_afr_Soldier_GL_F","I_mas_afr_soldier_LAT_F","I_mas_afr_medic_F","I_mas_afr_Soldier_F"];
_MAS_IND_Men_weaponsSquad	=	["I_mas_afr_Soldier_SL_F","I_mas_afr_soldier_MG_F","I_mas_afr_Soldier_GL_F","I_mas_afr_soldier_LAT_F","I_mas_afr_Soldier_GL_F","I_mas_afr_Soldier_F","I_mas_afr_Soldier_F","I_mas_afr_medic_F"];
_MAS_IND_Men_fireTeam		=	["I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_MG_F","I_mas_afr_Soldier_GL_F","I_mas_afr_soldier_LAT_F"];
_MAS_IND_Men_at			=	["I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_LAT_F","I_mas_afr_soldier_LAT_F","I_mas_afr_Soldier_GL_F"];
_MAS_IND_Men_aa			=	["I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAA_F"];
_MAS_IND_Men_sentry		=	["I_mas_afr_Soldier_GL_F","I_mas_afr_Soldier_F"];
_MAS_IND_Men_sniperTeam	=	["I_mas_afr_soldier_M_F","I_mas_afr_soldier_M_F"];
_MAS_IND_Men_mortarTeam	=	["I_mas_afr_Soldier_TL_F","I_mas_afr_Soldier_GL_F","I_mas_afr_Soldier_GL_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_MG_F","I_mas_afr_Soldier_GL_F"];

// motorized groups
_MAS_IND_Moto_section		=	["I_mas_afr_Soldier_SL_F","I_mas_afr_MRAP_03_F","I_mas_afr_MRAP_03_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_LAT_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_LAT_F","I_mas_afr_Soldier_F"];
_MAS_IND_Moto_fireteam		=	["I_mas_afr_MRAP_03_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_LAT_F"];
_MAS_IND_Moto_at			=	["I_mas_afr_MRAP_03_F","I_mas_afr_soldier_LAT_F","I_mas_afr_soldier_LAT_F","I_mas_afr_Soldier_GL_F"];
_MAS_IND_Moto_aa			=	["I_mas_afr_MRAP_03_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAA_F","I_mas_afr_Soldier_F"];
_MAS_IND_Moto_hmg			=	["I_mas_afr_MRAP_03_F","I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_MG_F","I_mas_afr_Soldier_GL_F"];
_MAS_IND_Moto_gmg			=	["I_mas_afr_MRAP_03_F","I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_MG_F","I_mas_afr_Soldier_GL_F"];
_MAS_IND_Moto_mortar		=	["I_mas_afr_MRAP_03_F","I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAT_F"];

// mechaniszed groups
_MAS_IND_Mech_riflesquad	=	["I_mas_afr_BMP1_F","I_mas_afr_Soldier_SL_F","I_mas_afr_Soldier_TL_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_MG_F","I_mas_afr_Soldier_GL_F","I_mas_afr_soldier_LAT_F","I_mas_afr_medic_F","I_mas_afr_Soldier_F"];
_MAS_IND_Mech_at			=	["I_mas_afr_BMP1_F","I_mas_afr_Soldier_SL_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_LAT_F","I_mas_afr_soldier_LAT_F","I_mas_afr_soldier_LAT_F","I_mas_afr_Soldier_GL_F","I_mas_afr_Soldier_GL_F","I_mas_afr_Soldier_GL_F"];
_MAS_IND_Mech_aa			=	["I_mas_afr_BMP1_F","I_mas_afr_Soldier_SL_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAA_F","I_mas_afr_Soldier_F","I_mas_afr_Soldier_F","I_mas_afr_Soldier_F"];
_MAS_IND_Mech_support		=	["I_mas_afr_BMP1_F","I_mas_afr_Soldier_SL_F","I_mas_afr_soldier_MG_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAA_F","I_mas_afr_soldier_LAA_F","I_mas_afr_Soldier_F","I_mas_afr_Soldier_F","I_mas_afr_Soldier_F"];

// ground vehicles
_MAS_IND_UnarmedVehicles 		= 	["I_mas_afr_MRAP_03_F","I_mas_afr_Offroad_01s_F","I_mas_afr_Offroad_01_F","I_mas_afr_Truck_02_covered_F","I_mas_afr_Truck_02_transport_F"];
_MAS_IND_ArmedVehicles_Light 	= 	["I_mas_afr_Offroad_01_armed_F","I_mas_afr_Offroad_01_armed_AGS_F","I_mas_afr_Offroad_01_armed_AT_F","I_mas_afr_Offroad_01_armed_RKTS_F","I_mas_afr_Offroad_01s_armed_F","I_mas_afr_MRAP_03_hmg_F", "I_mas_afr_MRAP_03_gmg_F", "I_mas_afr_MRAP_03_AT_F"];
_MAS_IND_ArmedVehicles_Medium 	=	["I_mas_afr_Truck_02_BM21_F","I_mas_afr_Truck_02_ZU23_F","I_mas_afr_BTR60","I_mas_afr_BRDM2","I_mas_afr_BMP1_F","I_mas_afr_BMP1P_F","I_mas_afr_BMP2_F","I_mas_afr_BMP2_HQ_F","I_mas_afr_BMP2_Ambul_F"];
_MAS_IND_ArmedVehicles_Heavy 	=	["I_mas_afr_T72_F","I_mas_afr_T55_F","I_mas_afr_T34_F","I_mas_afr_ZSU_F"];

// air vehicles
_MAS_IND_RW_Transport = 	["I_mas_afr_MI8"];
_MAS_IND_RW_CAS 		= 	["I_mas_afr_MI8MTV","I_mas_afr_MI24"];
_MAS_IND_FW_CAS 		= 	["I_mas_afr_MI8MTV","I_mas_afr_MI24"];

// static weapons
_MAS_IND_Static_Mortar 	= 	["I_mas_afr_Soldier_smort_F","I_mas_afr_Mortar_01_F"];							
_MAS_IND_Static_HMG		= 	["I_mas_afr_HMG_01_high_F"];
_MAS_IND_Static_GMG		=	["I_mas_afr_GMG_01_high_F"];
_MAS_IND_Static_AT		= 	["I_mas_afr_D30_AT_F"];
_MAS_IND_Static_AA		=	["I_mas_afr_ZU23_F"];

// consolidate infantry groups
_MAS_IND_Infantry = [	_MAS_IND_Men_riflesquad,
					_MAS_IND_Men_weaponsSquad,
					_MAS_IND_Men_fireTeam,
					_MAS_IND_Men_at,
					_MAS_IND_Men_aa,
					_MAS_IND_Men_sentry,
					_MAS_IND_Men_sniperTeam,
					_MAS_IND_Men_mortarTeam
				];
				
// consolidate motorised groups				
_MAS_IND_Motorized = [_MAS_IND_Moto_section,
					_MAS_IND_Moto_fireteam,
					_MAS_IND_Moto_at,
					_MAS_IND_Moto_aa,
					_MAS_IND_Moto_hmg,
					_MAS_IND_Moto_gmg,
					_MAS_IND_Moto_mortar
				];

// consolidate mechanized groups					
_MAS_IND_Mechanized = 	[	_MAS_IND_Mech_riflesquad,
						_MAS_IND_Mech_at,
						_MAS_IND_Mech_aa,
						_MAS_IND_Mech_support
					];	

// consolidate ground vehicles					
_MAS_IND_GroundVehicles = 	[	_MAS_IND_UnarmedVehicles,
							_MAS_IND_ArmedVehicles_Light,
							_MAS_IND_ArmedVehicles_Medium,
							_MAS_IND_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_MAS_IND_AirVehicles = [	_MAS_IND_RW_Transport,
						_MAS_IND_RW_CAS,
						_MAS_IND_FW_CAS
					];

// consolidate static weapons
_MAS_IND_StaticWeapons	 = 	[	_MAS_IND_Static_Mortar,
							_MAS_IND_Static_HMG,
							_MAS_IND_Static_GMG,
							_MAS_IND_Static_AT,
							_MAS_IND_Static_AA
						];			

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							MAS African Rebel, Foreign & Armed Civ (Opf) Units
							(faction #: 9)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								

// infantry groups
_MAS_OPF_Men_riflesquad	=	["O_mas_afr_recon_TL_F","O_mas_afr_Rebel1_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_AR_F","O_mas_afr_Rebel6_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_medic_F","O_mas_afr_Rebel1_F"];
_MAS_OPF_Men_weaponsSquad	=	["O_mas_afr_recon_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_Rebel6_F","O_mas_afr_recon_LAT_F","O_mas_afr_Rebel7_F","O_mas_afr_Rebel1_F","O_mas_afr_Rebel2_F","O_mas_afr_recon_medic_F"];
_MAS_OPF_Men_fireTeam		=	["O_mas_afr_Soldier_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_LAA_F"];
//Switched LAT for LAA in fireteam for Isla_Morte Op
_MAS_OPF_Men_at			=	["O_mas_afr_recon_TL_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_LAT_F","O_mas_afr_Rebel7_F"];
_MAS_OPF_Men_aa			=	["O_mas_afr_recon_TL_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAA_F"];
_MAS_OPF_Men_sentry		=	["O_mas_afr_Rebel6_F","O_mas_afr_Rebel1_F"];
_MAS_OPF_Men_sniperTeam	=	["O_mas_afr_recon_M_F","O_mas_afr_recon_M_F"];
_MAS_OPF_Men_mortarTeam	=	["O_mas_afr_recon_TL_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel7_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_AR_F","O_mas_afr_Rebel8_F"];

// motorized groups
_MAS_OPF_Moto_section		=	["O_mas_afr_recon_TL_F","O_mas_afr_MRAP_03_F","O_mas_afr_MRAP_03_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_LAT_F","O_mas_afr_Rebel2_F"];
_MAS_OPF_Moto_fireteam		=	["O_mas_afr_MRAP_03_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_LAT_F"];
_MAS_OPF_Moto_at			=	["O_mas_afr_MRAP_03_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_LAT_F","O_mas_afr_Rebel6_F"];
_MAS_OPF_Moto_aa			=	["O_mas_afr_MRAP_03_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAA_F","O_mas_afr_Rebel1_F"];
_MAS_OPF_Moto_hmg			=	["O_mas_afr_MRAP_03_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_Rebel6_F"];
_MAS_OPF_Moto_gmg			=	["O_mas_afr_MRAP_03_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_Rebel6_F"];
_MAS_OPF_Moto_mortar		=	["O_mas_afr_MRAP_03_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAT_F"];

// mechaniszed groups
_MAS_OPF_Mech_riflesquad	=	["O_mas_afr_BMP1_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_AR_F","O_mas_afr_Rebel6_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_medic_F","O_mas_afr_Rebel1_F"];
_MAS_OPF_Mech_at			=	["O_mas_afr_BMP1_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_LAT_F","O_mas_afr_recon_LAT_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel7_F","O_mas_afr_Rebel8_F"];
_MAS_OPF_Mech_aa			=	["O_mas_afr_BMP1_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAA_F","O_mas_afr_Rebel1_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel3_F"];
_MAS_OPF_Mech_support		=	["O_mas_afr_BMP1_F","O_mas_afr_recon_TL_F","O_mas_afr_recon_AR_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAA_F","O_mas_afr_recon_LAA_F","O_mas_afr_Rebel1_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel3_F"];

// ground vehicles
_MAS_OPF_UnarmedVehicles 		= 	["O_mas_afr_MRAP_03_F","O_mas_afr_Offroad_01s_F","O_mas_afr_Offroad_01_F","O_mas_afr_Truck_02_covered_F","O_mas_afr_Truck_02_transport_F"];
_MAS_OPF_ArmedVehicles_Light 	= 	["O_mas_afr_Offroad_01_armed_F"]; //,"O_mas_afr_Offroad_01_armed_AGS_F","O_mas_afr_Offroad_01_armed_AT_F","O_mas_afr_Offroad_01_armed_RKTS_F","O_mas_afr_Offroad_01s_armed_F"
_MAS_OPF_ArmedVehicles_Medium 	=	["O_mas_afr_Truck_02_BM21_F","O_mas_afr_Truck_02_ZU23_F","O_mas_afr_BTR60","O_mas_afr_BRDM2","O_mas_afr_BMP1_F","O_mas_afr_BMP1P_F","O_mas_afr_BMP2_F","O_mas_afr_BMP2_HQ_F","O_mas_afr_BMP2_Ambul_F"];
_MAS_OPF_ArmedVehicles_Heavy 	=	["O_mas_afr_T72_F","O_mas_afr_T55_F","O_mas_afr_T34_F","O_mas_afr_ZSU_F"];

// air vehicles
_MAS_OPF_RW_Transport = 	["O_mas_afr_MI8"];
_MAS_OPF_RW_CAS 		= 	["O_mas_afr_MI8MTV","O_mas_afr_MI24"];
_MAS_OPF_FW_CAS 		= 	["O_mas_afr_MI8MTV","O_mas_afr_MI24"];

// static weapons
_MAS_OPF_Static_Mortar 	= 	["O_mas_afr_Soldier_smort_F","O_mas_afr_Mortar_01_F"];							
_MAS_OPF_Static_HMG		= 	["O_mas_afr_HMG_01_high_F"];
_MAS_OPF_Static_GMG		=	["O_mas_afr_GMG_01_high_F"];
_MAS_OPF_Static_AT		= 	["O_mas_afr_D30_AT_F"];
_MAS_OPF_Static_AA		=	["O_mas_afr_ZU23_F"];

// consolidate infantry groups
_MAS_OPF_Infantry = [	_MAS_OPF_Men_riflesquad,
					_MAS_OPF_Men_weaponsSquad,
					_MAS_OPF_Men_fireTeam,
					_MAS_OPF_Men_at,
					_MAS_OPF_Men_aa,
					_MAS_OPF_Men_sentry,
					_MAS_OPF_Men_sniperTeam,
					_MAS_OPF_Men_mortarTeam
				];
				
// consolidate motorised groups				
_MAS_OPF_Motorized = [_MAS_OPF_Moto_section,
					_MAS_OPF_Moto_fireteam,
					_MAS_OPF_Moto_at,
					_MAS_OPF_Moto_aa,
					_MAS_OPF_Moto_hmg,
					_MAS_OPF_Moto_gmg,
					_MAS_OPF_Moto_mortar
				];

// consolidate mechanized groups					
_MAS_OPF_Mechanized = 	[	_MAS_OPF_Mech_riflesquad,
						_MAS_OPF_Mech_at,
						_MAS_OPF_Mech_aa,
						_MAS_OPF_Mech_support
					];	

// consolidate ground vehicles					
_MAS_OPF_GroundVehicles = 	[	_MAS_OPF_UnarmedVehicles,
							_MAS_OPF_ArmedVehicles_Light,
							_MAS_OPF_ArmedVehicles_Medium,
							_MAS_OPF_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_MAS_OPF_AirVehicles = [	_MAS_OPF_RW_Transport,
						_MAS_OPF_RW_CAS,
						_MAS_OPF_FW_CAS
					];

// consolidate static weapons
_MAS_OPF_StaticWeapons	 = 	[	_MAS_OPF_Static_Mortar,
							_MAS_OPF_Static_HMG,
							_MAS_OPF_Static_GMG,
							_MAS_OPF_Static_AT,
							_MAS_OPF_Static_AA
						];			
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							MAS African Armed Civ (CIV) Units
							(faction #: 10)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */								

// infantry groups
_MAS_CIV_Men_riflesquad	=	["O_mas_afr_Rebel6a_F","O_mas_afr_Rebel1_F"];
_MAS_CIV_Men_weaponsSquad	=	["O_mas_afr_Rebel5_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel5_F"];
_MAS_CIV_Men_fireTeam		=	["C_mas_afr_7","O_mas_afr_Rebel5_F","C_mas_afr_doc","O_mas_afr_Rebel6_F","O_mas_afr_Rebel4_F","O_mas_afr_Rebel3_F"];
_MAS_CIV_Men_at			=	["O_mas_afr_Rebel8a_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel6_F"];
_MAS_CIV_Men_aa			=	["O_mas_afr_Rebel8a_F","O_mas_afr_Rebel6a_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel6a_F"];
_MAS_CIV_Men_sentry		=	["C_mas_afr_3","C_mas_afr_6","O_mas_afr_Rebel8a_F","O_mas_afr_Rebel3_F","O_mas_afr_Rebel5_F"];
_MAS_CIV_Men_sniperTeam	=	["O_mas_afr_Rebel7_F","O_mas_afr_Rebel7_F"];
_MAS_CIV_Men_mortarTeam	=	["C_mas_afr_1","C_mas_afr_2","O_mas_afr_Rebel3_F","O_mas_afr_Rebel6a_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel6_F"];

// motorized groups
_MAS_CIV_Moto_section		=	[];
_MAS_CIV_Moto_fireteam		=	[];
_MAS_CIV_Moto_at			=	[];
_MAS_CIV_Moto_aa			=	[];
_MAS_CIV_Moto_hmg			=	[];
_MAS_CIV_Moto_gmg			=	[];
_MAS_CIV_Moto_mortar		=	[];

// mechaniszed groups
_MAS_CIV_Mech_riflesquad	=	[];
_MAS_CIV_Mech_at			=	[];
_MAS_CIV_Mech_aa			=	[];
_MAS_CIV_Mech_support		=	[];

// ground vehicles
_MAS_CIV_UnarmedVehicles 		= 	[];
_MAS_CIV_ArmedVehicles_Light 	= 	[];
_MAS_CIV_ArmedVehicles_Medium 	=	[];
_MAS_CIV_ArmedVehicles_Heavy 	=	[];

// air vehicles
_MAS_CIV_RW_Transport = 	[];
_MAS_CIV_RW_CAS 		= 	[];
_MAS_CIV_FW_CAS 		= 	[];

// static weapons
_MAS_CIV_Static_Mortar 	= 	[];							
_MAS_CIV_Static_HMG		= 	[];
_MAS_CIV_Static_GMG		=	[];
_MAS_CIV_Static_AT		= 	[];
_MAS_CIV_Static_AA		=	[];

// consolidate infantry groups
_MAS_CIV_Infantry = [	_MAS_CIV_Men_riflesquad,
					_MAS_CIV_Men_weaponsSquad,
					_MAS_CIV_Men_fireTeam,
					_MAS_CIV_Men_at,
					_MAS_CIV_Men_aa,
					_MAS_CIV_Men_sentry,
					_MAS_CIV_Men_sniperTeam,
					_MAS_CIV_Men_mortarTeam
				];
				
// consolidate motorised groups				
_MAS_CIV_Motorized = [_MAS_CIV_Moto_section,
					_MAS_CIV_Moto_fireteam,
					_MAS_CIV_Moto_at,
					_MAS_CIV_Moto_aa,
					_MAS_CIV_Moto_hmg,
					_MAS_CIV_Moto_gmg,
					_MAS_CIV_Moto_mortar
				];

// consolidate mechanized groups					
_MAS_CIV_Mechanized = 	[	_MAS_CIV_Mech_riflesquad,
						_MAS_CIV_Mech_at,
						_MAS_CIV_Mech_aa,
						_MAS_CIV_Mech_support
					];	

// consolidate ground vehicles					
_MAS_CIV_GroundVehicles = 	[	_MAS_CIV_UnarmedVehicles,
							_MAS_CIV_ArmedVehicles_Light,
							_MAS_CIV_ArmedVehicles_Medium,
							_MAS_CIV_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_MAS_CIV_AirVehicles = [	_MAS_CIV_RW_Transport,
						_MAS_CIV_RW_CAS,
						_MAS_CIV_FW_CAS
					];

// consolidate static weapons
_MAS_CIV_StaticWeapons	 = 	[	_MAS_CIV_Static_Mortar,
							_MAS_CIV_Static_HMG,
							_MAS_CIV_Static_GMG,
							_MAS_CIV_Static_AT,
							_MAS_CIV_Static_AA
						];			

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					CONSOLIDATE ALL GROUPS					
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
STB_Infantry = 		[	[_NATO_Infantry, west],
						[_AAF_Infantry, resistance],
						[_CSAT_Infantry, east],
						[_FIA_B_Infantry, west],
						[_FIA_I_Infantry, resistance],
						[_FIA_O_Infantry, east],
						[_3CB_BAF_Infantry, west],
						[_RHS_RUS_Infantry, east],
						[_MAS_IND_Infantry, resistance],
						[_MAS_OPF_Infantry, east],
						[_MAS_CIV_Infantry, civilian]
					];
				
STB_Motorized = 	[	[_NATO_Motorized, west],
						[_AAF_Motorized, resistance],
						[_CSAT_Motorized, east],
						[_FIA_B_Motorized, west],
						[_FIA_I_Motorized, resistance],
						[_FIA_O_Motorized, east],
						[_3CB_BAF_Motorized, west],
						[_RHS_RUS_Motorized, east],
						[_MAS_IND_Motorized, resistance],
						[_MAS_OPF_Motorized, east],
						[_MAS_CIV_Motorized, civilian]
					];	
				
STB_Mechanized = 	[	[_NATO_Mechanized, west],
						[_AAF_Mechanized, resistance],
						[_CSAT_Mechanized, east],
						[_FIA_B_Mechanized, west],
						[_FIA_I_Mechanized, resistance],
						[_FIA_O_Mechanized, east],
						[_3CB_BAF_Mechanized, west],
						[_RHS_RUS_Mechanized, east],
						[_MAS_IND_Mechanized, resistance],
						[_MAS_OPF_Mechanized, east],
						[_MAS_CIV_Mechanized, civilian]	
					];
				
STB_GroundVehicles = [	[_NATO_GroundVehicles, west],
						[_AAF_GroundVehicles, resistance],
						[_CSAT_GroundVehicles, east],
						[_FIA_B_GroundVehicles, west],
						[_FIA_I_GroundVehicles, resistance],
						[_FIA_O_GroundVehicles, east],
						[_3CB_BAF_GroundVehicles, west],
						[_RHS_RUS_GroundVehicles, east],
						[_MAS_IND_GroundVehicles, resistance],
						[_MAS_OPF_GroundVehicles, east],
						[_MAS_CIV_GroundVehicles, civilian]
					];
					
STB_AirVehicles =	[	[_NATO_AirVehicles, west],
						[_AAF_AirVehicles, resistance],
						[_CSAT_AirVehicles, east],
						[_FIA_B_AirVehicles, west],
						[_FIA_I_AirVehicles, resistance],
						[_FIA_O_AirVehicles, east],
						[_3CB_BAF_AirVehicles, west],
						[_RHS_RUS_AirVehicles, east],
						[_MAS_IND_AirVehicles, resistance],
						[_MAS_OPF_AirVehicles, east],
						[_MAS_CIV_AirVehicles, civilian]
					];
				
STB_StaticWeapons = [	[_NATO_StaticWeapons, west],
						[_AAF_StaticWeapons, resistance],
						[_CSAT_StaticWeapons, east],
						[_FIA_B_StaticWeapons, west],
						[_FIA_I_StaticWeapons, resistance],
						[_FIA_O_StaticWeapons, east],
						[_3CB_BAF_StaticWeapons, west],
						[_RHS_RUS_StaticWeapons, east],
						[_MAS_IND_StaticWeapons, resistance],
						[_MAS_OPF_StaticWeapons, east],
						[_MAS_CIV_StaticWeapons, civilian]
					];
				