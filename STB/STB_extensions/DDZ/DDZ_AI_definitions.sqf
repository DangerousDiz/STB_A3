/*
	Custom AI_Definitions:
	File to add Custom AI definitions not supported by default in the framework.

*/

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							Faction: MAS African Armed Civ (CIV) Units
							Required: @african_conflict
							Description: Custom Faction for a mission, Civilian Units are grouped with East Units to create herded civilians and guards
								Additional Groups of just East Units are used to simplify mission scripts.
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */	
/*
Change this value to the side you want the custom faction to be on, options are:-
	east
	west
	resistance
	civilian
*/

_side = civilian;
//Dont delete any group definition variables just fill out what you'd like to use.

// infantry groups
_Men_riflesquad	=	["O_mas_afr_Rebel6a_F","O_mas_afr_Rebel1_F"];
_Men_weaponsSquad	=	["O_mas_afr_Rebel5_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel5_F"];
_Men_fireTeam		=	["C_mas_afr_7","O_mas_afr_Rebel5_F","C_mas_afr_doc","O_mas_afr_Rebel6_F","O_mas_afr_Rebel4_F","O_mas_afr_Rebel3_F"];
_Men_at			=	["O_mas_afr_Rebel8a_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel6_F","O_mas_afr_Rebel6_F"];
_Men_aa			=	["O_mas_afr_Rebel8a_F","O_mas_afr_Rebel6a_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel6a_F"];
_Men_sentry		=	["C_mas_afr_3","C_mas_afr_6","O_mas_afr_Rebel8a_F","O_mas_afr_Rebel3_F","O_mas_afr_Rebel5_F"];
_Men_sniperTeam	=	["O_mas_afr_Rebel7_F","O_mas_afr_Rebel7_F"];
_Men_mortarTeam	=	["C_mas_afr_1","C_mas_afr_2","O_mas_afr_Rebel3_F","O_mas_afr_Rebel6a_F","O_mas_afr_Rebel2_F","O_mas_afr_Rebel6_F"];

// motorized groups
_Moto_section		=	[];
_Moto_fireteam		=	[];
_Moto_at			=	[];
_Moto_aa			=	[];
_Moto_hmg			=	[];
_Moto_gmg			=	[];
_Moto_mortar		=	[];

// mechaniszed groups
_Mech_riflesquad	=	[];
_Mech_at			=	[];
_Mech_aa			=	[];
_Mech_support		=	[];

// ground vehicles
_UnarmedVehicles 		= 	[];
_ArmedVehicles_Light 	= 	[];
_ArmedVehicles_Medium 	=	[];
_ArmedVehicles_Heavy 	=	[];

// air vehicles
_RW_Transport = 	[];
_RW_CAS 		= 	[];
_FW_CAS 		= 	[];

// static weapons
_Static_Mortar 	= 	[];							
_Static_HMG		= 	[];
_Static_GMG		=	[];
_Static_AT		= 	[];
_Static_AA		=	[];

// consolidate infantry groups
_Infantry = [	_Men_riflesquad,
					_Men_weaponsSquad,
					_Men_fireTeam,
					_Men_at,
					_Men_aa,
					_Men_sentry,
					_Men_sniperTeam,
					_Men_mortarTeam
				];
				
// consolidate motorised groups				
_Motorized = [_Moto_section,
					_Moto_fireteam,
					_Moto_at,
					_Moto_aa,
					_Moto_hmg,
					_Moto_gmg,
					_Moto_mortar
				];

// consolidate mechanized groups					
_Mechanized = 	[	_Mech_riflesquad,
						_Mech_at,
						_Mech_aa,
						_Mech_support
					];	

// consolidate ground vehicles					
_GroundVehicles = 	[	_UnarmedVehicles,
							_ArmedVehicles_Light,
							_ArmedVehicles_Medium,
							_ArmedVehicles_Heavy
						];	
						
// consolidate air vehicles
_AirVehicles = [	_RW_Transport,
						_RW_CAS,
						_FW_CAS
					];

// consolidate static weapons
_StaticWeapons	 = 	[	_Static_Mortar,
							_Static_HMG,
							_Static_GMG,
							_Static_AT,
							_Static_AA
						];			

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					CONSOLIDATE ALL GROUPS					
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
STB_Infantry pushBack [_Infantry, _side];
					
				
STB_Motorized pushBack [_Motorized, _side];
				
STB_Mechanized pushBack [_Mechanized, _side];
				
STB_GroundVehicles pushBack	[_GroundVehicles, _side];
					
STB_AirVehicles pushBack [_AirVehicles, _side];
				
STB_StaticWeapons pushBack [_StaticWeapons, _side];