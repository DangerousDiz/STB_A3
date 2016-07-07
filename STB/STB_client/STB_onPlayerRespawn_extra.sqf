/*
	STB_onPlayerRespawn_extra
	
	Use this script to place things into the respawn event handler without touching the core code
	housed in that event handler. This is for mission specific things in missions that require respawns
	It simply gets called at the end of STB_onPlayerRespawn.sqf
	
	For example, you might want a particular action added to all players for a specific mission.
	Actions do not carry through respawn, so you would have to add them again here.
	
	_this is the player unit who is respawning
*/
execVM "Scripts\3cb\medicalFix.sqf";
execVM "Scripts\3cb\Ctab.sqf";
