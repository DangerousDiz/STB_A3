/*
	LOADOUT PRESET:	British Armed Forces (Royal Marines)
	
	Dependancies: CUP / STKR_BI / RKSL
*/

/*
	PRIMARY WEAPONS
*/

// Assualt Rifle
_rifle = "UK3CB_BAF_L85A2_EMAG";
_rifle_mag = "UK3CB_BAF_30Rnd";
_rifle_mag_tr = "UK3CB_BAF_30Rnd_T";

// Light Support Weapon
_rifle_lsw = "UK3CB_BAF_L86A3";
_rifle_lsw_mag = _rifle_mag;
_rifle_lsw_mag_tr = _rifle_mag_tr;

// Carbine
_carbine = "UK3CB_BAF_L85A2_EMAG";
_carbine_mag = "UK3CB_BAF_30Rnd";
_carbine_mag_tr = "UK3CB_BAF_30Rnd_T";

// UGL Rifle
_glrifle = "UK3CB_BAF_L85A2_UGL_HWS";
_glrifle_mag = "UK3CB_BAF_30Rnd";
_glrifle_mag_tr = "UK3CB_BAF_30Rnd_T";
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
_ar = "UK3CB_BAF_L110A2";
_ar_mag = "UK3CB_BAF_200Rnd";
_ar_mag_tr = "UK3CB_BAF_200Rnd_T";

// Medium MG
_mmg = "UK3CB_BAF_L7A2";
_mmg_mag = "UK3CB_BAF_75Rnd";
_mmg_mag_tr = "UK3CB_BAF_75Rnd_T";

// Designated Marksman
_dmr = "UK3CB_BAF_L129A1";
_dmr_mag = "UK3CB_BAF_20Rnd";

// Sniper
_snp = "UK3CB_BAF_L115A3";
_snp_mag = "UK3CB_BAF_L115A3_Mag";

// SMG
_smg = "UK3CB_BAF_L91A1";
_smg_mag = "UK3CB_BAF_30Rnd_9mm";
_smg_mag_tr = "UK3CB_BAF_30Rnd_9mm";

// Diver
_diverweapon = _carbine;
_diverweapon_mag = _carbine_mag;

/*
	SECONDARY WEAPONS
*/

// Sidearm
_pistol = "UK3CB_BAF_L131A1";
_pistol_mag = "UK3CB_BAF_30Rnd_T";

// Light AT
_lat = "AT4 HP Launcher";
_lat_mag = "UK3CB_BAF_30Rnd_T";

// Medium AT
_mat = "NLAW Launcher";
_mat_mag = "UK3CB_BAF_75Rnd_T";

// Heavy AT
_hat = "Javelin Launcher";
_hat_mag = "UK3CB_BAF_200Rnd_T";

// MANPADS
_sam = "ILAW CS HEDP Launcher";
_sam_mag = "UK3CB_BAF_200Rnd_T";

/*
	ATTACHMENTS
*/

// primary weapon attachments
_irPointer = "acc_pointer_IR";	// IR Laser
_flashlight = "acc_flashlight";	// Flashlight

// select silencers appropriate to the caliber of your chosen weapon set
_rifleSilencer = "CUP_muzzle_snds_L85"; // for the m16/m4 pack
_silencerAR = "muzzle_snds_H_MG";	// m249 silencer
_silencerMMG = "muzzle_snds_B";
_silencerDMR = "muzzle_snds_B";	// dmr silencer
_handgunSilencer = "muzzle_snds_acp"; // .45 ACP

// select optics
_scope_r = "UK3CB_BAF_SpecterLDS_Dot";  // rifleman optic
_scope_mg = "UK3CB_BAF_SUSAT"; // MG gunner optic
_scope_tl = "UK3CB_BAF_TA31F"; // section/team leader optic
_scope_sf = "UK3CB_BAF_LLM_IR"; // special forces optic (short range)
_scope_lr = "UK3CB_BAF_SB31250"; // long-range optic (snipers)
_scope_dmr = "UK3CB_BAF_TA648_308"; // mid-long range optic (marksmen)
_scope_co = "UK3CB_BAF_TA648"; // commander's optics

// array of extra optics that will be added to backpack to give players a choice
_spareOptics = ["UK3CB_BAF_Eotech"];

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
_mine_AP_1 = "SLAMDirectionalMine_Wire_Mag";
_mine_AP_2 = "ClaymoreDirectionalMine_Remote_Mag";
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
_bag_small = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_A";					// carries 120, weighs 20
_bag_medium = "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A";				// carries 240, weighs 30
_bag_large =  "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C"; 					// carries 320, weighs 40
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
_bag_medic = "UK3CB_BAF_B_Bergen_MTP_Medic_H_A";					// Used by medic
_bag_eng = "UK3CB_BAF_B_Bergen_MTP_Engineer_H_A";					// Used by engineer
_bag_exp = "UK3CB_BAF_B_Bergen_MTP_Engineer_H_A";					// Used by explosives specialist
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