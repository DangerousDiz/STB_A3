if(STB_DebugEnabled) then {
	systemchat "New Definitions found";
};
/*
	Custom AI_Definitions:
	File to add Custom AI definitions not supported by default in the framework.

*/

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							Faction: LOP_UN
							Required: @ProjectOPFOR
							Description: UN Peacekeepers
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */	
if(STB_DebugEnabled) then {
	systemchat format ["Loading Definitions - New Faction # %1", (count STB_Infantry)];
};
//Dont delete any group definition variables just fill out what you'd like to use.

// infantry groups
_Men_riflesquad	= ["LOP_UN_Infantry_SL","LOP_UN_Infantry_Corpsman","LOP_UN_Infantry_Rifleman","LOP_UN_Infantry_Rifleman","LOP_UN_Infantry_MG","LOP_UN_Infantry_Rifleman_4","LOP_UN_Infantry_MG","LOP_UN_Infantry_Engineer"]; 
_Men_weaponsSquad = ["LOP_UN_Infantry_SL","LOP_UN_Infantry_Corpsman","LOP_UN_Infantry_Rifleman_4","LOP_UN_Infantry_Engineer","LOP_UN_Infantry_MG","LOP_UN_Infantry_MG_Asst","LOP_UN_Infantry_MG","LOP_UN_Infantry_MG_Asst"];
_Men_fireTeam =	["LOP_UN_Infantry_SL","LOP_UN_Infantry_Corpsman","LOP_UN_Infantry_GL","LOP_UN_Infantry_Engineer"];
_Men_at	= ["LOP_UN_Infantry_TL","LOP_UN_Infantry_AT","LOP_UN_Infantry_AT","LOP_UN_Infantry_AT_Asst"];
_Men_aa	= ["LOP_UN_Infantry_TL","LOP_UN_Infantry_AA","LOP_UN_Infantry_AA","LOP_UN_Infantry_GL"];
_Men_sentry	= ["LOP_UN_Infantry_GL","LOP_UN_Infantry_GL"];
_Men_sniperTeam	=	["LOP_UN_Infantry_Marksman","LOP_UN_Infantry_Engineer"];
_Men_mortarTeam	=	["LOP_UN_Infantry_SL","LOP_UN_Infantry_Corpsman","LOP_UN_Infantry_AT","LOP_UN_Infantry_AT_Asst","LOP_UN_Infantry_MG","LOP_UN_Infantry_MG_Asst","LOP_UN_Infantry_Engineer","LOP_UN_Infantry_Engineer"];

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
_UnarmedVehicles 		= 	["LOP_UN_Ural_open","LOP_UN_Ural","LOP_UN_UAZ","LOP_UN_UAZ_Open","LOP_UN_Offroad"];
_ArmedVehicles_Light 	= 	["LOP_UN_UAZ_AGS","LOP_UN_UAZ_DshKM","LOP_UN_UAZ_SPG"];
_ArmedVehicles_Medium 	=	["LOP_UN_BTR70","LOP_UN_BTR60"];
_ArmedVehicles_Heavy 	=	["LOP_UN_BMP1","LOP_UN_BMP1D","LOP_UN_BMP2","LOP_UN_BMP2D"];

// air vehicles
_RW_Transport = 	["LOP_UN_Mi8MT_Cargo"];
_RW_CAS 		= 	["LOP_UN_Mi8MTV3_FAB","LOP_UN_Mi8MTV3_UPK23","LOP_UN_Mi24V_AT"];
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
_Motorized = [	_Moto_section,
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

STB_Infantry = STB_Infantry + [[_Infantry, resistance]];
					
STB_Motorized = STB_Motorized + [[_Motorized, resistance]];
				
STB_Mechanized = STB_Mechanized + [[_Mechanized, resistance]];
				
STB_GroundVehicles = STB_GroundVehicles + [[_GroundVehicles, resistance]];
					
STB_AirVehicles = STB_AirVehicles + [[_AirVehicles, resistance]];
				
STB_StaticWeapons = STB_StaticWeapons + [[_StaticWeapons, resistance]];
/*
   Change the side to the side you want the custom faction to be on, options are:-
	east
	west
	resistance
	civilian
*/
if(STB_DebugEnabled) then {
	systemchat format ["STB_Debug (%1) - Loaded Definitions - New Faction # %2", time, ( (count STB_Infantry) - 1)];
};
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							Faction: RHSGREF_CHDK_INS
							Required: @ProjectOPFOR
							Description: CHDK Insurgents
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */


// infantry groups
_Men_riflesquad	=	["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_grenadier_rpg","rhsgref_ins_rifleman_RPG26","rhsgref_ins_machinegunner","rhsgref_ins_rifleman","rhsgref_ins_rifleman_aks74"]; 
_Men_weaponsSquad	=	["rhsgref_ins_squadleader","rhsgref_ins_machinegunner","rhsgref_ins_rifleman_RPG26","rhsgref_ins_machinegunner","rhsgref_ins_rifleman_RPG26","rhsgref_ins_grenadier_rpg"];
_Men_fireTeam		=	["rhsgref_ins_rifleman","rhsgref_ins_machinegunner","rhsgref_ins_grenadier","rhsgref_ins_rifleman_RPG26"];
_Men_at			=	["rhsgref_ins_squadleader","rhsgref_ins_grenadier_rpg","rhsgref_ins_grenadier_rpg","rhsgref_ins_grenadier_rpg"];
_Men_aa			=	["rhsgref_ins_squadleader","rhsgref_ins_specialist_aa","rhsgref_ins_specialist_aa","rhsgref_ins_spotter"];
_Men_sentry		=	["rhsgref_ins_rifleman","rhsgref_ins_grenadier"];
_Men_sniperTeam	=	["rhsgref_ins_spotter","rhsgref_ins_sniper"];
_Men_mortarTeam	=	[];

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
_UnarmedVehicles 		= 	["rhsgref_ins_uaz","rhsgref_ins_uaz_open","rhsgref_ins_gaz66","rhsgref_ins_ural","rhsgref_ins_ural_open","rhsgref_BRDM2UM_ins"];
_ArmedVehicles_Light 	= 	["rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_spg9","rhsgref_ins_uaz_ags","rhsgref_BRDM2_ins"];
_ArmedVehicles_Medium 	=	["rhsgref_ins_btr60","rhsgref_ins_btr70"];
_ArmedVehicles_Heavy 	=	["rhsgref_ins_bmd1","rhsgref_ins_bmd1p","rhsgref_ins_bmd2","rhsgref_ins_bmp1","rhsgref_ins_bmp2"];

// air vehicles
_RW_Transport = 	["rhsgref_ins_Mi8amt"];
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
_Motorized = [	_Moto_section,
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

STB_Infantry = STB_Infantry + [[_Infantry, east]];
					
STB_Motorized = STB_Motorized + [[_Motorized, east]];
				
STB_Mechanized = STB_Mechanized + [[_Mechanized, east]];
				
STB_GroundVehicles = STB_GroundVehicles + [[_GroundVehicles, east]];
					
STB_AirVehicles = STB_AirVehicles + [[_AirVehicles, east]];
				
STB_StaticWeapons = STB_StaticWeapons + [[_StaticWeapons, east]];

if(STB_DebugEnabled) then {
	systemchat format ["STB_Debug (%1) - Loaded Definitions - New Faction # %2", time, ( (count STB_Infantry) - 1)];
};
/*
Change the side to the side you want the custom faction to be on, options are:-
	east
	west
	resistance
	civilian
*/
