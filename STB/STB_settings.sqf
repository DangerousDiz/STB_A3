/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
								USER SETTINGS 
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

// General Settings
  
	//STB_DebugEnabled = true; // STB debug mode
	// UNCOMMENT FOR THIS OPTION TO APPEAR IN SERVER PARAMS
	// (must also be changed in description.ext)
	/*
	Add to bottom of description.ext - Note classname changes
	// Params	
		class Params
		{
			class STB_DebugEnabled
			{
				title = "STB Debug Enabled?"; 
				values[] = {0,1}; 
				texts[] = {"False","True"}; 
				default = 0; 
			};
			class STB_EnableExtensions
			{
				title = "STB Extensions Enabled"; 
				values[] = {0,1}; 
				texts[] = {"False","True"}; 
				default = 1; 
			};	
			
		};
	*/
	//Check if STB_DebugEnabled is set in description.ext
	if(typeName (missionNamespace getVariable ["STB_DebugEnabled",false]) == "SCALAR") then {
		//Convert the params to Boolean - Allows multiple params array entries and reordering without losing the STB values
		STB_DebugEnabled = if (STB_DebugEnabled == 0) then {false} else {true};
		//systemchat format["Debug -> %1 - Extensions -> %2 ",STB_DebugEnabled,STB_EnableExtensions];
	}else{
		STB_DebugEnabled = false;
		systemChat format["[STB - Error @ %1]: Missing Params for STB_DebugEnabled - Default values set."];
	};
	//Check if STB_EnableExtensions is set in description.ext
	if(typeName (missionNamespace getVariable ["STB_EnableExtensions",false]) == "SCALAR") then {
		STB_EnableExtensions = if (STB_EnableExtensions == 0) then {false} else {true};
	}else{
		STB_EnableExtensions = false;
		systemChat format["[STB - Error @ %1]: Missing Params for STB_EnableExtensions - Default values set."];
	};
	//STB_DebugEnabled = true; // STB debug mode Overide, uncomment to set Debug Mode on regardless of mission parameters
	STB_MaxAI = 300; // maximum AI - if ai count is beyond this number, no more units will spawn from the spawn scripts
	STB_NoAI = false; // only set to true if you do not intend on using AI spawning functions (e.g. for TvT) - saves some memory
	
	// Overide to cancel group marking for cTab use
	STB_cancelGroupMkrs = true;
	// spawned ai will have these skills
	STB_AISkillArray = [	["spotdistance", 	0.8],
							["aimingaccuracy", 	0.2],
							["aimingshake", 	0.2],
							["aimingspeed", 	0.6],
							["endurance", 		0.5],
							["spottime", 		0.6],
							["courage", 		0.9],
							["reloadSpeed", 	0.6],
							["commanding", 		1],
							["general", 		1]
						];
						
// Respawn
	
	// Choose how respawns are affected by this framework
	// STB_Respawn_Mode (number, 0-3) where:
	// 0: Do not handle respawns 
	// 1: Handle Respawn Internally (Uses internal STB system for handling lives)
	// 2: Handle Respawns using BIS tickets (requires   respawnTemplates[] = {"Tickets"}; in description.ext)
	
	STB_RespawnMode = 1; // see above
	STB_PlayerRespawns = 1; // number of respawns players get (0 means 1 life, no respawns)
	
// Vehicle Servicing
// when stopped inside the triggers defined below, vehicle drivers will have access to a repair/rearm/refuel action
// triggers must be set to activate "repeatedly" on "present"
// if you choose "anybody" as the side in the trigger any side can use the service
// to limit side access, simply specify a side in the trigger
// to diable the feature, leave the array empty (i.e. [])

	STB_VehicleServiceTriggers = []; // IN QUOTES!! list of triggers that will function as service areas
	// e.g. ["serviceTrigger1","serviceTrigger2"]

// ~~~~~~~ Uniform and Gear Presets ~~~~~~~  //

// *** These will only be applied to units with the "STB_Loadouts" variable defined on them in their init ***

// CHECK MOD DEPENDENCIES IN THE PRESET FILE BEFORE USING A PRESET!

// Medical System [unneccessary if not using gear from this framework]

	STB_Medical = "medical_ace_advanced"; // name of medical preset located in loadouts\presets\medical\
	
// Extras  [unneccessary if not using gear from this framework]

	STB_Extras = "extras_ace"; // name of extras preset located in loadouts\presets\extras

// Gear and Uniforms (WEST)

	STB_GearPreset_West = "gear_nato"; // name of west weapons preset (without file extension)
	STB_UniformPreset_West = "none"; // use "none" to keep editor unit's uniform
	STB_GearParams_West = [	false, // silencers for riflemen
							false, // silencers for AR
							false, // silencers for DMR (7.62)
							false, // handgun silencers
							false, // NVGs
							false, // no optics?
							false, // riflemen get light AT?
							false, // IR Strobe Action (virtual IR strobe attached to unit's head via action menu)
							false, // Restrict HE (only 1 frag per person and 2x he rounds for ugls)
							false]; // Remove HE (no frags, no he for ugls) (overrides Restrict HE if true)

// Gear and Uniforms (EAST)

	STB_GearPreset_East = "gear_csat"; // name of east weapons preset (without file extension)
	STB_UniformPreset_East = "none"; // use "none" to keep editor unit's uniform
	STB_GearParams_East = [	false, // silencers for riflemen
							false, // silencers for AR
							false, // silencers for DMR (7.62)
							false, // handgun silencers
							false, // NVGs
							false, // no optics?
							false, // riflemen get light AT?
							false, // IR Strobe Action (virtual IR strobe attached to unit's head via action menu)
							false, // Restrict HE (only 1 frag per person and 2x he rounds for ugls)
							false]; // Remove HE (no frags, no he for ugls) (overrides Restrict HE if true)

// Gear and Uniforms (RESISTANCE)

	STB_GearPreset_Resistance = "gear_aaf"; // name of independant weapons preset (without file extension)
	STB_UniformPreset_Resistance = "none"; // use "none" to keep editor unit's uniform
	STB_GearParams_Resistance = [	false, // silencers for riflemen
									false, // silencers for AR
									false, // silencers for DMR (7.62)
									false, // handgun silencers
									false, // NVGs
									false, // no optics?
									false, // riflemen get light AT?
									false, // IR Strobe Action (virtual IR strobe attached to unit's head via action menu)
									false, // Restrict HE (only 1 frag per person and 2x he rounds for ugls)
									false]; // Remove HE (no frags, no he for ugls) (overrides Restrict HE if true)

/* 	~~~~~~~ TFAR Radio Settings ~~~~~~~~~~~

	Radio encryptions are for BLUFOR, OPFOR, and INDEP respectively.
 	default is ["_bluefor","_opfor","_independant"]
	if you want two sides to be able to hear eachother, give them the same encryption
	e.g. ["_bluefor","_opfor","_bluefor"] if blue and green are sharing comms.
	
	Set STB_useTFAR to false if you do not want the framework to handle TFAR stuff
	or you are not using the TFAR mod.
	
	Use STB_TFAR_Frequencies to set the default frequencies assigned to ch 1-8 of each radio.
*/

	// general settings
	STB_useTFAR = true; 
	STB_TFAR_Encryption = ["_bluefor","_opfor","_independant"];
	// blufor
	STB_TFAR_Frequencies_SR_West = ["31.1","31.2","31.3","32.1","32.2","32.3","31","32"];  
	STB_TFAR_Frequencies_LR_West = ["31","32","33","40","50","60","70","80"]; 	
	// opfor
	STB_TFAR_Frequencies_SR_East = ["31.1","31.2","31.3","32.1","32.2","32.3","31","32"]; 
	STB_TFAR_Frequencies_LR_East = ["31","32","33","40","50","60","70","80"]; 	
	// resistance
	STB_TFAR_Frequencies_SR_Resistance = ["31.1","31.2","31.3","32.1","32.2","32.3","31","32"]; 
	STB_TFAR_Frequencies_LR_Resistance = ["31","32","33","40","50","60","70","80"]; 	

/* 	~~~~~~~ Headless Client Settings ~~~~~~~ 
 
	The framework will check to see if the HC with the name given here is connected to the server.
	It will then define a variable on every connected machine that will flag that machine as an AI
	controller. If the named HC is connected, it will become the AI controller, if it is not, or if
	the STB_useAvailableHC parameter below is set to false, the server will become the AI controller
	
	Once the framework has initialised (when STB_mission_init.sqf is executed) you can use the variable
	STB_isAIController when using spawning scripts to ensure the AI is deployed on the HC if available,
	but will fall back to the server if it is not.
	
	example spawn script: 
	if (STB_isAIController) then {nul = [0,"random","random","random",[10,0],[10,0],[10,0],[5,0],player,750] spawn STB_fnc_AI_populateArea;};
*/

	STB_HC_Name = "STB_HC"; // the name given to the HC you want STB functions to use
	STB_useAvailableHC = true; // if false, the HC will not be used even if detected
	
// EXIT	