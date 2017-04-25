/*
	STB_onPlayerRespawn_extra
	
	Use this script to place things into the respawn event handler without touching the core code
	housed in that event handler. This is for mission specific things in missions that require respawns
	It simply gets called at the end of STB_onPlayerRespawn.sqf
	
	For example, you might want a particular action added to all players for a specific mission.
	Actions do not carry through respawn, so you would have to add them again here.
	
	_this is the player unit who is respawning
*/

UN_w1_commander addAction [
		"<t color=""#B2ED5A"">" + "Confirm area secure", // text
		{UN_ref_send = true; publicvariable "UN_ref_send";}, // script
		[], // params
		10, // priority
		true, // showWindow
		true, // hideOnUse
		"",
		"player in ['UK3CB_BAF_FAC_MTP_RM', 'UK3CB_BAF_RO_MTP_RM', 'UK3CB_BAF_FAC_MTP_RM_H', 'UK3CB_BAF_RO_MTP_RM_H', 'UK3CB_BAF_Officer_MTP_RM', 'UK3CB_BAF_Officer_MTP_RM_H'] && w1_done" // params
	
		
		
	];