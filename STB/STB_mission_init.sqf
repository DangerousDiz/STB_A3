/*

	USE THIS SCRIPT TO RUN MISSION SPECIFIC THINGS
			(equivalent to init.sqf)

	PLACE MISSION CODE ACCORDING TO THE DESIRED LOCALITY

*/

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
					MISSION SPECIFIC CODE
				
					*** LOCALITY NOTES ***
	Anything BEFORE the first if statement or inside the if (true) code block runs on all clients
	Anything INSIDE the first (isServer) code block runs always on the server
	Anything inside the (STB_isAIController) code block runs on the HC if avalable
	but reverts to the server if the HC cannot be found.	

	This script behaves just like the regular init.sqf:
	It runs on every connected machine at mission start, only now
	you have access to all the functions and variables in the STB framework
	
	Here is where you would add AI spawning code as well as other mission-specific
	things that you would normally have used init.sqf for.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/*
	The "Do Stuff" bit
*/

if (true) then {
	if (isNil "MISSION_START") then {MISSION_START = false;};
	if (isNil "SEND_W1") then {SEND_W1 = false;};
	if (isNil "SEND_W2") then {SEND_W2 = false;};
	if (isNil "UN_ref_send") then {UN_ref_send = false;};
	if (isNil "w1_done") then {w1_done = false;};
	if (isNil "w2_done") then {w2_done = false;};
	if (isNil "UN_comms_send") then {UN_comms_send = false;};
	if (isNil "UN_intel_added") then {UN_intel_added = false;};
	if (isNil "UN_warcrime_intel_added") then {UN_warcrime_intel_added = false;};
	STB_OPF = 11;
	STB_BLU = 6;
	STB_IND = 10;
	STB_DebugSleep = 60;
	
};

if (hasInterface) then {

	// CODE TO BE EXECUTED ON ONLY CLIENT MACHINES (NOT SERVER/HC)
	// e.g. briefing, hint messages, addactions
	[] spawn {
		waitUntil{!isNull player};
		waitUntil{player == player};
		waitUntil {!isNull player};
		//Removes adverse effects of killing civilians
		player addRating 99999;
		/*
			Client side loops and actions / events
		*/
		//Fire on screen info scripts to all players (script only run on Officers, Radio Operators and FACs).
		execVM "Scripts\infoText.sqf";
		execVM "Scripts\UN_comms.sqf";
		execVM "Scripts\UN_intel_added.sqf";
		execVM "Scripts\UN_warcrime_intel_added.sqf";
		
	};
	if(typeof player in ['UK3CB_BAF_FAC_MTP_RM', 'UK3CB_BAF_RO_MTP_RM', 'UK3CB_BAF_FAC_MTP_RM_H', 'UK3CB_BAF_RO_MTP_RM_H', 'UK3CB_BAF_Officer_MTP_RM', 'UK3CB_BAF_Officer_MTP_RM_H']) then {
		//Add the confirmation action to the UN commander for all the above classnames
		UN_w1_commander addAction [
			"<t color=""#B2ED5A"">" + "Confirm area secure", // text
			{UN_ref_send = true; publicvariable "UN_ref_send";}, // script
			[], // params
			10, // priority
			true, // showWindow
			true, // hideOnUse
			"",
			"typeof player in ['UK3CB_BAF_FAC_MTP_RM', 'UK3CB_BAF_RO_MTP_RM', 'UK3CB_BAF_FAC_MTP_RM_H', 'UK3CB_BAF_RO_MTP_RM_H', 'UK3CB_BAF_Officer_MTP_RM', 'UK3CB_BAF_Officer_MTP_RM_H'] && w1_done && !UN_ref_send" // params
		
			
			
		];
	};

};

if (isServer) then {

	// CODE TO BE EXECUTED ON THE SERVER
	// e.g. triggers for monitoring mission objectives and progress	
	//Clean Up...
	[
		15*60, // seconds to delete dead bodies (0 means don't delete) 
		10*60, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		15*60, // seconds to delete dropped weapons (0 means don't delete)
		0, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'Scripts\repCleanUp.sqf';	
	//Force Skill settings on editor units.
	[] spawn {
		{
			_unit = _x;
			{
				if(!(side _unit == west)) then {_unit setSkill _x};
			} forEach STB_AISkillArray;
		} forEach (allUnits);
	};
	/* //No Helicopters
	{
		[_x] call STB_server_addSlingloadParaDrop_EH;
	
	}forEach [LH1,LH2,LH3,LH4,LH5,LH6];
	*/
	STB_server_addPreventFatalDamage_EH = {
		if(isServer) then {
			_veh = (_this select 0);
			_excludedParts = if ((count _this) > 1) then {(_this select 1)} else {["wheel_1_1_steering","wheel_1_2_steering","wheel_1_3_steering","wheel_1_4_steering","wheel_2_1_steering","wheel_2_2_steering","wheel_2_3_steering","wheel_2_4_steering"]};
			[_veh, ["HandleDamage", {
					if(!((_this select 2) in _excludedParts )) then { 
								if((_this select 2) > 0.8) then {0.89} else {_this select 2}
					} else {_this select 2}
				}
			]] remoteExec ["addEventHandler",0,true];
		};
		
	};
	//Prevent the UN covered truck from getting completely destroyed
	[UN_Truck] call STB_server_addPreventFatalDamage_EH;
	
	//wait for BLUFOR to arrive at checkpoint
	[] spawn{
		waitUntil {triggerActivated w1_trig};
		UN_intel_added = true;
		publicVariable "UN_intel_added";
	
	};
	//
	[] spawn {
		//Arrange medic in medical station
		medic_1 setDir 315;
		[medic_1,"BRIEFING_POINT_TABLE","ASIS",ObjNull,true] remoteExec ["BIS_fnc_ambientAnim",0,true];
		//When player enters HQ
		waitUntil {triggerActivated UN_w1_commander_trig};
		//Arrange UN commander in HQ
		UN_w1_commander allowDamage false;
		UN_w1_commander setDir 300;
		[UN_w1_commander,"BRIEFING_POINT_TABLE","ASIS",ObjNull,true] remoteExec ["BIS_fnc_ambientAnim",0,true];
	};
	//Intel files
    //Defend the checkpoint
		//File setup
	OPFOR_intel setVariable ["RscAttributeDiaryRecord_texture","Images\3CB_CheckpointIntel_CO.paa", true];
    [OPFOR_intel,"RscAttributeDiaryRecord",["Hostile Forces","To enable UN support to be deployed by helicopter to this checkpoint at the marked HLS, <br/>hostile forces in the area are to be neutralised.<br/><br/>Hostile forces have various patrols in the area along with static HMGs and sniper towers.<br/><br/>Making sure the area is secure for those support forces to land safely is the top priority.",""]] call bis_fnc_setServerVariable;
    OPFOR_intel setVariable ["recipients", west, true];
		//Intel display
	[
    OPFOR_intel, 
    "intelObjectFound", 
    {
		[] spawn {
			"obj_1_mkr" setMarkerAlpha 1;
			"UN_HLS_mkr" setMarkerAlpha 1;
			
			waitUntil {UN_comms_send};
			"obj_1_mkr" setMarkerAlpha 0.2;
			"UN_HLS_mkr" setMarkerAlpha 0.5;
			
		};
	}
	] call BIS_fnc_addScriptedEventHandler;
	
	//Minefields
		//File setup
	Mines_intel setVariable ["RscAttributeDiaryRecord_texture","Images\3CB_MinefiedIntel_CO.paa", true];
    [Mines_intel,"RscAttributeDiaryRecord",["Minefields on North Road","A number of small mine fields have been located along the North road, instruct your engineer detachment to proceed with clearing them as soon as UN support forces arrive.<br/><br/>Three of the mine fields have been located by our teams, they placed signage at each and marked the tac map for the areas affected but more are certainly present further North on the road.",""]] call bis_fnc_setServerVariable;
    Mines_intel setVariable ["recipients", west, true];
		//Intel display
	[
    Mines_intel, 
    "intelObjectFound", 
    {
		"mf_mkr_1" setMarkerAlpha 1;
		"mf_mkr_2" setMarkerAlpha 1;
		"mf_mkr_3" setMarkerAlpha 1;
		//Hidden markers for the out Red Line minefields
		/*
		"mf_mkr_4" setMarkerAlpha 0.5;
		"mf_mkr_5" setMarkerAlpha 0.5;
		"mf_mkr_6" setMarkerAlpha 0.5;
		"mf_mkr_7" setMarkerAlpha 0.5;
		"mf_mkr_8" setMarkerAlpha 0.5;
		*/
	}
	] call BIS_fnc_addScriptedEventHandler;
	
	//Warcrime
		//File setup
	Warcrime_intel setVariable ["RscAttributeDiaryRecord_texture","Images\3CB_WarcrimeIntel_CO.paa", true];
    [Warcrime_intel,"RscAttributeDiaryRecord",["Warcrime investigation","Following reports that the hostile take over of the area has been swift and brutal, claims have arisen of civilian prisoners being rounded up and herded to various locations. <br/><br/>It is unclear as to what the intent is for these prisoners but we have recieved intel that one such location is at a Coltan processing station NE of Checkpoint 3. <br/><br/>After the UN support forces have arrived push your forces to the station and investigate. <br/><br/>If you find any civilians at all, use the covered truck outside the HQ here to recover them to the FOB",""]] call bis_fnc_setServerVariable;
    Warcrime_intel setVariable ["recipients", west, true];
		//Intel display
	[
	Warcrime_intel, 
    "intelObjectFound", 
    {
		[] spawn {
			"w2_mkr" setMarkerAlpha 1;
			"w2_mkr_2" setMarkerAlpha 1;
		};
	}
	] call BIS_fnc_addScriptedEventHandler;
	
	//Intel delivery
	[] spawn {
		//Initial tasking intel
		waitUntil {UN_intel_added};
		OPFOR_intel hideObjectGlobal false;
		Mines_intel hideObjectGlobal false;
		//Additional tasking intel
		waitUntil {UN_warcrime_intel_added};
		Warcrime_intel hideObjectGlobal false;
	};
};

if (STB_isAIController) then {
	
	// CODE TO BE EXECUTED ON THE AI CONTROLLER
	// The AI controller is defined as the HC IF IT IS PRESENT
	// or the SERVER IF THE HC IS NOT PRESENT
	// e.g. AI spawn scripts
	/*
		AI Spawn:
	*/
	//Obj 1
	//Define marker arrays
	_garSec = ["gar", 4] call STB_fnc_ancillary_defineMarkers;
	_patSec = ["pat", 5] call STB_fnc_ancillary_defineMarkers;
	_w1_sad = ["w1_sad", 5] call STB_fnc_ancillary_defineMarkers;
	_w1_veh = ["w1_veh", 3] call STB_fnc_ancillary_defineMarkers;
	
	_w2_gar = ["w2_gar", 3] call STB_fnc_ancillary_defineMarkers;
	_w2_pat = ["w2_pat", 3] call STB_fnc_ancillary_defineMarkers;
	_w2_sad = ["w2_sad", 3] call STB_fnc_ancillary_defineMarkers;
	_w2_veh = ["w2_veh", 2] call STB_fnc_ancillary_defineMarkers;
	
	_UN_garSec = ["UN_gar", 1] call STB_fnc_ancillary_defineMarkers;
	
	//Initial OPFOR
	[STB_OPF,"infantry","fireteam",_garSec,100,"garrison",[100,true]] spawn STB_fnc_AI_spawnAI;
	[STB_OPF,"infantry","weapons",_patSec,100,"patrol",["self",300]] spawn STB_fnc_AI_spawnAI;
	[STB_OPF,"infantry","fireteam",_w2_gar,100,"garrison",[200,true]] spawn STB_fnc_AI_spawnAI;
	[STB_OPF,"infantry","weapons",_w2_pat,100,"patrol",["self",200]] spawn STB_fnc_AI_spawnAI;
	
	
	//Initial INDFOR
	[STB_IND,"infantry","fireteam",_UN_garSec,100,"garrison",[100,true]] spawn STB_fnc_AI_spawnAI;
	
	//Attack wave w1
	[_w1_sad,_w1_veh] spawn {
		waitUntil {triggerActivated w1_start_trig || MISSION_START};
		[STB_OPF,"infantry","section",_w1_sad,100,"sad",["UN_gar_1",50,["sad",["w2_mkr",100]]]] spawn STB_fnc_AI_spawnAI;
		waitUntil {triggerActivated w1_trig  || SEND_W1};
		_i = 0;
		while {_i < 2} do {
			sleep ([300, STB_DebugSleep] select STB_DebugEnabled);
			_i = _i + 1;
			[STB_OPF,"infantry","fireteam",_this select 0,100,"sad",["UN_gar_1",50,["sad",["w2_mkr",100]]]] spawn STB_fnc_AI_spawnAI;
			sleep ([180, STB_DebugSleep] select STB_DebugEnabled);
			[STB_OPF,"vehicle","light",_this select 1,100,"sad",["UN_gar_1",200,["sad",["w2_mkr",100]]]] spawn STB_fnc_AI_spawnAI;
			
		};
		w1_done = true;
		publicVariable "w1_done";
		if(STB_DebugEnabled) then {
			systemchat format ["AIComm (%1) - W1 wave complete", time];
		};
	};
	//UN support forces
	[] spawn {
		//Wait until all the wave 1 is finished
		waitUntil {w1_done};
		sleep 120;
		//Notify Command of inbound UN support forces
		UN_comms_send = true;
		publicVariable "UN_comms_send";
		//wait for confirmation that area is secure 
		waitUntil {triggerActivated w1_trig && UN_ref_send};
		//Add additional intel on secondary objective
		UN_warcrime_intel_added = true;
		publicVariable "UN_warcrime_intel_added";
		//Bring in UN support forces
		[w1_trig, ["UN_w1_spawn"], ["UN_Heli_mkr"], "LOP_UN_Mi8MT_Cargo", STB_IND, "allSpawn", ["fireteam",1,"fireteam",false,[],true]] spawn DDZ_fnc_AI_sad_logistics;
		sleep 180;
		[w1_trig, ["UN_w1_spawn"], ["UN_Heli_mkr"], "LOP_UN_Mi8MT_Cargo", STB_IND, "allSpawn", ["fireteam",1,"fireteam",false,[],true]] spawn DDZ_fnc_AI_sad_logistics;
		
		if(STB_DebugEnabled) then {
			systemchat format ["UNComm (%1) - W1 re-enforcements sent", time];
		};

	};
	//Secondary tasking wave spawn
	[_w2_sad,_w2_veh,_w2_gar,_w2_pat] spawn {
		//Secondary obj trigger activated
		waitUntil {triggerActivated w2_start_trig || SEND_W2};
		if(STB_DebugEnabled) then {
			systemchat format ["AIComm (%1) - W2 wave started", time];
		};
		//Apply additional forces to the area
		[STB_OPF,"infantry","fireteam",_this select 2,100,"garrison",[200,true]] spawn STB_fnc_AI_spawnAI;
		//Begin wave 2
		_i = 0;
		while {_i < 4} do {
			sleep ([450, STB_DebugSleep] select STB_DebugEnabled);
			_i = _i + 1;
			[STB_OPF,"infantry","fireteam",_this select 0,100,"sad",["w2_mkr",200,["sad",["UN_gar_1",100]]]] spawn STB_fnc_AI_spawnAI;
			sleep ([60, STB_DebugSleep] select STB_DebugEnabled);
			[STB_OPF,"vehicle","light",[((_this select 1) select 1)],100,"sad",["w2_mkr",200,["sad",["UN_gar_1",100]]]] spawn STB_fnc_AI_spawnAI;
			[STB_OPF,"vehicle","medium",[((_this select 1) select 0)],100,"sad",["w2_mkr",200,["sad",["UN_gar_1",100]]]] spawn STB_fnc_AI_spawnAI;
			
			
		};
		w2_done = true;
		publicVariable "w2_done";
		if(STB_DebugEnabled) then {
			systemchat format ["AIComm (%1) - W2 wave complete", time];
		};
	};
};

// CODE TO BE EXECUTED ON ALL MACHINES AFTER ALL INTIALISATION IS COMPLETE
// e.g. hint to say that initialisation is complete




/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	****************** 		EXAMPLE AI FUNCTION CALLS	   **********************************
	
	PRECONFIGURED FUNCTIONS:
	- use to quickly populate an area or genetrate an attack on a target
	- use if you don't mind exactly where the ai spawns (controlled by center and radius parameters)
	
	STB_fnc_AI_populateArea - creates random ai in an area
	
	[0,"random","random","random",[10,0],[10,0],[10,0],[5,0],player,750] spawn STB_fnc_AI_populateArea;
		
		Params:
			faction - number (see factions list)
			group type	(string - see group type list under infantry class)
			vehicle type  (string - see group type list under vehicle class)
			air vehicle type - string (see group type list under "air" class) 
			number of groups on patrol [min,random extra]
			number of groups to be garrisoned [min,random extra]
			number of vehicles on patrol [min,random extra]
			number of air vehicles on patrol
			center positon - marker/object/positon array
			radius (m)
			
			
	STB_fnc_AI_attack - creates a randomisable AI attack
		
	[0,"random","random","random",[10,0],[5,0],[2,0],player,150,[500,1500],[270,180]] spawn STB_fnc_AI_attack;
		
		Params:
			faction - number (see factions list)
			group type - string (see group type list under "infantry" class)
			vehicle type - string (see group type list under "vehicle" class) 
			air vehicle type - string (see group type list under "air" class)  
			amount infantry - [min, random extra]
			amount vehicles - [min, random extra]
			amount air - [min, random extra]
			target - marker/object/posarray
			error - number in m (how close their waypoint will be to the target pos)
			radii - [minimum radius (m), random extra (m)]
			(optional) azimuth - [minimum azimuth (degrees), random extra (degrees)]
				default is a 360 degree unrestricted ambush [0,360]
				
	
	
	MAIN SPAWNING FUNCTION 
	- highly configurable, use for more control over spawn positions and behaviours
	- the above two functions are just calling this function below multiple times in different ways
	
	STB_fnc_AI_spawnAI - Spawns AI
	
		e.g. to spawn an infantry section at each of 3 markers that patrol around their spawn point
		[0,"infantry","section",["marker_1","marker_2","marker_3"],100,"patrol",["self",25]] spawn STB_fnc_AI_spawnAI;

		Params: 	
		faction (number) - see factions list
		group class (string) - see group class list or enter "random"
		group type (string) - see group type list or enter "random"
		marker array (string array) - markers at which to spawn groups e.g. ["marker1_name","marker2_name",...,"markerN_name"] 
		[optional] marker percentage (number 0-100) - percentage chance that each marker is used (default = 100)
		[optional] AI mode (string) - 	"patrol", "garrison", "sad" or "none" (default = "none")
		[optional] params (array) 	-	if "patrol": [centerPos, radius]
										if "garrison": [radius]	
										if "sad": [target, radius]
										if "none": nil or left blank
										if "move": [destination, radius, [optional] go slow?, [optional] patrol afterward?]
									
		e.g. to spawn an infantry section at each of 3 markers that patrol around their spawn point
		[0,"infantry","section",["marker_1","marker_2","marker_3"],100,"patrol",["self",25]] spawn STB_fnc_AI_spawnAI;
		
		
	HELPER FUNCTIONS FOR MARKER ARRAYS
	
	STB_fnc_ancillary_randomLocations 
	- generates markers in random locations to be fed into ai spawning function
	- used by the preconfigured functions above
	- highly configurable
	
	markerArray = ["centerMarker",[0,5000],[30,0]] call STB_fnc_ancillary_randomLocations;

		Params:
		center position (marker/obj/posArray) - central position for the marker generation
		radii (array) - [min distance, max distance] 
		# of markers (array) - [minimum, random]
		(optional) azimuth (array) - [start angle, sector width]
		
			e.g. for attacks from coming from anywhere between 180 (s) and 270 (w) degrees the azimuth
			paramater would be [180,90]
				180 is the start angle,
				90 is the width of the arc, ending at 270 degrees
		
		returns array of randomly placed markers
		
		
	STB_fnc_ancillary_defineMarkers
	- define specific markers you've placed on the map easily
	- follows arma naming convention for duplicate names:
		place a marker on the map, name it something e.g. "alpha", put it to one side
		copy this marker by clicking on it and pressing ctrl+c
		paste it around where you want the ai to spawn, note that each paste returns a new name
		the names are in sequence "alpha_1", "alpha_2" etc 
		this is true as long as you are copy-pasting from the original "alpha" marker, be careful!
		call this function to define all the names in an array to save you writing the explicit strings out
		
	markerArray = ["alpha", 10] call STB_fnc_ancillary_defineMarkers;
	
		Params:
		namePrefix (string) - the name of the first marker you put down (the one you copy-paste)
		markerCount (integer) - the number of those markers you put down (if this is higher than actual amount on map, errors may appear)
				
		this will return an array ["alpha_1","alpha_2","alpha_3"..."alpha_10"] 
		

	******************		LIST OF DEFINITIONS FOR AI FUNCTIONS    	*********************
	
	FACTIONS:
	0: NATO
	1: AAF
	2: CSAT
	3: FIA (blue)
	4: FIA (green)
	5: FIA (red)
	6: 3CB BAF (3CB BAF units, equipment & vehicles required)
	7: RHS Russian Military (RHS mod required)
		
	>	GROUP CLASSES		>	GROUP TYPES		

	>	"infantry"			>	"section"
							>	"fireteam"
							>	"weapons"
							>	"at"
							>	"aa"
							>	"sentry"
							>	"sniper"
							>	"mortar"
							
	> 	"motorized"			>	"section"
							>	"fireteam"
							>	"at"
							>	"aa"
							>	"hmg"
							>	"gmg"
							>	"mortar"
							
	> 	"mechanized"		>	"section"
							>	"at"
							>	"aa"
							>	"support"

	>	"vehicle"			>	"unarmed"
							>	"light"
							>	"medium"
							>	"heavy"
							
	> 	"air"				>	"transport"
							>	"rw_cas"
							>	"fw_cas"
							
	> 	"static"			>	"mortar"
							>	"hmg"
							>	"gmg"
							>	"at"
							>	"aa"	

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */