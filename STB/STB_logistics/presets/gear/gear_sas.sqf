/*
	LOADOUT PRESET:	British Special Forces (Royal Marines)
	
	Dependancies: CUP / STKR_BI / Massi's NATO SF Weapons Pack
*/

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

/*
	PRIMARY WEAPONS
*/

// Assualt Rifle
_rifle = "CUP_arifle_G36K";
_rifle_mag = "30Rnd_556x45_Stanag";
_rifle_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Light Support Weapon
_rifle_lsw = _rifle;
_rifle_lsw_mag = _rifle_mag;
_rifle_lsw_mag_tr = _rifle_mag_tr;

// Carbine
_carbine = "CUP_arifle_G36C";
_carbine_mag = "30Rnd_556x45_Stanag";
_carbine_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// UGL Rifle
_glrifle = "arifle_mas_fal_m203";
_glrifle_mag = "20Rnd_762x51_Mag";
_glrifle_mag_tr = "20Rnd_762x51_Mag";
_glrifle_he = "1Rnd_HE_Grenade_shell";
_glrifle_smoke_white = "1Rnd_Smoke_Grenade_shell";
_glrifle_smoke_green = "1Rnd_SmokeGreen_Grenade_shell";
_glrifle_smoke_red = "1Rnd_SmokeRed_Grenade_shell";
_glrifle_smoke_purple = "1Rnd_SmokePurple_Grenade_shell";
_glrifle_smoke_blue = "1Rnd_SmokeBlue_Grenade_shell";
_glrifle_flare_white = "UGL_FlareWhite_F";
_glrifle_flare_red = "UGL_FlareRed_F";
_glrifle_flare_yellow = "UGL_FlareYellow_F";
_glrifle_flare_green = "UGL_FlareGreen_F";

// Light MG
_ar = "CUP_arifle_MG36";
_ar_mag = "CUP_100Rnd_556x45_BetaCMag";
_ar_mag_tr = "CUP_100Rnd_556x45_BetaCMag";

// Medium MG
_mmg = "CUP_lmg_L7A2";
_mmg_mag = "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
_mmg_mag_tr = "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";

// Designated Marksman
_dmr = "STKR_L129A1_HG_Bipod";
_dmr_mag = "20Rnd_762x51_Mag";

// Sniper
_snp = "CUP_srifle_AWM_wdl";
_snp_mag = "CUP_5Rnd_86x70_L115A1";

// SMG
_smg = "CUP_smg_MP5A5";
_smg_mag = "CUP_30Rnd_9x19_MP5";
_smg_mag_tr = "CUP_30Rnd_9x19_MP5";

// Diver
_diverweapon = _carbine;
_diverweapon_mag = _carbine_mag;

/*
	SECONDARY WEAPONS
*/

// Sidearm
_pistol = "CUP_hgun_Glock17";
_pistol_mag = "CUP_17Rnd_9x19_glock17";

// Light AT
_lat = "CUP_launch_M136";
_lat_mag = "CUP_M136_M";

// Medium AT
_mat = "launch_NLAW_F";
_mat_mag = "NLAW_F";

// Heavy AT
_hat = "CUP_launch_Javelin";
_hat_mag = "CUP_Javelin_M";

// MANPADS
_sam = "launch_B_Titan_F";
_sam_mag = "Titan_AA";

/*
	ATTACHMENTS
*/

// primary weapon attachments
_irPointer = "acc_pointer_IR";	// IR Laser
_flashlight = "acc_flashlight";	// Flashlight

// select silencers appropriate to the caliber of your chosen weapon set
_rifleSilencer = "CUP_muzzle_snds_G36_black"; // for the m16/m4 pack
_silencerAR = "CUP_muzzle_snds_G36_black";	// m249 silencer
_silencerMMG = "muzzle_snds_B";
_silencerDMR = "muzzle_snds_B";	// dmr silencer
_handgunSilencer = "muzzle_snds_acp"; // .45 ACP

// select optics
_scope_r = "CUP_optic_CompM2_Black";  // rifleman optic
_scope_mg = "CUP_optic_ElcanM145"; // MG gunner optic
_scope_tl = "optic_mas_Arco_blk"; // section/team leader optic
_scope_sf = "CUP_optic_TrijiconRx01_black"; // special forces optic (short range)
_scope_lr = "CUP_optic_Leupold_VX3"; // long-range optic (snipers)
_scope_dmr = "CUP_optic_SB_11_4x20_PM"; // mid-long range optic (marksmen)
_scope_co = "optic_mas_Arco_blk"; // commander's optics

// array of extra optics that will be added to backpack to give players a choice
_spareOptics = ["CUP_optic_HoloBlack","Optic_aco"];

// handgun
_hg_scope = "optic_MRD";			// MRD

/*
	ITEMS - THROW/PUT
*/

// Frag grenades
_grenade = "HandGrenade";
_grenade_mini = "MiniGrenade";

// Smoke grenades
_smokegrenade_white = "SmokeShell";
_smokegrenade_red = "SmokeShellRed";
_smokegrenade_blue = "SmokeShellBlue";
_smokegrenade_green = "SmokeShellGreen";
_smokegrenade_yellow = "SmokeShellYellow";

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Explosives
_mine_AT = "ATMine_Range_Mag";
_satchel = "DemoCharge_Remote_Mag";
_mine_AP_1 = "APERSBoundingMine_Range_Mag";
_mine_AP_2 = "APERSMine_Range_Mag";
_democharge = "DemoCharge_Remote_Mag";

/*
	ITEMS - CARRIED/WORN
*/

// Night Vision Goggles (NVGoggles)
_nvg = "NVGoggles";

// UAV Terminal
_uavterminal = "B_UavTerminal";

/*
	BACKPACKS
*/

// Backpacks
_bag_small = "B_AssaultPack_mcamo";					// carries 120, weighs 20
_bag_medium = "B_FieldPack_khk";				// carries 240, weighs 30
_bag_large =  "B_Carryall_mcamo"; 					// carries 320, weighs 40
_bag_diver =  "B_AssaultPack_blk";		// used by divers
_bag_uav = "B_UAV_01_backpack_F";				// used by UAV operator
_bag_hmg_G = "B_HMG_01_weapon_F";					// used by Heavy MG gunner
_bag_hmg_AG = "B_HMG_01_support_F";				// used by Heavy MG assistant gunner
_bag_hat_G = "B_AT_01_weapon_F";				// used by Heavy AT gunner
_bag_hat_AG = "B_HMG_01_support_F";				// used by Heavy AT assistant gunner
_bag_mtr_G = "B_Mortar_01_weapon_F";			// used by Mortar gunner
_bag_mtr_AG = "B_Mortar_01_support_F";			// used by Mortar assistant gunner
_bag_hsam_G = "B_AA_01_weapon_F";				// used by Heavy SAM gunner
_bag_hsam_AG = "B_HMG_01_support_F";			// used by Heavy SAM assistant gunner
_bag_AT = _bag_large;                	// Used by AT Riflemen
_bag_medic = _bag_medium;					// Used by medic
_bag_eng = _bag_large;					// Used by engineer
_bag_exp = _bag_large;					// Used by explosives specialist
_bag_ar = _bag_medium;				// Used by AR



// DO NOT EDIT PAST HERE //

// return array
_return = [	_rifle,_rifle_mag,_rifle_mag_tr,
			_rifle_lsw,_rifle_lsw_mag,_rifle_lsw_mag_tr,
			_carbine,_carbine_mag,_carbine_mag_tr,
			_glrifle,_glrifle_mag,_glrifle_mag_tr,
			_glrifle_he,_glrifle_smoke_white,_glrifle_smoke_red,_glrifle_smoke_green,_glrifle_smoke_purple,_glrifle_smoke_blue,
			_glrifle_flare_red,_glrifle_flare_white,_glrifle_flare_yellow,_glrifle_flare_green,
			_ar,_ar_mag,_ar_mag_tr,_mmg,_mmg_mag,_mmg_mag_tr,
			_dmr,_dmr_mag,_snp,_snp_mag,
			_smg,_smg_mag,_smg_mag_tr,
			_diverweapon,_diverweapon_mag,
			_pistol,_pistol_mag,
			_lat,_lat_mag,_mat,_mat_mag,_hat,_hat_mag,_sam,_sam_mag,
			_irPointer,_flashlight,
			_rifleSilencer,_silencerAR,_silencerDMR,_silencerMMG,_handgunSilencer,
			_scope_co,_scope_sf,_scope_r,_scope_mg,_scope_tl,_scope_dmr,_scope_lr,_spareOptics,_hg_scope,
			_grenade,_grenade_mini,_smokegrenade_white,_smokegrenade_red,_smokegrenade_blue,_smokegrenade_green,_smokegrenade_yellow,
			_chemgreen,_chemred,_chemyellow,_chemblue,
			_mine_AT,_satchel,_mine_AP_1,_mine_AP_2,_democharge,
			_nvg,_uavterminal,
			_bag_small,_bag_medium,_bag_large,_bag_diver,_bag_uav,_bag_hmg_G,_bag_hmg_AG,_bag_hat_G,_bag_hat_AG,
			_bag_mtr_G,_bag_mtr_AG,_bag_hsam_G,_bag_hsam_AG,_bag_AT,_bag_medic,_bag_eng,_bag_exp,_bag_ar]; 
_return;