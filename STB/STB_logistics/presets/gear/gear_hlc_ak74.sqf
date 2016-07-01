/*
	LOADOUT PRESET:	HLC AK weapons (based around AK74 - 5.56mm)
	
	Dependancies: HLC CORE / HLC AK
*/

/*
	PRIMARY WEAPONS
*/

// Assualt Rifle
_rifle = "hlc_rifle_ak74";
_rifle_mag = "hlc_30Rnd_545x39_B_AK";
_rifle_mag_tr = "hlc_30Rnd_545x39_T_AK";

// Light Support Weapon
_rifle_lsw = _rifle;
_rifle_lsw_mag = _rifle_mag;
_rifle_lsw_mag_tr = _rifle_mag_tr;

// Carbine
_carbine = "hlc_rifle_aks74u";
_carbine_mag = "hlc_30Rnd_545x39_B_AK";
_carbine_mag_tr = "hlc_30Rnd_545x39_T_AK";

// UGL Rifle
_glrifle = "hlc_rifle_akmgl";
_glrifle_mag = "hlc_30Rnd_762x39_b_ak";
_glrifle_mag_tr = "hlc_30Rnd_762x39_t_ak";
_glrifle_he = "hlc_VOG25_AK";
_glrifle_smoke_white = "hlc_GRD_White";
_glrifle_smoke_green = "hlc_GRD_green";
_glrifle_smoke_red = "hlc_GRD_red";
_glrifle_smoke_purple = "hlc_GRD_purple";
_glrifle_smoke_blue = "hlc_GRD_blue";
_glrifle_flare_white = "";
_glrifle_flare_red = "";
_glrifle_flare_yellow = "";
_glrifle_flare_green = "";

// Light MG
_ar = "hlc_rifle_rpk";
_ar_mag = "hlc_75rnd_762x39_m_rpk";
_ar_mag_tr = "hlc_45Rnd_762x39_t_rpk";

// Medium MG
_mmg = "LMG_Zafir_F";
_mmg_mag = "150Rnd_762x54_Box";
_mmg_mag_tr = "150Rnd_762x54_Box_Tracer";

// Designated Marksman
_dmr = "srifle_DMR_01_F";
_dmr_mag = "10Rnd_762x54_Mag";

// Sniper
_snp = "srifle_GM6_F";
_snp_mag = "5Rnd_127x108_Mag";

// SMG
_smg = "hlc_rifle_aks74u";
_smg_mag = "hlc_30Rnd_545x39_B_AK";
_smg_mag_tr = "hlc_30Rnd_545x39_T_AK";

// Diver
_diverweapon = _carbine;
_diverweapon_mag = _carbine_mag;

/*
	SECONDARY WEAPONS
*/

// Sidearm
_pistol = "hgun_ACPC2_F";
_pistol_mag = "9Rnd_45ACP_Mag";

// Light AT
_lat = "launch_NLAW_F";
_lat_mag = "NLAW_F";

// Medium AT
_mat = "launch_NLAW_F";
_mat_mag = "NLAW_F";

// Heavy AT
_hat = "launch_B_Titan_short_F";
_hat_mag = "Titan_AT";

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
_rifleSilencer = "hlc_muzzle_762SUP_AK";  
_silencerAR = "";	
_silencerMMG = "muzzle_snds_B";
_silencerDMR = "muzzle_snds_B";	// dmr silencer
_handgunSilencer = "muzzle_snds_acp"; // .45 ACP

// select optics
_scope_r = "";  // rifleman optic
_scope_mg = ""; // MG gunner optic
_scope_tl = "hlc_optic_kobra"; // section/team leader optic
_scope_sf = ""; // special forces optic (short range)
_scope_lr = "optic_SOS"; // long-range optic (snipers)
_scope_dmr = "optic_hamr"; // mid-long range optic (marksmen)
_scope_co = "hlc_optic_kobra"; // commander's optics

// array of extra optics that will be added to backpack to give players a choice
_spareOptics = [""];

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

