/*
	Loadouts for NATO troops
*/

// get info on unit
_unit = _this select 0;
_type = _this select 1;
_side = _this select 2;

/*
List of Loadouts

//		coy			- company commander
//		co			- troop commander
//		dc 			- deputy commander / 2IC
//		sl			- section leader
//		fac			- forward air controller
//		m 			- medic
//		ftl			- fire team leader
//		ar 			- automatic rifleman
//		aar			- assistant automatic rifleman
//		mmgg		- medium mg gunner
//		mmgag		- medium mg assistant
//		matg		- medium AT gunner
//		matag		- medium AT assistant
//		hmgg		- heavy mg gunner (deployable)
//		hmgag		- heavy mg assistant (deployable)
//		hatg		- heavy AT gunner (deployable)
//		hatag		- heavy AT assistant (deployable)
//		mtrg		- mortar gunner (deployable)
//		mtrag		- mortar assistant (deployable)
//		msamg		- medium SAM gunner
//		msamag		- medium SAM assistant gunner
//		hsamg		- heavy SAM gunner (deployable)
//		hsamag		- heavy SAM assistant gunner (deployable)
//		sn			- sniper
//		sp			- spotter (for sniper)
//		vc			- vehicle commander
//		vg			- vehicle gunner
//		vd			- vehicle driver (repair)
//		pp			- air vehicle pilot / co-pilot
//		pcc			- air vehicle co-pilot (repair) / crew chief (repair)
//		pc			- air vehicle crew
//		eng			- engineer (demo)
//		engm		- engineer (mines)
//		uav			- UAV operator
//		div    		- divers
*/

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							LOAD GEAR PRESET
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
if (!local _unit) exitWith {};

// get correct gear for side   
_gearPreset = switch (_side) do {
	case west: {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_West + ".sqf")};
	case east: {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_East + ".sqf")};
	case resistance: {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_Resistance + ".sqf")};	
	default {call compile preprocessFile ("STB\STB_logistics\presets\gear\" + STB_GearPreset_West + ".sqf")};
};
			
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

// set gear parameters
_gear_params = switch (_side) do {
	case west: {STB_GearParams_West};
	case east: {STB_GearParams_East};
	case resistance: {STB_GearParams_Resistance};
	default {STB_GearParams_West};
};

// assign params
_stb_param_silencers_riflemen = _gear_params select 0; 	
_stb_param_silencers_ar	= _gear_params select 1; 		
_stb_param_silencers_762 = _gear_params select 2; 		
_stb_param_silencers_hg	= _gear_params select 3;		
_stb_param_nvg = _gear_params select 4;	
_stb_param_noOptics = _gear_params select 5;	
_stb_param_riflemanAT = _gear_params select 6;
_stb_param_restrictHE = _gear_params select 8;
_stb_param_removeHE = _gear_params select 9;
_spareOptics = if (_stb_param_noOptics) then {[]} else {_spareOptics};			

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							LOAD UNIFORM PRESET
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

_uniformVariable = switch (_side) do {
	case west: {STB_UniformPreset_West};
	case east: {STB_UniformPreset_East};
	case resistance: {STB_UniformPreset_Resistance};
	default {STB_UniformPreset_West};
};
   
// privatise uniform variables
private ["_baseUniform","_baseHelmet","_baseGlasses",
		"_lightRig", "_mediumRig", "_heavyRig",
		"_diverUniform","_diverHelmet","_diverRig","_diverGlasses",
		"_pilotUniform","_pilotHelmet","_pilotRig","_pilotGlasses",
		"_crewUniform","_crewHelmet","_crewRig","_crewGlasses",
		"_ghillieUniform","_ghillieHelmet","_ghillieRig","_ghillieGlasses",
		"_sfUniform","_sfHelmet","_sfRig","_sfGlasses",
		"_coyUniform","_coyHelmet","_coyRig","_coyGlasses"];
		
// make array of uniform variable names
_uniformVarNames = ["_baseUniform","_baseHelmet","_baseGlasses",
					"_lightRig", "_mediumRig", "_heavyRig",
					"_diverUniform","_diverHelmet","_diverRig","_diverGlasses",
					"_pilotUniform","_pilotHelmet","_pilotRig","_pilotGlasses",
					"_crewUniform","_crewHelmet","_crewRig","_crewGlasses",
					"_ghillieUniform","_ghillieHelmet","_ghillieRig","_ghillieGlasses",
					"_sfUniform","_sfHelmet","_sfRig","_sfGlasses",
					"_coyUniform","_coyHelmet","_coyRig","_coyGlasses"];
		
// Declare uniform variables
_baseUniform = "";_baseHelmet = "";_baseGlasses = "";
_lightRig = ""; _mediumRig = ""; _heavyRig = "";
_diverUniform = "";_diverHelmet = "";_diverRig = "";_diverGlasses = "";
_pilotUniform = "";_pilotHelmet = "";_pilotRig = "";_pilotGlasses = "";
_crewUniform = "";_crewHelmet = "";_crewRig = "";_crewGlasses = "";
_ghillieUniform = "";_ghillieHelmet = "";_ghillieRig = "";_ghillieGlasses = "";
_sfUniform = "";_sfHelmet = "";_sfRig = "";_sfGlasses = "";
_coyUniform = "";_coyHelmet = "";_coyRig = "";_coyGlasses = "";

// ignore uniforms if preset is set to "none"
if (_uniformVariable != "none") then {

	// load uniform preset
	_uniformPreset = call compile preprocessFile ("STB\STB_logistics\presets\uniforms\" + _uniformVariable + ".sqf"); 
			
	// assign uniform variables from preset
	for [{_i=0},{_i<count _uniformPreset},{_i=_i+1}] do {	
		if (typeName (_uniformPreset select _i) == "string") then {
			call compile format ["%1 = ""%2""", _uniformVarNames select _i, _uniformPreset select _i];
		} else {
			call compile format ["%1 = %2",_uniformVarNames select _i, _uniformPreset select _i];
		};
	};
	
};	

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							LOAD MEDICAL PRESET
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
if (isNil "STB_BasicMeds" or isNil "STB_AdvancedMeds") then {call compile preProcessFile ("STB\STB_logistics\presets\medical\" + STB_Medical + ".sqf");};  

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								RADIOS
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// get correct radio set for side
_radioArray = switch (side _unit) do {
	case west: {["tf_rt1523g_big","tf_rt1523g","tf_anprc152","tf_rf7800str"]};
	case east: {["tf_mr3000_multicam","tf_mr3000","tf_fadak","tf_pnr1000a"]};
	case resistance: {["tf_anprc155_coyote","tf_anprc155","tf_anprc148jem","tf_anprc154"]};
	default {["tf_rt1523g_big","tf_rt1523g","tf_anprc152","tf_rf7800str"]};
};

// Radios
_radio_lr_co = _radioArray select 0;	// commander's radio (long range)
_radio_lr = _radioArray select 1;	  		// section leader's radio (long-range)
_radio_mr = _radioArray select 2;			// rifleman's radio (medium range)
_radio_sr = _radioArray select 3;  		// personal radio (short range)

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							FUNCTIONS FOR BACKPACKS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

_frag = if (_stb_param_restrictHE) then {1} else {3};
_he = if (_stb_param_restrictHE) then {2} else {10};

// we will always put these in backpacks
_general_items = if (_stb_param_removeHE) then {
					[	[_smokegrenade_white, 2],
						[_smokegrenade_red, 1],
						[_smokegrenade_green, 1],
						[_chemgreen,1],
						[_chemblue,1]
					];
				} else {
					[	[_grenade, _frag],
						[_smokegrenade_white, 2],
						[_smokegrenade_red, 1],
						[_smokegrenade_green, 1],
						[_chemgreen,1],
						[_chemblue,1]
					];
				};

// we will alwyas put these in backpacks for UGL-equipped units
_gl_items =	if (_stb_param_removeHE) then {
				[	[_glrifle_smoke_red, 2],
					[_glrifle_smoke_green, 2],
					[_glrifle_smoke_white, 4]
				];
			} else {
				[	[_glrifle_he, _he],
					[_glrifle_smoke_red, 2],
					[_glrifle_smoke_green, 2],
					[_glrifle_smoke_white, 4]
				];			
			};

// function for filling a backpack
_fnc_backpack = {

	// params
	_unit = _this select 0; // the unit
	_type = _this select 1; // unit's class
	_bag = _this select 2; // backpack classname
	
	// add bag
	_unit addBackpack _bag;
	
	// remove all stuff from backpack
	clearMagazineCargoGlobal (unitBackpack _unit);
	
	// add general items to backpack
	{
		for [{_i=0},{_i<(_x select 1)},{_i=_i+1}] do {_unit addItem (_x select 0)};
	} forEach _general_items;
	
	// add optics to backpack
	{_unit addItemToBackpack _x} forEach _spareOptics;	
	
	// define types that receive unique packs
	_bp_r = ["r","lsw"];
	_bp_ar = ["ar","aar"];
	_bp_ugl = ["co","dc","fac","sl","ftl","gren"];
	_bp_mmg = ["mmgg","mmgag"];
	_bp_mat = ["matg","matag"];
	_bp_hat = ["hatg","hatag"];
	_bp_sam = ["msamg","msamag"];
	_bp_diver = ["div"];
	_bp_dmr = ["dmr"];
	_bp_m = ["m"];
	_bp_car = ["coy","car"];
	_bp_lg = ["lg"];
	_bp_fac = ["fac"];
	_bp_vd = ["vd"];
	_bp_eng = ["eng"];
	_bp_engm = ["engm"];
	
	// assign unique items to these types
	if (_type in _bp_r) then {	
		if (_stb_param_riflemanAT) then {(unitBackpack _unit) addMagazineCargoGlobal [_lat_mag,1]};
		(unitBackpack _unit) addMagazineCargoGlobal [_rifle_mag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_rifle_mag_tr, 2];
	};	
	if (_type in _bp_ar) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_ar_mag, 2];		
	};
	if (_type in _bp_ugl) then {
		{(unitBackpack _unit) addMagazineCargoGlobal _x} forEach _gl_items;
		(unitBackpack _unit) addMagazineCargoGlobal [_glrifle_mag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_glrifle_mag_tr, 2];
	};
	if (_type in _bp_mmg) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_mmg_mag_tr, 3];
		_unit addItemToVest _mmg_mag_tr;
	};
	if (_type in _bp_mat) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_mat_mag, 3];
	};
	if (_type in _bp_hat) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_hat_mag, 1];
	};
	if (_type in _bp_sam) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_sam_mag, 3];
	};
	if (_type in _bp_diver) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_diverweapon_mag, 4];
	};
	if (_type in _bp_dmr) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_dmr_mag, 10];
	};
	if (_type in _bp_m) then {
		{(unitBackpack _unit) addItemCargoGlobal _x} forEach STB_AdvancedMeds;
	};
	if (_type in _bp_car) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_carbine_mag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbine_mag_tr, 2];
	};
	if (_type in _bp_lg) then {
		(unitBackpack _unit) addMagazineCargoGlobal [_snp_mag, 10];
	};	
	if (_type in _bp_fac) then {
		{(unitBackpack _unit) addMagazineCargoGlobal _x} forEach _gl_items;
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade_red,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_glrifle_smoke_white, 1];	
	};
	if (_type in _bp_vd) then {	
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
	};
	if (_type in _bp_eng) then {
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_satchel,1];
		(unitBackpack _unit) addItemCargoGlobal [_democharge,2];
	};
	if (_type in _bp_engm) then {	
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_satchel,1];
		(unitBackpack _unit) addItemCargoGlobal [_democharge,2];
		(unitBackpack _unit) addItemCargoGlobal [_mine_AP_1,1];
		(unitBackpack _unit) addItemCargoGlobal [_mine_AP_2,1];
	};
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

							ASSIGN LOADOUTS

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// remove gear
removeAllItems _unit;
removeAllWeapons _unit;

// define _nvgs
_nvg = switch (side _unit) do {
	case west: {"NVGoggles"};
	case east: {"NVGoggles_OPFOR"};
	case resistance: {"NVGoggles_INDEP"};
	default {"NVGoggles"};
};

// remove NVGs
if(_nvg in (assignedItems _unit)) then {
	_unit unassignItem _nvg;
	_unit removeItem _nvg;
};

// reassign nvgs if selected
if (_stb_param_nvg) then {_unit linkItem _nvg;};

// remove backpack
removeBackpack _unit;

// assign radios
if(_type != "NIL") then {

    // Set the list of units that get a rifleman's radio
    _rifradio = ["ar","aar","samag","mmgag","hmgag","matag","hatag","mtrag","sp","r","car","smg","gren"];

    // Set the list of units that get a long-range radio
    _mediumrange = ["coy","co", "dc", "ftl", "m", "samg", "mmgg", "matg", "sn", "mtrg","sl","fac"];

    // Give out respective radios
    if (_type in _rifradio) then {
        _unit linkItem _radio_sr;
    } else {
        if (_type in _mediumrange) then {
          _unit linkItem _radio_mr;
        };
	};
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						Assign Uniforms 
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// ignore uniforms if preset is set to "none"
if (_uniformVariable != "none") then {   
   
	player setVariable ["BIS_enableRandomization", false]; // Allows for the over-riding of default BIS Random Selection

	// Which classes get special uniforms?
	_unitlight = [];
	_unitMedium = [];
	_unitHeavy = ["eng","engm"];
	_unitDiver = ["div"];
	_unitPilot = ["pp","pcc","pc"];
	_unitCrew = ["vc","vg","vd"];
	_unitGhillie = ["sn","sp"];
	_unitCoy = ["coy","co"];
	_unitSF = [];

	// Remove uniforms, headgear, and vests
	removeUniform _unit;
	removeHeadgear _unit;
	removeVest _unit;

	// Define Standard Clothing Items
	_uniform = _baseUniform;
	_helmet = _baseHelmet;
	_rig = _mediumRig;
	_glasses = _baseGlasses;

	// Redefine Values for

	// Light
	if (_type in _unitlight) then {
		_rig = _lightRig;
	};

	// Heavy
	if (_type in _unitheavy) then {
		_rig = _heavyRig;
	};

	// Pilot
	if (_type in _unitpilot) then {
		_helmet = _pilotHelmet;
		_uniform = _pilotUniform;
		_rig = _pilotRig;
		_glasses = _pilotGlasses
	};

	// Crew
	if (_type in _unitcrew) then {
		_helmet = _crewHelmet;
		_uniform = _crewUniform;
		_rig = _crewRig;
		_glasses = _crewGlasses;
	};

	// Diver
	if (_type in _unitdiver) then {
		_helmet = _diverHelmet;
		_uniform = _diverUniform;
		_rig = _diverRig;
		_glasses = _diverGlasses;
	};

	// Ghillie
	if (_type in _unitghillie) then {
		_helmet = _ghillieHelmet;
		_uniform = _ghillieUniform;
		_rig = _ghillieRig;
		_glasses = _ghillieGlasses;
	};

	// Spec Op
	if (_type in _unitSF) then {
		_helmet = _sfHelmet;
		_uniform = _sfUniform;
		_rig = _sfRig;
		_glasses = _sfGlasses;
	};
	
	// Coy Cmd
	if (_type in _unitCoy) then {
		_helmet = _coyHelmet;
		_uniform = _coyUniform;
		_rig = _coyRig;
		_glasses = _coyGlasses;
	};

	// Add clothing items to unit
	if(count _uniform > 0) then {
		_unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
	};

	if(count _helmet > 0) then {
		_unit addHeadgear (_helmet call BIS_fnc_selectRandom);
	};

	if(count _rig > 0) then {
		_unit addVest (_rig call BIS_fnc_selectRandom);
	};

	if(count _glasses > 0) then {
		_unit addGoggles (_glasses call BIS_fnc_selectRandom);
	};

};
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
					Begin Assigning Gear to Units
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
   
// assign basic meds
{
	for [{_i=0},{_i<(_x select 1)},{_i=_i+1}] do {
		_unit addItem (_x select 0);
	};
} forEach STB_BasicMeds;

// assign general extras
{ _unit addItem _x } forEach STB_extras_general;

// define number of rifleman mags
_mags = 6;
_mags_tr = 4;

// assign new gear
switch (_type) do {

	// LOADOUT: COMPANY COMMANDER
		case "coy":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];			
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			_unit addmagazines [_smokegrenade_green,2];
			_unit addWeapon "Rangefinder";
			_unit linkItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_co};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};
			if (_stb_param_silencers_hg) then {_unit addHandgunItem  _handgunSilencer} else {};

			[_unit,_type,_radio_lr_co] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","coy",true];
		};		
	
	// LOADOUT: TROOP COMMANDER
		case "co":
		{
			_unit addmagazines [_glrifle_mag,_mags];
			_unit addMagazines [_glrifle_mag_tr,_mags_tr];
			_unit addweapon _glrifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			_unit linkItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_co};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};
			if (_stb_param_silencers_hg) then {_unit addHandgunItem  _handgunSilencer} else {};

			[_unit,_type,_radio_lr_co] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","co",true];
		};

	// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER
		case "dc":
		{
			_unit addmagazines [_glrifle_mag,_mags];
			_unit addMagazines [_glrifle_mag_tr,_mags_tr];
			_unit addweapon _glrifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			_unit linkItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_co};
			if (_stb_param_silencers_riflemen) then {_unit addPrimaryWeaponItem _rifleSilencer} else {};
			if (_stb_param_silencers_hg) then {_unit addHandgunItem  _handgunSilencer} else {};

			[_unit,_type,_radio_lr_co] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","dc",true];
		};
		
	// LOADOUT: FAC
		case "fac":
		{
			_unit addmagazines [_glrifle_mag,_mags];
			_unit addMagazines [_glrifle_mag_tr,_mags_tr];
			_unit addweapon _glrifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_yellow,2];
			_unit addmagazines [_smokegrenade_blue,2];
			_unit addWeapon "LaserDesignator";
			_unit addItem "Laserbatteries";
			_unit linkItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_co};
			if (_stb_param_silencers_riflemen) then {_unit addPrimaryWeaponItem _rifleSilencer} else {};
			if (_stb_param_silencers_hg) then {_unit addHandgunItem  _handgunSilencer} else {};

			[_unit,_type,_radio_lr_co] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","fac",true];
		};

	// LOADOUT: MEDIC
		case "m":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_smokegrenade_white,2];
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","m",true];
		};

	// LOADOUT: SECTION LEADER
		case "sl":
		{
			_unit addmagazines [_glrifle_mag,8];
			_unit addMagazines [_carbine_mag_tr,4];
			_unit addweapon _glrifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;			
			_unit addWeapon "Rangefinder";
			_unit linkItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_tl};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_radio_lr_co] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","sl",true];
		};

	// LOADOUT: FIRE TEAM LEADER
		case "ftl":
		{
			_unit addmagazines [_glrifle_mag,_mags];
			_unit addMagazines [_glrifle_mag_tr,_mags_tr];
			_unit addweapon _glrifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			_unit linkItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_tl};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};
			
			[_unit,_type,_bag_small] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","ftl",true];
		};

	// LOADOUT: AUTOMATIC RIFLEMAN
		case "ar":
		{
			[_unit,_type,_bag_ar] call _fnc_backpack;

			_unit addweapon _ar;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_ar_mag_tr,2];
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_mg};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _silencerAR} else {};
			
			{_unit addItem _x} forEach STB_extras_ar;
			
			_unit setVariable ["STB_Loadout","ar",true];
		};

	// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
		case "aar":
		{
			_unit addmagazines [_rifle_mag,_mags];
			_unit addMagazines [_rifle_mag_tr,_mags_tr];
			_unit addweapon _rifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Binocular";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_ar] call _fnc_backpack;
			
			{_unit addItem _x} forEach STB_extras_ar;
			
			_unit setVariable ["STB_Loadout","aar",true];
		};

	// LOADOUT: DESIGNATED MARKSMAN
		case "dmr":
		{
			_unit addmagazines [_dmr_mag,8];
			_unit addweapon _dmr;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "RANGEFINDER";
			
			_unit addPrimaryWeaponItem _scope_dmr;
			if (_stb_param_silencers_762) then { _unit addPrimaryWeaponItem _silencerDMR} else {};

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","dmr",true];
		};
		
	// LOADOUT: Long Gunner
		case "lg":
		{
			_unit addmagazines [_snp_mag,10];
			_unit addweapon _snp;
			_unit addmagazines [_pistol_mag,4];
			_unit addweapon _pistol;
			_unit addWeapon "RANGEFINDER";
			
			_unit addPrimaryWeaponItem _scope_lr;

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			{_unit addItem _x} forEach STB_extras_sniper;
		};
		
	// LOADOUT: MEDIUM MG GUNNER
		case "mmgg":
		{
			_unit addmagazines [_mmg_mag_tr,1];
			_unit addweapon _mmg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_mg};			

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			{_unit addItem _x} forEach STB_extras_ar;
			
			_unit setVariable ["STB_Loadout","mmgg",true];
		};

	// LOADOUT: MEDIUM MG ASSISTANT GUNNER
		case "mmgag":
		{
			_unit addmagazines [_rifle_mag,_mags];
			_unit addMagazines [_rifle_mag_tr,_mags_tr];
			_unit addweapon _rifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			{_unit addItem _x} forEach STB_extras_ar;
			
			_unit setVariable ["STB_Loadout","mmgag",true];
		};

	// LOADOUT: HEAVY MG GUNNER
		case "hmgg":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_mg};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			_unit addBackpack _bag_hmg_G;
			
			_unit setVariable ["STB_Loadout","hmgg",true];
		};

	// LOADOUT: HEAVY MG ASSISTANT GUNNER
		case "hmgag":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			_unit addBackpack _bag_hmg_AG;
			
			_unit setVariable ["STB_Loadout","hmgag",true];
		};

	// LOADOUT: MEDIUM AT GUNNER
		case "matg":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_large] call _fnc_backpack;
			
			_unit addweapon _mat;
			
			_unit setVariable ["STB_Loadout","matg",true];
		};

	// LOADOUT: MEDIUM AT ASSISTANT GUNNER
		case "matag":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_large] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","matag",true];
		};

	// LOADOUT: HEAVY AT GUNNER
		case "hatg":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon _hat;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","hatg",true];

		};

	// LOADOUT: HEAVY AT ASSISTANT GUNNER
		case "hatag":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","hatag",true];
		};

	// LOADOUT: MORTAR GUNNER
		case "mtrg":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			_unit addBackpack _bag_mtr_G;
			
			_unit setVariable ["STB_Loadout","mtrg",true];
		};

	// LOADOUT: MORTAR ASSISTANT GUNNER
		case "mtrag":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			_unit addBackpack _bag_mtr_AG;
			
			_unit setVariable ["STB_Loadout","mtrag",true];
		};

	// LOADOUT: MEDIUM SAM GUNNER
		case "msamg":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addweapon _sam;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_large] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","msamg",true];
		};

	// LOADOUT: MEDIUM SAM ASSISTANT GUNNER
		case "msamag":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_large] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","msamag",true];
		};

	// LOADOUT: HEAVY SAM GUNNER
		case "hsamg":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			_unit addBackpack _bag_hsam_G;
			
			_unit setVariable ["STB_Loadout","hsamg",true];
		};

	// LOADOUT: HEAVY SAM ASSISTANT GUNNER
		case "hsamag":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addWeapon "Rangefinder";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			_unit addBackpack _bag_hsam_AG;
			
			_unit setVariable ["STB_Loadout","hsamag",true];
		};

	// LOADOUT: SNIPER
		case "sn":
		{
			_unit addmagazines [_snp_mag,10];
			_unit addweapon _snp;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			
			_unit addPrimaryWeaponItem _scope_lr;

			if (_stb_param_silencers_hg) then { _unit addHandgunItem  _handgunSilencer} else {};
			
			{_unit addItem _x} forEach STB_extras_sniper;
			
			_unit setVariable ["STB_Loadout","sn",true];
		};

	// LOADOUT: SPOTTER
		case "sp":
		{
			_unit addmagazines [_rifle_mag,_mags];
			_unit addMagazines [_rifle_mag_tr,_mags_tr];
			_unit addweapon _rifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			_unit addmagazines [_smokegrenade_red,2];
			_unit addmagazines [_smokegrenade_green,2];
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			_unit addWeapon "Rangefinder";
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};
			
			{_unit addItem _x} forEach STB_extras_sniper;
			
			_unit setVariable ["STB_Loadout","sp",true];
		};

	// LOADOUT: VEHICLE COMMANDER
		case "vc":
		{
			_unit addmagazines [_smg_mag,8];
			_unit addweapon _smg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			_unit addItem "ItemGPS";
			_unit assignItem "ItemGPS";
			_unit addWeapon "Rangefinder";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_sf};
			
			_unit setVariable ["STB_Loadout","vc",true];
		};

	// LOADOUT: VEHICLE DRIVER
		case "vd":
		{
			_unit addmagazines [_smg_mag,8];
			_unit addweapon _smg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			_unit addItem "ItemGPS";
			_unit assignItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_sf};

			[_unit,_type,_bag_small] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","vd",true];
		};

	// LOADOUT: VEHICLE GUNNER
		case "vg":
		{
			_unit addmagazines [_smg_mag,8];
			_unit addweapon _smg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			_unit addItem "ItemGPS";
			_unit assignItem "ItemGPS";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_sf};
			
			_unit setVariable ["STB_Loadout","vg",true];
		};

	// LOADOUT: AIR VEHICLE PILOTS
		case "pp":
		{
			_unit addmagazines [_smg_mag,8];
			_unit addweapon _smg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			_unit addItem "ItemGPS";
			_unit assignItem "ItemGPS";
			
			{_unit addItem _x} forEach STB_extras_pilot;
			
			_unit setVariable ["STB_Loadout","pp",true];
		};

	// LOADOUT: AIR VEHICLE CREW CHIEF
		case "pcc":
		{
			_unit addmagazines [_smg_mag,8];
			_unit addweapon _smg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];

			[_unit,_type,_bag_small] call _fnc_backpack;
			
			{_unit addItem _x} forEach STB_extras_sniper;
			
			_unit setVariable ["STB_Loadout","pcc",true];
		};

	// LOADOUT: AIR VEHICLE CREW
		case "pc":
		{
			_unit addmagazines [_smg_mag,8];
			_unit addweapon _smg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,2];
			
			{_unit addItem _x} forEach STB_extras_sniper;
			
			_unit setVariable ["STB_Loadout","pc",true];
		};

	// LOADOUT: ENGINEER (DEMO)
		case "eng":
		{
			_unit addmagazines [_carbine_mag,8];
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addItem "MineDetector";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_mg};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_eng] call _fnc_backpack;
			
			{_unit addItem _x} forEach STB_extras_demo;
			
			_unit setVariable ["STB_Loadout","eng",true];
		};

	// LOADOUT: ENGINEER (MINES)
		case "engm":
		{
			_unit addmagazines [_carbine_mag,8];
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_mine_AP_2,1];
			_unit addItem "MineDetector";
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_mg};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_eng] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","engm",true];
		};

	// LOADOUT: UAV OPERATOR
		case "uav":
		{
			_unit addmagazines [_rifle_mag,8];
			_unit addweapon _rifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit linkItem _uavterminal;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};

			_unit addBackpack _bag_uav;
			
			_unit setVariable ["STB_Loadout","uav",true];
		};

	// LOADOUT: Diver
		case "div":
		{
			_unit addmagazines [_diverweapon_mag,8];
			_unit addweapon _diverweapon;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,3];
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_sf};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_diver] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","div",true];
		};

	// LOADOUT: RIFLEMAN
		case "r":
		{
			_unit addmagazines [_rifle_mag,_mags];
			_unit addMagazines [_rifle_mag_tr,_mags_tr];
			_unit addweapon _rifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_small] call _fnc_backpack;
			
			if (_stb_param_riflemanAT) then {_unit addWeapon _lat};
			
			_unit setVariable ["STB_Loadout","r",true];
		};

		
	// LOADOUT: RIFLEMAN
		case "lsw":
		{
			_unit addmagazines [_rifle_lsw_mag,6];
			_unit addmagazines [_rifle_lsw_mag_tr,3];
			_unit addweapon _rifle_lsw;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_small] call _fnc_backpack;
			
			if (_stb_param_riflemanAT) then {_unit addWeapon _lat};	
			
			_unit setVariable ["STB_Loadout","lsw",true];
		};
		
		
	// LOADOUT: CARABINEER
		case "car":
		{
			_unit addmagazines [_carbine_mag,_mags];
			_unit addmagazines [_carbine_mag_tr,_mags_tr];	
			_unit addweapon _carbine;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_small] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","car",true];
		};

	// LOADOUT: SUBMACHINEGUNNER
		case "smg":
		{
			_unit addmagazines [_smg_mag,9];
			_unit addweapon _smg;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			_unit addmagazines [_smokegrenade_white,3];
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_sf};
			
			_unit setVariable ["STB_Loadout","smg",true];
		};

	// LOADOUT: GRENADIER
		case "gren":
		{
			_unit addmagazines [_glrifle_mag,_mags];
			_unit addMagazines [_glrifle_mag_tr,_mags_tr];
			_unit addweapon _glrifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_medium] call _fnc_backpack;
			
			_unit setVariable ["STB_Loadout","gren",true];
		};

		default
		{
			_unit addmagazines [_rifle_mag,_mags];
			_unit addMagazines [_rifle_mag_tr,_mags_tr];
			_unit addweapon _rifle;
			_unit addmagazines [_pistol_mag,2];
			_unit addweapon _pistol;
			
			if (!_stb_param_noOptics) then {_unit addPrimaryWeaponItem _scope_r};
			if (_stb_param_silencers_riflemen) then { _unit addPrimaryWeaponItem _rifleSilencer} else {};

			[_unit,_type,_bag_small] call _fnc_backpack;
			
			if (_stb_param_riflemanAT) then {_unit addWeapon _lat};
			
			_unit setVariable ["STB_Loadout","r",true];
		};

}; // end of switch statement

// switch to primary weapon and lower it
_unit selectweapon primaryweapon _unit;
_unit setCombatMode "safe";