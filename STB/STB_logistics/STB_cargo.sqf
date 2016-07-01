/*
	VEHICLE CARGO SCRIPTS
	
	Set a variable on an empty vehicle's init line:
		this setVariable ["STB_Cargo",["type","side"]];
	
	List of Types

		"car"
		"truck"
		"ifv"
		"tank"
		"crate_small"
		"crate_med"
		"crate_large"
		
	List of sides
	
		"west"
		"east"
		"resistance"		
*/

// get info on unit
_unit = _this select 0;
_type = _this select 1;
_side = _this select 2;

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							LOAD GEAR PRESET
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 

// get correct gear for side   
_gearPreset = switch (toLower _side) do {
	case "west": {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_West + ".sqf")};
	case "east": {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_East + ".sqf")};
	case "resistance": {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_Resistance + ".sqf")};	
	default {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_West + ".sqf")};
};

// exit if bad side specification
if (count _gearPreset == 0) exitWith {};
			
// privatize gear variables
private [	"_rifle","_rifle_mag","_rifle_mag_tr",
			"_rifle_lsw","_rifle_lsw_mag","_rifle_lsw_mag_tr",
			"_carbine","_carbine_mag","_carbine_mag_tr",
			"_glrifle","_glrifle_mag","_glrifle_mag_tr",
			"_glrifle_he","_glrifle_smoke_white","_glrifle_smoke_red","_glrifle_smoke_green","_glrifle_smoke_purple","_glrifle_smoke_blue",
			"_glrifle_flare_red","_glrifle_flare_white","_glrifle_flare_yellow","_glrifle_flare_green",
			"_ar","_ar_mag","_ar_mag_tr","_mmg","_mmg_mag","_mmg_mag_tr",
			"_dmr","_dmr_mag","_snp","_snp_mag",
			"_smg","_smg_mag","_smg_mag_tr",
			"_diverweapon","_diverweapon_mag",
			"_pistol","_pistol_mag",
			"_lat","_lat_mag","_mat","_mat_mag","_hat","_hat_mag","_sam","_sam_mag",
			"_irPointer","_flashlight",
			"_rifleSilencer","_silencerAR","_silencerDMR","_silencerMMG","_handgunSilencer",
			"_scope_co","_scope_sf","_scope_r","_scope_mg","_scope_tl","_scope_dmr","_scope_lr","_spareOptics","_hg_scope",
			"_grenade","_grenade_mini","_smokegrenade_white","_smokegrenade_red","_smokegrenade_blue","_smokegrenade_green","_smokegrenade_yellow",
			"_chemgreen","_chemred","_chemyellow","_chemblue",
			"_mine_AT","_satchel","_mine_AP_1","_mine_AP_2","_democharge",
			"_nvg","_uavterminal",
			"_bag_small","_bag_medium","_bag_large","_bag_diver","_bag_uav","_bag_hmg_G","_bag_hmg_AG","_bag_hat_G","_bag_hat_AG",
			"_bag_mtr_G","_bag_mtr_AG","_bag_hsam_G","_bag_hsam_AG","_bag_AT","_bag_medic","_bag_eng","_bag_exp","_bag_ar"
			]; 
			
// declare gear variables		
_rifle = "";_rifle_mag = "";_rifle_mag_tr = "";
_rifle_lsw = "";_rifle_lsw_mag = "";_rifle_lsw_mag = "";
_carbine = "";_carbine_mag = "";_carbine_mag_tr = "";
_glrifle = "";_glrifle_mag = "";_glrifle_mag_tr = "";
_glrifle_he = "";_glrifle_smoke_white = "";_glrifle_smoke_red = "";_glrifle_smoke_green = "";_glrifle_smoke_purple = "",_glrifle_smoke_blue = "";
_glrifle_flare_red = "";_glrifle_flare_white = "";_glrifle_flare_yellow = "";_glrifle_flare_green = "";
_ar = "";_ar_mag = "";_ar_mag_tr = "";
_mmg = "";_mmg_mag = "";_mmg_mag_tr = "";
_dmr = "";_dmr_mag = "";_snp = "";_snp_mag = "";
_smg = "";_smg_mag = "";_smg_mag_tr = "";
_diverweapon = "";_diverweapon_mag = "";
_pistol = "";_pistol_mag = "";
_lat = "";_lat_mag = "";_mat = "";_mat_mag = "";_hat = "";_hat_mag = "";_sam = "";_sam_mag = "";
_irPointer = "";_flashlight = "";
_rifleSilencer = "";_silencerAR = "";_silencerDMR = "";_silencerMMG = "";_handgunSilencer = "";
_scope_co = "";_scope_sf = "";_scope_r = "";_scope_mg = "";_scope_tl = "";_scope_dmr = "";_scope_lr = "";_spareOptics = [];_hg_scope = "";
_grenade = "";_grenade_mini = "";_smokegrenade_white = "";_smokegrenade_red = "";_smokegrenade_blue = "";_smokegrenade_green = "";_smokegrenade_yellow = "";
_chemgreen = "";_chemred = "";_chemyellow = "";_chemblue = "";
_mine_AT = "";_satchel = "";_mine_AP_1 = "";_mine_AP_2 = "";_democharge = "";
_nvg = "";_uavterminal = "";
_bag_small = "";_bag_medium = "";_bag_large = "";_bag_diver = "";_bag_uav = "";_bag_hmg_G = "";_bag_hmg_AG = "";_bag_hat_G = "";_bag_hat_AG = "";
_bag_mtr_G = "";_bag_mtr_AG = "";_bag_hsam_G = "";_bag_hsam_AG = "";_bag_AT = "";_bag_medic = "";_bag_eng = "";_bag_exp = "";_bag_ar = "";

// make array of gear variable names
_gearVarNames = [	"_rifle","_rifle_mag","_rifle_mag_tr",
			"_rifle_lsw","_rifle_lsw_mag","_rifle_lsw_mag_tr",
			"_carbine","_carbine_mag","_carbine_mag_tr",
			"_glrifle","_glrifle_mag","_glrifle_mag_tr",
			"_glrifle_he","_glrifle_smoke_white","_glrifle_smoke_red","_glrifle_smoke_green","_glrifle_smoke_purple","_glrifle_smoke_blue",
			"_glrifle_flare_red","_glrifle_flare_white","_glrifle_flare_yellow","_glrifle_flare_green",
			"_ar","_ar_mag","_ar_mag_tr","_mmg","_mmg_mag","_mmg_mag_tr",
			"_dmr","_dmr_mag","_snp","_snp_mag",
			"_smg","_smg_mag","_smg_mag_tr",
			"_diverweapon","_diverweapon_mag",
			"_pistol","_pistol_mag",
			"_lat","_lat_mag","_mat","_mat_mag","_hat","_hat_mag","_sam","_sam_mag",
			"_irPointer","_flashlight",
			"_rifleSilencer","_silencerAR","_silencerDMR","_silencerMMG","_handgunSilencer",
			"_scope_co","_scope_sf","_scope_r","_scope_mg","_scope_tl","_scope_dmr","_scope_lr","_spareOptics","_hg_scope",
			"_grenade","_grenade_mini","_smokegrenade_white","_smokegrenade_red","_smokegrenade_blue","_smokegrenade_green","_smokegrenade_yellow",
			"_chemgreen","_chemred","_chemyellow","_chemblue",
			"_mine_AT","_satchel","_mine_AP_1","_mine_AP_2","_democharge",
			"_nvg","_uavterminal",
			"_bag_small","_bag_medium","_bag_large","_bag_diver","_bag_uav","_bag_hmg_G","_bag_hmg_AG","_bag_hat_G","_bag_hat_AG",
			"_bag_mtr_G","_bag_mtr_AG","_bag_hsam_G","_bag_hsam_AG","_bag_AT","_bag_medic","_bag_eng","_bag_exp","_bag_ar"
			]; 			

// assign gear variables from preset
for [{_i=0},{_i<count _gearPreset},{_i=_i+1}] do {	
	if (typeName (_gearPreset select _i) == "string") then {
		call compile format ["%1 = ""%2""", _gearVarNames select _i, _gearPreset select _i];
	} else {
		call compile format ["%1 = %2",_gearVarNames select _i, _gearPreset select _i];
	};
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								ASSIGN CARGO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

switch (_type) do {

	// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "car":	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_rifle_mag, 8];
		_unit addMagazineCargoGlobal [_glrifle_mag, 8];
		_unit addMagazineCargoGlobal [_carbine_mag, 10];
		_unit addMagazineCargoGlobal [_ar_mag, 5];
		_unit addMagazineCargoGlobal [_lat_mag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 4];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 2];
		_unit addMagazineCargoGlobal [_glrifle_he, 4];
		_unit addMagazineCargoGlobal [_glrifle_smoke_white, 4];
	};

	// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "truck": {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 10];
		_unit addMagazineCargoGlobal [_rifle_mag, 40];
		_unit addMagazineCargoGlobal [_glrifle_mag, 40];
		_unit addMagazineCargoGlobal [_carbine_mag, 40];
		_unit addMagazineCargoGlobal [_ar_mag, 22];
		_unit addMagazineCargoGlobal [_lat_mag, 6];
		_unit addMagazineCargoGlobal [_grenade, 12];
		_unit addmagazineCargoGlobal [_grenade_mini,12];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 12];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 4];
		_unit addMagazineCargoGlobal [_glrifle_he, 12];
		_unit addMagazineCargoGlobal [_glrifle_smoke_white, 12];
	};

	// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "ifv": {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_rifle_mag, 20];
		_unit addMagazineCargoGlobal [_glrifle_mag, 20];
		_unit addMagazineCargoGlobal [_carbine_mag, 20];
		_unit addMagazineCargoGlobal [_ar_mag, 8];
		_unit addMagazineCargoGlobal [_lat_mag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addmagazineCargoGlobal [_grenade_mini,8];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 8];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 2];
		_unit addMagazineCargoGlobal [_glrifle_he, 8];
		_unit addMagazineCargoGlobal [_glrifle_smoke_white, 4];
	};

	// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "tank": {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_smg, 4];
		_unit addMagazineCargoGlobal [_smg_mag, 20];
		_unit addMagazineCargoGlobal [_smg_mag_tr, 20];
		_unit addMagazineCargoGlobal [_lat_mag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addmagazineCargoGlobal [_grenade_mini,8];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 8];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 2];
		_unit addMagazineCargoGlobal [_glrifle_he, 8];
		_unit addMagazineCargoGlobal [_glrifle_smoke_white, 4];
	};
	
	// CARGO: Transport Helo - room for 10 weapons and 100 cargo items
	case "helo":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_rifle_mag, 20];
		_unit addMagazineCargoGlobal [_glrifle_mag, 20];
		_unit addMagazineCargoGlobal [_carbine_mag, 20];
		_unit addMagazineCargoGlobal [_ar_mag, 8];
		_unit addMagazineCargoGlobal [_mmg_mag, 12];
		_unit addMagazineCargoGlobal [_lat_mag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 4];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 4];
		_unit addMagazineCargoGlobal [_glrifle_he, 8];
	};

	// CRATE: Small, ammo for 1 fireteam
	case "crate_small": {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_rifle_mag, 5];
		_unit addMagazineCargoGlobal [_glrifle_mag, 5];
		_unit addMagazineCargoGlobal [_ar_mag, 5];
		_unit addMagazineCargoGlobal [_carbine_mag, 5];
		_unit addMagazineCargoGlobal [_glrifle_he, 5];
		_unit addMagazineCargoGlobal [_glrifle_smoke_white, 4];
		_unit addMagazineCargoGlobal [_lat_mag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addMagazineCargoGlobal [_grenade_mini, 8];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 8];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 2];
		_unit additemcargoGlobal ["optic_Holosight",25];
		_unit additemcargoGlobal ["optic_MRCO",25];
	};

	// CRATE: Medium, ammo for 1 squad
	case "crate_med":	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_rifle_mag, 15];
		_unit addMagazineCargoGlobal [_glrifle_mag, 20];
		_unit addMagazineCargoGlobal [_ar_mag, 15];
		_unit addMagazineCargoGlobal [_carbine_mag, 20];
		_unit addMagazineCargoGlobal [_glrifle_he, 20];
		_unit addMagazineCargoGlobal [_glrifle_smoke_white,16];
		_unit addMagazineCargoGlobal [_lat_mag, 6];
		_unit addMagazineCargoGlobal [_grenade, 25];
		_unit addMagazineCargoGlobal [_grenade_mini, 25];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 25];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 6];
		_unit additemcargoGlobal ["optic_Holosight",25];
		_unit additemcargoGlobal ["optic_MRCO",25];
	};

	// CRATE: Large, ammo for 1 platoon
	case "crate_large": {
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_rifle_mag, 45];
		_unit addMagazineCargoGlobal [_glrifle_mag, 60];
		_unit addMagazineCargoGlobal [_ar_mag, 45];
		_unit addMagazineCargoGlobal [_carbine_mag, 60];
		_unit addMagazineCargoGlobal [_glrifle_he, 60];
		_unit addMagazineCargoGlobal [_glrifle_smoke_white,50];
		_unit addMagazineCargoGlobal [_lat_mag, 20];
		_unit addMagazineCargoGlobal [_grenade, 75];
		_unit addMagazineCargoGlobal [_grenade_mini, 75];
		_unit addMagazineCargoGlobal [_smokegrenade_red, 75];
		_unit addMagazineCargoGlobal [_smokegrenade_green, 20];
		_unit additemcargoGlobal ["optic_Holosight",25];
		_unit additemcargoGlobal ["optic_MRCO",25];
	};
	
	default {systemChat format ["STB_Debug (%1) - Error in STB_Cargo.sqf: Bad Vehicle Cargo Class Given",time]};

};

// Add meds
{_unit addItemCargoGlobal _x} forEach STB_CargoMeds;

