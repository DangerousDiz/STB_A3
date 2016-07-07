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

};

if (hasInterface) then {

	// CODE TO BE EXECUTED ON ONLY CLIENT MACHINES (NOT SERVER/HC)
	// e.g. briefing, hint messages, addactions
	
	waitUntil{!isNull player};
	waitUntil{player == player};
	/*
	execVM "Scripts\3cb\medicalFix.sqf";
	execVM "Scripts\3cb\Ctab.sqf";
	*/
	//Removes adverse effects of killing civilians
	player addRating 99999;
	/*
		Client side loops and actions / events
	*/
	
	
};

if (isServer) then {

	// CODE TO BE EXECUTED ON THE SERVER
	// e.g. triggers for monitoring mission objectives and progress	
	//Clean Up...
	/*
	[
		10*60, // seconds to delete dead bodies (0 means don't delete) 
		10*60, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		10*60, // seconds to delete dropped weapons (0 means don't delete)
		0, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'Scripts\repCleanUp.sqf';		
	*/
};

if (STB_isAIController) then {
	
	// CODE TO BE EXECUTED ON THE AI CONTROLLER
	// The AI controller is defined as the HC IF IT IS PRESENT
	// or the SERVER IF THE HC IS NOT PRESENT
	// e.g. AI spawn scripts
	/*
		AI Spawn:
	*/
	
	
	
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