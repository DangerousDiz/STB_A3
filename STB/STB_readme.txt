STB MISSION FRAMEWORK v03.X
By DOM.STB and HOWL [3CB]

ABOUT THIS FRAMEWORK:

This framework is designed to provide a large number of commonly-used functions in ArmA 3 mission making, and to 
provide tools for mission-makers to use during testing and debugging of missions.
 
It is completely self-contained: It can be added to any existing mission without interfering with any other scripts. 
All that is required is to add a line to your init.sqf calling the STB\STB_init.sqf script (see usage instructions).

All STB functions will be available on all clients and server machines during runtime.

To customise the framework for your missions you only need to alter one file, namely STB\STB_settings.sqf
This contains all the user customisable settings provided by the framework.


USAGE INSTRUCTIONS:

To use this framework, copy the STB folder into your mission directory and add the following line to your init.sqf

	execVM "STB\STB_init.sqf";
	
This will execute a series of scripts to compile all the functions and variables required by the framework.	
The final script executed by the framework on startup is "STB\STB_mission_init.sqf". By default this is blank. 
To add your own custom code to the mission, and utilise the various functions available, write it into this
script. It essentially functions in the same way as the init.sqf, but now all STB functions are compiled and 
available to call. The idea is that mission specific things that would perhaps have normally been put in the 
init.sqf are instead put here, ensuring that it is executed AFTER all the required functions and variables are
defined in the framework. 

This is where you'd call the AI spawning scripts etc if you wanted them to run at mission start. Locality blocks
are provided within the script. Use the comments to identify where to place code for specific localities.

The ONLY files you need to edit on a per mission basis are STB_settings.sqf (for cutomising the framework) and 
STB_mission_init.sqf (for adding your own code to missions).


USER SETTINGS:

The file STB/STB_definitions/STB_settings.sqf is where all the user-modifiable settings are stored. This is where
you customise the framework to suit your particular mission. The settings available are:

	STB_DebugEnabled (bool) - When enabled, spawned units are marked, teleport, setCaptive and freeCamera actions
	are given to the player, and debug log messages are displayed in the system chat. Set to false before publishing 
	missions.
	
	STB_AISkillArray - The skill levels that all spawned AI will be given.
	
	STB_PlayerRespawns (integer) - Number of respawns available to each player
	
	STB_MaxAI - The number of AI above which the spawn scripts will not generate more groups. Desired setting will vary
	with server specs.
	
	STB_Medical (string) - filename of the medical preset located in STB\STB_logistics\presets\medical\ 
	WITHOUT FILE EXTENSION!
	
	STB_GearPreset_[SIDE] (string) - filename of weapons preset used by [SIDE] units when gear is assigned by the framework 
	located in STB\STB_logistics\presets\gear\ WITHOUT FILE EXTENSION!
	
	STB_UniformPreset_[SIDE] (string) - filename of uniform preset used by [SIDE] units when gear is assigned by the framework 
	located in STB\STB_logistics\presets\uniforms\. WITHOUT FILE EXTENSION! Use "none" to keep editor unit uniforms".
	
	STB_GearParams_[SIDE] (array of bools) - defining options for the gear assigned to [SIDE].
		[silencers for riflemen?,
		silencers for AR?,
		silencers for DMR (7.62)?,
		handgun silencers?,
		NVGs?,
		no optics?,
		riflemen get light AT?,
		IR Strobe Action?]
		
	STB_Extras (string) - filename of the extras preset located in STB\STB_logistics\presets\extras\
	This is intended for adding items associated with specific mods such as AGM's earbuds. WITHOUT FILE EXTENSION!
	
	STB_TFAR_Encryption (array of strings) - define the side-based encryptions for TFAR radios.
 	default is ["_bluefor","_opfor","_independant"]
	if you want two sides to be able to hear eachother, give them the same encryption
	e.g. ["_bluefor","_opfor","_bluefor"] if blue and green are sharing comms.

	STB_HC_Name (string) - the name given to the HC you want STB functions to use.
	
	STB_useAvailableHC (bool) - if false, the HC will not be used even if detected.
	

RESPAWN:

The framework provides a setting where you can specify the number of respawns each player is allowed. A further setting is provided 
that defines how the framework treats respawning:

	STB_RespawnMode (number 0-2)
		0: The framwork does not handle player lives when respawning, the settings in the description.ext will be used
		1: The framework handles player lives with a system internal to it. Requires that respawn be enabled in description.ext
		   Required respawn settings in description.ext - respawn = "base","instant", "group" or "side"	(or 2,3,4 or 5)
		   If respawn is set to "none" or "bird", then JIP and respawn will be disabled.
		2: The framework handles player lives via the BIS ticket system. Behaves exactly equivalently to 1 but requires the line
		   	respawnTemplates[] = {"Tickets"};
		   to be placed in the description.ext. 

A useful feature of the respawn system is that you can have a "No Respawn" mission while still allowing JIP. To acheive this, use 
STB_RespawnMode = 1; and STB_PlayerRespawns = 0;

NOTE: there is nothing to stop players from disconnecting and rejoining after running out of lives. This can only work on an honour
system therefore it is recommended only for co-ops on private servers.


EDITOR SETUP: 
(using setVariable in the init boxes of editor-placed units)

The framework handles gear and cargo assignment, group and special markers and resupply points at mission start by looking for 
variables defined on units (via setVariable). It searches for units/objects/vehicles with the following variables defined on them:

	STB_Loadout 		- string	 				- "ftl"						- unit init 			- 	to define unit loadout
	STB_Cargo 			- [string,string] 			- ["car","west"]			- crate/vehicle init	-	to define cargo
	STB_Resupply 		- number					- 10						- object/vehicle init	-	to define object as 
																											resupply point
	STB_Description		- string					- "Alpha 1-1 SL"			- unit init				-	to have the unit appear 
																											in a troop structure tab 
																											in briefing
	STB_GroupMarker		- [string,string,string]	- ["hq","red","H1-1"]		- unit init				-   to have the unit's group 
																											leader persistantly marked.
	STB_SpecialMarker 	- [string,string,string]	- ["medical","black","AM"] 	- unit init				-	to have that specific unit 
																											persistantly marked.
				
when using setvariable from a unit's init line the syntax is

	this setVariable ["variablename", value, isPublic?];
	
where 
	variablename 	- 		the name of the var IN QUOTES (string)
	value 			- 		the value of the variable (any data type or array of data types)
	isPublic? 		-  		whether the variable is broadcast to all connected clients (bool).
							NOTE: for STB variables, always set isPublic to TRUE!


LOADOUTS:

To give units loadouts put the following line in their init box in the editor:

	this setVariable ["STB_Loadout","class",true];
	
where "class" is a string that defines the class (see list of defined classes below).

List of defined classes for STB_Loadout variable:

		"coy"		- company commander
		"co"		- troop commander 
		"dc" 		- deputy commander / 2IC
		"sl"		- section leader
		"fac"		- forward air controller
		"r" 		- rifleman
		"lsw"		- light support rifleman
		"m" 		- medic
		"ftl"		- fire team leader
		"ar" 		- automatic rifleman
		"aar"		- assistant automatic rifleman
		"mmgg"		- medium mg gunner
		"mmgag"		- medium mg assistant
		"matg"		- medium AT gunner
		"matag"		- medium AT assistant
		"hmgg"		- heavy mg gunner (deployable)
		"hmgag"		- heavy mg assistant (deployable)
		"hatg"		- heavy AT gunner (deployable)
		"hatag"		- heavy AT assistant (deployable)
		"mtrg"		- mortar gunner (deployable)
		"mtrag"		- mortar assistant (deployable)
		"msamg"		- medium SAM gunner
		"msamag"	- medium SAM assistant gunner
		"hsamg"		- heavy SAM gunner (deployable)
		"hsamag"	- heavy SAM assistant gunner (deployable)
		"sn"		- sniper
		"lg"		- long gunner
		"sp"		- spotter (for sniper)
		"vc"		- vehicle commander
		"vg"		- vehicle gunner
		"vd"		- vehicle driver (repair)
		"pp"		- air vehicle pilot / co-pilot
		"pcc"		- air vehicle co-pilot (repair) / crew chief (repair)
		"pc"		- air vehicle crew
		"eng"		- engineer (demo)
		"engm"		- engineer (mines)
		"uav"		- UAV operator
		"div"    	- divers

PRESETS:
		
You can specify a specific gear and uniform preset for each side in the settings file. The framework will use the 
preset to define the range of weapons (e.g. rifle, carbine, mmg, ar etc) and distribute them to units depending 
on the class assigned to them.

Vanilla presets that come included with this framework (no mods required - can be mixed and matched freely

	"gear_nato"			-		"uniforms_nato"
	"gear_csat"			-		"uniforms_nato"
	"gear_fia"			-		"uniforms_aaf"
	"gear_aaf"			-		"uniforms_fia_b"
	"gear_mx_black"		-		"uniforms_fia_o"
								"uniforms_fia_i"

PERSISTANT, MOVING MARKERS:
	
To have a unit's group marked persistently in the map, use the following line in their init box in the editor:

	this setVariable ["STB_GroupMarker", ["markerType","markerColor","markerText"], true];
	
where "markerType" is a string defining the NATO symbol used, "markerColor" is a string defining the color, and
"markerText" is the text that displays next to the marker. Group markers will keep updating as long as at least one 
unit in the group is alive. It will always marker the current leader of that group. 

To have an individual unit marked persistently on the map, the process is similar but in this case the variable is

	this setVariable ["STB_SpecialMarker", ["markerType","markerColor","markerText"], true];
	
In this case, the marker follows the individual unit only, and updates until he dies. Useful for medics in particular.
	
List of defined "markerType" and "markerColor" strings to define marker icons (these can be mixed and matched freely):

		MARKER ICONS	-  	  	MARKER COLORS
		
		"infantry"		-		"red"
		"motorized"		-		"green"
		"mechanized"	-		"orange"
		"armored"		-		"yellow"
		"artillery"		-		"blue"
		"helicopter"	-		"pink"
		"plane"			-		"purple"
		"hq"			-		"white"
		"recon"			-		"black"
		"medical"		-		"brown"
						-		"grey"
						
"markerText" can be any string.
	
	
CARGO:
	
To add cargo to vehicles or crates use the following:

	this setVariable ["STB_Cargo", ["cargoType","side"], true];
	
where "cargoType" is a string that defines the cargo to be used (e.g. "v_car" or "crate_med") and the side is a string
either "west","east", or "resistance". In the case of cargo, the side must be specified rather than chosen dynamically
because the vehicle often starts empty (i.e. civilian side).

List of defined "cargoType" and "side" strings (can be freely mixed and matched):

		CARGO TYPE		-		SIDE
		
		"car"			-		"west"
		"truck"			-		"east"
		"ifv"			-		"resistance"
		"tank"			-
		"helo"			-
		"crate_small"	-
		"crate_medium"	-
		"crate_large"	-


RESUPPLY POINTS:

To add a vehicle or object as a resupply point, use the following:

	this setVariable ["STB_Resupply", numberOfResupplies, true];
	
where numberOfResupplies is a number that defines how many times players can take re-ups from that object. Use -1 for
unlimited. 

All units or vehicles with an STB_Loadout or STB_Cargo variable defined can be re-loaded using this system. A soldier
will receive the same gear that he was assigned at mission start. If in a vehicle, the vehicle itself will have its
cargo reloaded according to its assigned class. It will also receive full fuel and ammunition.

NOTE, to access this action in the vehicle you'd need to put the resupply object in the center of your field of view.
This can be difficult as a tank or ifv driver where the field of view is locked to center. In these cases, the driver
may wish to ask a crew member to carry out the rearm action.

If this is used on a vehicle, it becomes a moving supply point.


TROOP STRUCTURE BRIEFING TAB:

The framework generates a briefing tab to display the playable roles and the players assigned to them. To list a unit 
in that tab, use the following in that units init:

	this setVariable ["STB_Description", "Alpha 1-1 SL", true];

The tab alphabetises the list and adds line breaks between groups with different first or second letter. It only includes 
units that have been slotted into (by either AI or players).

VEHICLE SERVICING:

To set up vehicle servicing, make a trigger defining the area you want to act as a servicing location, name it (e.g. srv1),
set its activation to the side(s) you want to be able to use the service, and set it to trigger REPERATEDLY. Finally, add
the name you gave to the trigger to the STB_VehicleServiceTriggers array (IN QUOTES - e.g. "srv1"). 

Vehicle drivers of the correct side will get access to an action allowing them to refuel, repair and rearm if they are stopped
on the ground within the trigger. Multiple triggers can be defined with different activation sides.

SPAWNING AI:

High-level ai spawning functions are provided to allow quick populations of particular areas or the generation of ai 
attacks on fixed positions. 

	QUICK AI SPAWN SCRIPTS:	
	
	
	STB_fnc_AI_populateArea - Creates randomizable AI in a given area. 
	
	Params:
	faction - number (see factions list)
	infantry group type	(string - see group type list under infantry class)
	vehicle type  (string - see group type list under vehicle class)
	air vehicle type - string (see group type list under "air" class) 
	number of groups on patrol [min,random extra]
	number of groups to be garrisoned [min,random extra]
	number of vehicles on patrol [min,random extra]
	number of air vehicles on patrol
	center positon - marker/object/positon array
	radius (m)
			
	example:
	[0,"random","random","random",[10,0],[10,0],[10,0],[5,0],player,750] spawn STB_fnc_AI_populateArea;	
	
		
	STB_fnc_AI_attack - creates a randomisable AI attack
		
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

	example:
	[0,"random","random","random",[10,0],[5,0],[2,0],player,150,[500,1500],[270,180]] spawn STB_fnc_AI_attack;
	

These functions each utilise the same core AI spawning function: STB_fnc_AI_spawnAI. Using the core function 
directly provides you with a great deal more control and versatility when spawning in AI.


	ADVANCED AI SPAWN FUNCTION: 
	
	STB_fnc_AI_spawnAI - fully customisable, versatile ai spawning script

	CHOOSING WHAT YOU SPAWN:
	
		You call spawn scripts using strings to specify the types of groups you want
		to spawn in, and a number to determine their faction. The basic AI spawn script
		requires these for its first three parameters like so:

		[faction, "group class", "group type", ... ] spawn STB_fnc_ai_spawnAI;
		
		e.g.
		[0, "infantry", "section", ...] for a NATO infantry section
		[1, "motorized", "hmg", ...] for a CSAT motorized HMG unit
		[2, "vehicle", "heavy", ...] for a random AAF heavy vehicle
		
		You can also use the word "random" in place of group class and/or group type
		and the functions will choose their parameters at random. 
		
		NOTE: Not all factions will have all units types available. Some assets like heavy AT,
		AA, Heavy vehicles and Air support are not available for FIA factions. In these cases
		they will use their closest match or nothing at all.
		
		You must follow the inheritance trees displayed below to specify a group correctly,
		e.g. if your class is "vehicle", your group must be "unarmed", "light", "medium", or
		"heavy". If the group type is not found within the group class that was specified, 
		it will be chosen at random from the allowed types within that class.
		
	LIST OF DEFINITIONS FOR AI SPAWN SCRIPTS:
	
		FACTIONS:
			0: NATO
			1: AAF
			2: CSAT
			3: FIA_B (west)
			4: FIA_I (resistance)
			5: FIA_O (east)
			6: 3CB BAF units (west) (3CB_BAF mods required)
			6: RHS Russian Military (east) (RHS mod required)
			
		>	GROUP CLASSES		>	GROUP TYPES		

		>	"infantry"			>	"section"
								>	"fireteam
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
	
	CHOOSING WHERE IT SPAWNS:
	
		The AI spawning function takes an array of markers and spawns AI groups on top of 
		them. There are two main ways you can choose where AI is spawned using these functions.
		
		To choose specific locations, create a set of markers in the editor and name them
		(e.g. ai_1, ai_2, ai_3 etc). Assign these markers to an array and use that array as
		an input parameter on the AI spawn script
		
		e.g.
			_markerArray = ["ai_1","ai_2","ai_3"];
			[0, "infantry", "fireteam", _markerArray, ...] spawn STB_fnc_AI_spawnAI;
			
		Alternatively, to randomise the locations, you can make use of another function from the
		framework: STB_fnc_ancillary_randomLocations.
		
		This function takes a center point, a min and max distance and a min and max desired number
		of markers like so:
		
			_markerArray = [player,[1000,2000],[20,10]] call STB_fnc_ancillary_randomLocations;
			
		this will generate a minimum of 20 markers, with a possibility of up to 10 more, at random
		distances between 1000 and 2000m from the player in all direction.
		
		An optional final parameter allows you to restrict the markers to a specified angular sector
		from the center point (useful for creating directional attacks). To use this add an extra param
		to the call line: [start angle, arc size] (degrees)
		
		e.g.
			_markerArray = [player,[1000,2000],[20,10],[180,90]] call STB_fnc_ancillary_randomLocations;
			
		for the same number of markers but now restriced to between 180 and 270 degrees from the player.
		
		After generating the markers, use them as above as an input to the AI spawning function. The number 
		of AI can be further randomised by specifying a percentage chance that each marker is actually used.
		
		e.g.
			[0,"infantry","fireteam",_markerArray,80, ...]
			
		to use roughly 80% or the markers in _markerArray.
		
	CHOOSING BEHAVIOUR:
	
		The next parameter is a string that defines the "AI MODE" of the groups that are spawned.  If specified,
		it must be accompanied by the parameters that go with the specified mode. There are four AI modes to choose
		from:
		
			"patrol", [center, distanceBetweenWaypoints]
				-center is EITHER: a position/object/markername defining the center of the patrol, 
							OR: the string "self" to specify that the unit patrol around his initial location.
				-distanceBetweenWaypoints is the average distance between each assigned patrol waypoint.
				keeping this number small prevents the patrol from wandering off too far. 15-50m is usually sufficient 
				for infantry
				
			"garrison", [radius, deleteUnsedUnits?]
				-radius is a number defining how far from the start point the group will look for a building
				-deleteUnused is an OPTIONAL boolean - if true units that can't be placed in a suitable position get deleted
				if false, they are sent on patrol. It is recommended to leave this as true (the default) to avoid bloat.
				
			"sad", [target, errorRadius]
				- target is the object/marker/position that the group will move to while searching for enemy units.
				- errorRadius is the radius around the target in which the SAD waypoint may be assigned.
				
			"none", []
				- no params required, units stay stationary at initial point
				
		
		NOTE: garrison mode will not work for vehicles, air vehicles or static weapons - they will revert to "none"
				
		Some examples of full function calls using STB_fnc_AI_spawnAI;
		
		patrols:
			[0,"infantry","section",_markerArray,100,"patrol",["self",15]] spawn STB_fnc_AI_spawnAI; 
			[4,"motorized","random",["myMarker1","myMarker2","myMarker3"],100,"patrol",["AO",500]] spawn STB_fnc_AI_spawnAI; 
			
		a stationary vehicle:	
			[2,"vehicle","medium",["vehicleGuardPos"],100,"none",[]] spawn STB_fnc_AI_spawnAI;
			
		garrisoned units:
			[1,"infantry","fireteam",_myArrayOfBuildingMarkers,100,"garrison",[100]] spawn STB_fnc_AI_spawnAI;
			
	STORING THE GROUPS
	
		The spawn script returns an array containing all the groups it has created. This is useful for doing
		other things with the groups later, for example, deleting them. 
		
		NOTE: To get the return array, you must use CALL in place of SPAWN.
		
		An example piece of code that spawns units then
		deletes them after a short delay.
		
			// spawn groups and store them in a variable (_spawnedGroups)
			_spawnedGroups = [0,"infantry","random",["mkr_1","mkr_2","mkr_3","mkr_4"]] call STB_fnc_AI_spawnAI; 
			// wait for a minute
			sleep 60; // wait for a minute
			// delete each of the units of each of the groups
			{ { deleteVehicle _x } forEach units _x } forEach _spawnedGroups; 
			
		The framework also automatically maintains an array of all the groups it has spawned throughout the mission.
		This is stored in a variable called STB_SpawnedGroups. If you ever want to delete all the units you've spawned 
		in one fell swoop you can use:
		
			{ { deleteVehicle _x } forEach units _x } forEach STB_SpawnedGroups; 		

		Dead or deleted groups are removed from the variable automatically.
		
	CHOOSING LOCALITY:
	
		These scripts do NOT have any in-built network locality logic in them. They will run wherever they are called. 
		This provides greater flexibility, but it means you MUST specific locality using commands like if (isServer) then {};
		
		IF YOU CALL THESE SCRIPTS ON MULTIPLE CLIENTS, THE AI WILL SPAWN MULTIPLE TIMES, BE CAREFUL WITH LOCALITY!		
	
		The framework provides a variable that can be checked to identify the headless client if it is present, but that
		identifies the server if the HC is not connected. This provides a way to safely code missions for HC compatibility 
		while not making the mission dependant on it. 		
		
		First put a HC virtual object into the mission and name it. The settings file contains a string variable in which
		you define the name (STB_hc_name). The default is "STB_HC", so if you name your HC entity STB_HC you don't have to change this 
		setting.
		
		If the HC with the specified name has been connected to by mission start, the framework will assign a value to the
		variable STB_isAIController that will be true on the headless client but false on all other clients and the server.
		This variable can be queried in the same way as you would normally use isServer e.g.
		
			if (STB_isAIController) then {/* call some ai spawn functions */};
			
		If the HC was not connected at mission start, this variable will instead identify the server. In that case the above 
		line of code would execute the spawn code on the server.
		
		So all code with the 
			if (STB_isAIController) then {};
		will execute on the named HC if it is connected, or the server if not.
		

DEBUG FUNCTIONS:

When STB_DebugEnabled is set to true, each player will have access to four action-menu functions to assist with mission debugging.

	Start Free Camera - launches the BIS_fnc_cameraOld (basic free-cam) from the players position (right-click to return to your
	player, open map and left-click to move camera around. Same camera controls as with spectator mode.
	
	Teleport - Opens the map screen - click a location on the map to telport there.
	
	Toggle Captive Status - Toggles whether the player's "setCaptive" attribute is true or false. When true, AI will not react to 
	the players presence.
	
	Check Server Status - Tells you about the numbers and locality of AI deployed on the network.
	
Further, when this is enabled, all AI groups created by STB functions will be persistently marked and debug messages will be printed
to the systemChat.


ADVANCED FEATURES:

You can make your own gear and uniform presets if the ones that are provided do not fit your needs. All you have to do is copy an 
existing one and change the classnames to contain the weapons/items/gear you want. Be very careful not to break the structure
of the preset or leave anything undefined as this will lead to errors.

You can also change the medical items if you use a mod other than AGM to handle medical. Again, copy the existing medical preset 
into a new file in the same folder, rename it and fill in the classnames. Here there are two global arrays being defined:

	STB_BasicMeds - each item in this array will be given to every soldier that receives a loadout.
	STB_AdvancedMeds - each item in this array will go to medics (in addition to the basic meds).
	
Finally there is an "extras" preset that will give extra items to specific units. Again, some global arrays are defined here:

	STB_extras_general - array of items to be added to ALL units that receive an STB loadout(e.g. ear plugs)
	STB_extras_ar -	items to be added to AR, MMG and their assistants (e.g. spare barrels)
	STB_extras_demo - items to be added to demoiliton specialists (e.g. clackers)
	STB_extras_pilot - items to be added to pilots and crew (e.g. map tools)
	STB_extras_sniper - items to be added to snipers (e.g. kestral)
	
To choose from existing presets or use your own, simply enter the filename of the preset (without extention) in the appropriate
variable in STB_Settings.sqf (e.g. STB_GearPresetWest = "gear_nato";)
		
-----------------------------------------------------------------------------------------------------------------------------			
	

List of functions:

	STB\STB_functions\STB_functions_AI.sqf
	
		HIGH_LEVEL FUNCTIONS
	
			STB_fnc_AI_populateArea
			
				Randomly populate an area with infantry patrols, ground and air vehicle 
				patrols and garrisoned units.
			
				Usage:
				[0,"random","random","random",[10,0],[10,0],[10,0],[5,0],player,750] 
				spawn STB_fnc_AI_populateArea;
				
				Params:
					faction - number (see factions list)
					group type	(string - see group type list under infantry class)
					vehicle type  (string - see group type list under vehicle class)
					air vehicle type - string (see group type list under "air" class) 
					number of groups on patrol [min,random extra]
					number of groups to be garrisoned [min,random extra]
					number of vehicles on patrol [min,random extra]
					number of air vehicles on patrol
					center position - marker/object/position array
					radius (m)
					
				
			STB_fnc_AI_attack
				
				Creates a randomisable AI attack
				
				Usage:
				
				[0,"random","random","random",[10,0],[5,0],[2,0],player,150,[500,1500],[270,180]] 
				spawn STB_fnc_AI_attack;			
		
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
						
				
			STB_fnc_AI_spawnAI
			
				Master function for spawning AI
				
				Usage:
					[0,"infantry","section",["marker_1","marker_2","marker_3"],100,"patrol",["self",25]] 
					spawn STB_fnc_AI_spawnAI;
				
				Params: 	
					faction (number) - see factions list
					group class (string) - see group class list or enter "random"
					group type (string) - see group type list or enter "random"
					marker array (string array) - markers at which to spawn groups e.g. 
						["marker1_name","marker2_name",...,"markerN_name"] 
					[optional] marker percentage (number 0-100) - percentage chance that 
						each marker is used (default = 100)
					[optional] AI mode (string) - "patrol", "garrison", "sad" or "none" 
						(default = "none")
					[optional] params (array) -	"patrol": [centerPos, radius]
												"garrison": [radius]	
												"sad": [target, radius]
												"none": nil or left blank
												
				
			STB_fnc_AI_patrol
			
				Sets a group on a patrol with a given waypoint range
				
				Usage Example: 
				[myGroupName, [player, 500]] spawn STB_fnc_AI_patrol;
				
				Params:
					group - the group you want to patrol
					patrolparams - an array as follows:
						[center (obj/marker/pos), radius (number)]
						
				
			STB_fnc_AI_garrison
			
				Garrisons a group in nearby buildings.

				Usage:
					[GroupName, [100, true]] spawn STB_fnc_AI_garrison;
					[GroupName, [100]] spawn STB_fnc_AI_garrison;
				
				Params:
					group name - the group you want to garrison
					garrisonparams is an array as follows:
						[radius (number), deleteUnused (optional bool)]
					"radius" is the radius in which to search for buildings
					"deleteUnused" will default to true, deleting units that
					couldn't be placed in buildings. If false, they are set
					to patrol, but this can lead to bloat. 
					
					
			
			STB_fnc_AI_sad
			
				Assigns Search and Destroy waypoints
				
				Usage:
					[GroupName, [player, 500]] spawn STB_fnc_AI_sad;
					
				Params:
					group name - name of group you want to go on SAD mission
					sadparams is an array as follows:
						[target (obj/marker/pos), error (number in m)]
						where error is the radius of the SAD waypoint
						
						
						
			STB_fnc_AI_removeAllWaypoints
			
				Removes all waypoints from a given group. Useful for re-tasking AI mid-
				mission.
				
				Usage:
					groupName call STB_fnc_AI_removeAllWaypoints;
					
					
				
			STB_fnc_AI_vehicleLightsOn [unstable]
			
				Attempts to force all AI drivers to turn on headlights. No elegant method
				for this, can result in AI lights flashing on and off and other odd behaviours.
				
				
				
			STB_fnc_AI_forceFlashlights [unstable]
			
				Attempts to force all AI to use rifle-mounted flash light. Suffers from the same 
				issues as the vehicle-lights function. Only works on units with weapons that can
				utilise the "acc_pointer_IR" IR pointer.				
				

	STB\STB_functions\STB_functions_Ancillary.sqf
	
			STB_fnc_ancillary_randomLocations
			
				Generates an array of markers in random positions between a maximum and minimum 
				radius of a center point. Useful for generating markers to be used with the AI
				functions.
				
				Usage:
				_markerArray = ["centerMarker",[0,5000],[30,0]] call STB_fnc_ancillary_randomLocations;

				Params:
				center position (marker/obj/posArray) - central position for the marker generation
				radii (array) - [min distance, max distance] 
				number of markers (array) - [minimum, random]
				(optional) azimuth (array) - [start angle, sector width]
				
					e.g. for attacks from coming from anywhere between 180 (s) and 270 (w) degrees the azimuth
					paramater would be [180,90]
						180 is the start angle,
						90 is the width of the arc, ending at 270 degrees
				
				Returns:
					array of generated markers				
			
			STB_fnc_ancillary_addNoise2D			
			
				Takes a position as input and returns a random position within a radius around it.
				Useful for adding an error to a position value, e.g. an AI mortar strike. Or just
				for a bit of random variation in a position.
				
				Usage:
				_newPos = [getMarkerPos "startPos", 100] call STB_fnc_ancillary_addNoise2D;
		
				Params:
				center position (marker/obj/posArray) 
				radius - max amount of added noise
				
				Returns:
					new position
					
				
			STB_fnc_ancillary_randomName
			
				Returns a string with a specified prefix followed by 8 random alphanumeric characters.
				Useful for marker/unit/group creation where a unique name is required.
				
				Usage:
					_name = "prefix_" call STB_fnc_ancillary_randomName;
		
				Params:
					Prefix (string)
					
				Returns:
					Random string with prefix
				
			STB_fnc_ancillary_getBuildingPositions
			
				Returns an array of all the building positions in the nearest building to the specified
				center point. Utilised by the garrison function.
				
				Usage:
					_buildingPositions = player call STB_fnc_ancillary_getBuildingPositions;
					_buildingPositions = "markerName" call STB_fnc_ancillary_getBuildingPositions;
					_buildingPositions = [2560,1400,0] call STB_fnc_ancillary_getBuildingPositions;
				
				Params:
					start position (marker/object/posArray)
				
				Returns:
					array of building positions from nearest building
				
			STB_fnc_ancillary_moveInBuilding
			
				Places a given unit into a random position in a building, like garrison but with only one unit

				Usage:
					[player, getMarkerPos "hq_bunker", true] call STB_fnc_ancillary_moveInBuilding;
					
				Params:
					unit - unit to move
					center (marker/object/posArray) - where to center the search for buildings
					radius (number) - radius from center point in which the script will search for buildings
					warp? (bool) - if true, units will teleport, else units will walk to building pos

				Returns:
					selected building position (pos array)
				
			STB_fnc_ancillary_toPosArray
			
				Takes either a marker name, object name or positional array and returns a positional array.
				Used to allow scripts to take all of these things as input without errors.

				Usage:
					_centerPos = "myMarker" call STB_fnc_ancillary_toPosArray;
					
				Params:
					input (obj/marker/posarray)
				
				Returns:
					postion array at the location of the object or marker given as input
					if input is already a pos array it just returns the input unchanged
				
				
	STB\STB_functions\STB_functions_Debug.sqf
	
			STB_fnc_debug_toggleCaptive 
			
				Adds an action to a specified unit (usually the player) that gives the ability to toggle the
				"setCaptive" status. Useful for walking up to enemy units during testing. By default this runs 
				on all players when STB_DebugEnabled is set to true in STB_Init.sqf
				
				Usage:
				player spawn STB_fnc_debug_toggleCaptive;
				
			STB_fnc_debug_teleport
			
				As above but for a teleport ability based off of map clicks. By default this only
				runs when STB_DebugEnabled is set to true in STB_Init.sqf
				
				Usage:
				player spawn STB_fnc_debug_teleport;
				
			STB_fnc_debug_camera
			
				As above but starts the simple BIS free-camera script (BIS_fnc_cameraOld). By default this only
				runs when STB_DebugEnabled is set to true in STB_Init.sqf
				
				Usage:
				player spawn STB_fnc_debug_camera;

			STB_fnc_debug_checkServerStatus
			
				As above but adds an action to show locality and nubmers of AI around the network. By default 
				this only runs when STB_DebugEnabled is set to true in STB_Init.sqf
				
				Usage:
				player spawn STB_fnc_debug_checkServerStatus;
				
			STB_fnc_debug_markGroup
			
				Adds persistent markers to a given group that will track the position of the leader and if all 
				group members die, will turn black for 30s then disappear. Used only for testing, not designed
				for actual gameplay. All STB spawned groups will be marked by default if STB_Debug_Enabled = true.
				Marker icon color is determined by side.

				Usage: 
					[groupName, markerIcon, "markerText"] spawn STB_fnc_debug_markGroup;
					
				Where "markerIconType" can be 
					0: infantry
					1: vehicle
					2: air
			
			STB_fnc_debug_monitorGroups
			
				Keeps track of all the groups spawned in by the STB spawn functions and removed dead or deleted 
				units from the STB_SpawnedGroups variable				
			
			STB_fnc_debug_monitorMarkers
				
				Keeps track of all the markers created by the random location generating functions. Once a marker 
				is added to the array of disposable markers, it will be deleted after a specified time unless it is
				protected.

			STB_fnc_debug_protectMarkers
			
				Removes a marker form the disposable marker array and adds it to a protected array to stop it from 
				being cleaned up. (In case you want to use the saem markers multiple times)
			
			STB_fnc_debug_unprotectMarkers
			
				Removes a marker from the protected marker array and adds it back to the disposable array for it 
				to be cleaned up.
			
	STB\STB_functions\STB_functions_Intel.sqf

			STB_fnc_intel_getTroopStructure
			
				Gets all units with an editor-defined "STB_Description" variable and adds them to a briefing tab
				along with the player names in those roles
				
			STB_fnc_localGroupMarkers
			
				Marks all units with an editor-defined "STB_GroupMarker"  variable defined on a unit in their group
				Markers are persistent and can be changed with parameters passed to the variable
				
			STB_fnc_localSpecialMarkers
				
				Marks for individual units like medics, works as above but with the variable "STB_SpecialMarker"

---------------------------------------------------------------------------------------------------------------------------

KNOWN ISSUES:		

CHANGELOGS:

[BETA (version 3.X)]

	Changelog 3.3
	- ADDED: Vehicle Servicing system.
	- ADDED: 3CB BAF faction for AI unit spawning
	- ADDED: Comments in STB_mission_init.sqf now give examples of all the ai spawning code for copy-pasting
	- ADDED: Spawned AI now assumes marker direction
	- ADDED: Better AI safe position checking
	- ADDED: New AISkillArray setting defining AI subskills individually
	- FIXED: Some helo spawning issues should be better
	- CHANGED: BAF presets in (mostly) line with @3CB baf units as of 11/09/2015

	Changelog 3.2
	- FIXED: Marker locality issue
	- ADDED: UK3CB equipment to the BAF presets

	Changelog 3.1
	- Beta Release
	- FIXED: Last minute copy-paste error in the STB_fnc_AI_patrol function
	- FIXED: Reverted STB_fnc_ancillary_AddNoise2D to an old version that was more solid.
	- ADDED: ACE3 Support 

[ALPHA (version 2.X.X)] 

	Changlog 2.8.9	
	- ADDED: RestrictHE and RemoveHE options to gear params for limiting the amount of he available (useful for TvT)
	- FIXED: JIP players' markers properly syncing in MP
	- FIXED: Overfilled AR and MMG backpacks
	- CHANGED: Several values in loadouts

	Changelog 2.8.8
	- UPDATED: BAF preset uses @3CB weapons
	- ADDED: Several new gear presets
	- FIXED: Updated MMG and DMR magazines in line with classname changes brought in by Marksman DLC.
	- REPLACED: Patrol script replaced with a new better one

	Changelog 2.8.7
	- FIXED: Cargo script not correctly detecting passed side and defaulting to blufor gear
	- FIXED: Weird teleport problem with BIS_fnc_findSafePos (all AI spawn scripts should work more reliably now)
		-	In future will re-add findSafePos with new params to make it safer - for now pos is not checked for saftey
		-	Possible vehicles spawning in buildings currently (no protection against it)
	- FIXED: AI on SAD orders would start in combat mode and so take forever to get to their target.
		- now they start "aware" and move much more quickly
	- FIXED: AI Helos were spawning in too high
	- ADDED: "Move" order for spawned AI where they move to a position then patrol (in future will allow the option to garrison too)

	Changelog 2.8.6
	- FIXED: Removed nato / aaf / csat units from fia_b / fia_i / fia_o factions
	- CHANGED: Trrop structure briefing tab now looks for first 3 letters of STB_Description to allow for group names
		such as 1-1, 1-2 etc.

	Changelog 2.8.5
	- FIXED: BAF gear mostly in alignment with @3CB_BAF (including items in "extras" preset)
	- ADDED: "lsw" light support weapon in definition of gear and "lsw" class for loadouts
	- ADDED: purple and blue 40mm smoke grenades, democharge to gear preset
	- ADDED: RKSL LDS Sight for BAF Presets
	- CHANGED: Section Leaders now get large radio backpack.
	- CHANGED: Split addMagazine and addItemCargo for general items and spare optics to prevent over filling backpacks.
	- CHANGED: Consolidated backpack functions so we only require one.
	- CHANGED: Removed now redundant gear vars from preset scripts (_extras,_stb_param_xxx)
	- CHANGED: All other gear presets now in line with the above structural changes
	- CHANGED: Default TFAR freqs are now:
		- SR: ["31","31.1","31.2","31.3","32","32.1","32.2","32.3"]; 
		- LR: ["31","32","33","40","50","60","70","80"]; 	

	Changelog 2.8.4
	- FIXED: Issues with occasional unassigned gear at mission start 
		- gear now spawns only when mission	has started and players are in-game.
	- ADDED: "NoAI" option to allow users to completely disable the AI functions and definitions.
		-	possibly freeing some memory (disables all AI related functions).
	- ADDED: Place for custom "onplayerrespawn" code "STB\STB_client\STB_onPlayerRespawn_extra.sqf"
		- in a separate script so the core STB respawn script does not have to be edited.
	- FIXED: Some of the weapon classnames were ones with in-built optics. These have been replaced.

	Changelog 2.8.3
	- FIXED: JIP/Respawn group and special markers should now be synced across all clients.

	Changelog 2.8.2 (dedicated server and hc test)
	- FIXED: locality issues with cargo functions 
	- FIXED: locality issue with resupply functions
	- FIXED: HC logic is working correctly
	- FIXED: logic error with checkServerStatus causing it to fail when hc connected

	Changelog 2.8.1
	-	ADDED: gear and uniform presets for FIA factions (uniforms come in _i, _b and _o varieties)
	-	ADDED: "lg" long gunner class for loadouts
	-	ADDED: mod dependencies to comments in preset files
	-	ADDED: readme update
	-	ADDED: TFAR options in settings file
	- 	ADDED: "coy" loadout class for company commanders (officers caps etc) with special uniform assignment
		-	coy uniform is now one of the special extra uniforms like sniper and diver in the uniform presets
	-	ADDED: "fac" loadout class
	-	ADDED: new stb_gear_param for "no optics" - if set to true no optics will be given to any class
		except for snipers and long-gunners

	Changelog 2.8
	-	ADDED: Resupply functionality.
		-	Objects/Vehicles with the variable "STB_Resupply" defined become resupply points.
		-	Option to allow a limited or unlimited number of resupplies.
		-	All vehicles and units with "STB_Loadout" or "STB_Cargo" variables defined can use this action.
		- 	Action re-runs the gear assignment script giving the unit exactly the gear he was given at the start
		-	If unit calls the action from within a vehicle, the vehicle will get the rearm, based in the 
			"STB_Cargo" variable it was assigned.
		- 	I will extend this to repairing at some point.
	-	CHANGED: Troop structure function now adds line breaks if first two letters are different, preventing e.g.
		HSAM, Hotel, HMG etc all appearing in the same group on the briefing screen.
	-	ADDED: some functions to convert loadout class variables like "co" and "ftl" to plain text strings for debug
		and messages.
	-	CHANGED: Spiffed up the server check script to make the output nicer to read.
	-	CHANGED: Renamed some of the cargo vehicle classes to not have the "v_" prefix. Was a relic of f3, no longer 
		required.

	Changelog 2.7
	-	CHANGED: Headless Client handling is done differently. The framework will search for a named HC, then define
		a variable that identifies the HC. If the HC is not found, that variable will instead identify the server.
		Thus this single variable (STB_isAIController) can be used in place of the cumbersome nested if statements 
		that were used previously (that required you to write all your code out twice). 
		The HC name that will be searched for is defined along with other STB settings, and the HC object in the editor
		must be given this name in the editor for it to be detected. The default is "STB_HC".
	-	CHANGED: STB_mission_init's locality blocks are now using the new HC variable.
	-	MOVED: All user settings that were housed in the STB_init.sqf have been moved to their own file so users dont
		have to see the code they're not supposed to edit.
	- 	ADDED: several more systemchat based debug messages showing spanwed AI, marker cleanup, AI cleanup, loadout and
		cargo assignment etc.
	-	ADDED: ALL vanilla factions are defined and can be spawned with the spawn scripts
	-	ADDED: RHS Russian units are also included as a new faction.
	-	ADDED: Much more comprehensive instructions in readme.
	-	ADDED: Check Server Status Debug Action
		-	Allows players (when STB_DebugEnabled = true) to check the number of AI deployed on the server and HC
	-	ADDED: Respawn System Upgrade - Choice between the STB internal system, BIS ticket system or to disable.
	

	Changelog 2.6.1
	-	ADDED: New server side debug function to monitor all the markers that are being generated by the spawning scripts
		-	All markers created by the spawning script will be deleted after a set time (STB_MarkerCleanupTime)
		-	This is to prevent mission bloat for longer missions
		ADDED: Functions to protect certain markers from this cleanup (if you know you wat to use them again later) 
			and unprotect them accordingly
		MOVED:	STB_fnc_AI_monitorGroups is now STB_fnc_debug_monitorGroups, and it is held in STB_functions_debug.sqf
		ADDED: 	Debug text to several functions using system chat
		-	Eventually all functions will report what they are doing through system chat if the STB debug is enabled
		FIXED: 	AI groups with AI mode set to "none" were not being marked by the debug scripts. They are now.
		CHANGED: Garrison script now looks for buildings at the immediate vicinity of the group leader instead of moving
			him to his nearest building first.
		-	Less usage of nearestBuilding means fewer occurences of the random center of map teleport bug in the arma engine
		

	Changelog 2.6
	-	ADDED: New higher level scripts for populating area and creating an attack
		-	STB_fnc_AI_populateArea for populating a town defensively
		-	STB_fnc_AI_attack for generating an attack on a specific point from a specifiable
			direction or range of directions
		- 	both can utilise infantry, vehicle and air assets
		ADDED:	Garrison Scripts now detect if there are multiple units in the same place and attempt 
			to find a new position for them. If they cannot find a new position after a few tries, the unit is deleted
		ADDED:	New option in ai spawning for random class and type
		CHANGED: AI spawn script to allow for per-group randomisation.
		ADDED: Special cases for air units to ensure they fly correctly


	Changelog 2.5.5
	-	CHANGED: Overhauled AI spawning scripts to be able to call on specific units and groups.
			-	eniterly restructured the AI functions,
			- 	users able to specify pre-configured groups to spawn in
			-	consolidated vehicle and infantry spawning into one script
			-	intuitive strings instead of numbers used to select groups
			-	removed higher-level functions pending re-build for next update
	-	CHANGED: Medical Items are defined in a separate preset to allow for mod changes in future
	-	FIXED: Some meds not appearing because of a full backpack
			-	Basic Meds are assigned immediately after uniforms to ensure they are received
			-	Advanced meds are now inside the medic's backpacks.
	
	Changelog 2.5.4
	- 	ADDED: East v.s. West Unit References
	- 	ADDED: CSAT, NATO, AAF Specific Group references
	- 	CHANGED: Tidied STB_Init.sqf formatting.
	- 	REPLACED: Garrison script with a modified version of ZenOccupyHouse by zenophon.
	- 	ADDED: function to find all towns in radius from defined center 
	-	FIXED: Correct radios for each side are now given.
	- 	CHANGED: Rifleman getting AT is an optional parameter like the silencers and nvgs) 
	
	Changelog 2.5.3
	- 	CHANGED: Silencer and NVG paramters have been brought out to STB_init.sqf so users do not have to have
		separate presets for with/without silencers/nvgs.
		-	New STB_GearParams_West/East/Resistance arrays to be defined in STB_init.sqf
	-	FIXED: Robert-hammer loadout was giving errors since gear got restructured in 2.5.1 
	-	ADDED: Automatic HC detection and support
	- 	ADDED: Structure to STB_mission_init to allow users to control locality intuitively
	-	ADDED: Ammo crates will now accept "STB_Cargo" Variable and be loaded accordingly
	-	RENAMED: STB_vehicle_cargo.sqf is now called STB_cargo.sqf
	-	CHANGED: IR strobes are now tied to the loadout params for each side, not a global setting
	- 	CHANGED: Moved all of the AI unit definitions to another file for independant editing
	-	RENAMED: STB function scripts now contain the word _functions_ in their filename

	Changelog 2.5.2
	-	CHANGED: Another large restructure to eliminate the need for side-specific gear scripts
		-	REMOVED: STB_loadouts_west/east/resistance
		-	ADDED:	STB_Loadouts.sqf
	-	CHANGED: Fixed up crate script to work for vehicles with setVariable "STB_Cargo"
		-	(FIXED) KNOWN ISSUE: Does not currently work for crates (FIXED)
	-	CHANGED: STB_loadouts_init now deals with cargo as well as player gear
	-	FIXED:	undefined "_scope_lr" variable
	-	ADDED:	STB_MaxAI option. If non-playable AI exceed this limit, spawn scripts will no longer produce more.

	Changelog v2.5.1
	-	CHANGED: Large restructure of gear system to avoid #include lines and avoid users having to edit mutiple files
		-	use of parser code removed (#include)
		-	users can now set their gear preset in STB_init.sqf
	-	ADDED: Option to select uniform preset = "none" to use editor units' default uniforms
	-	FIXED: AT4 for rifleman was being assigned before rockets, so started unloaded.

	Changelog v2.5
	-	JIP and Respawn Complete
		
	Changelog v2.3.4 
	-	ADDED: Respawn Functionality. Handles Gear (complete) and map markers (WIP)
		- Uses lives system along with a quick and dirty forced spectator mode.
	-	KNOWN ISSUE: Special Markers are not reassigned - they need to be removed from dead bodies first. 
		- will be fixed soon. 
	-	CHANGED: STB_Loadouts_init restructured to deal with JIP players
	- 	ADDED: code to allow JIP players time to properly connect before client scripts run again.
	-	ADDED: Massi's Governmentives (indfor) to AI scripts

	Changelog v2.3.3
	-	FIXED: Automatic Assignation of Backpack Radios (no longer does this)
	
	Changelog v2.3.2 
	-	FIXED: local variable in global space error
	-	CHANGED: gear scripts to follow the same convention as the intel scripts
				-	You now set a variable (STB_Loadout) rather than call a script from the unit init
	- 	ADDED: New line in STB_client.sqf to call the loadout scripts always (and look for setVariables)
	-	CHANGED: folder structure in presets folder - too many layers deep, got rid of blue/red/green distinctions
				-	Presets are side agnostic, you could choose to have rh weapons on csat dudes or w/e
	-	ADDED: New Loadout Presets
			- British Armed Forces (Royal Marines)

	Changelog v2.3.1
	-	CHANGED: Gear scripts to allow for presets to be selected easily.
	-	FIXED: 	Fixed #include line - references files in current folder, or directories contained within that folder.
				Had to remove the first bits of the directory, because the path automatically recognized that part, and repeating
				it led to the inability to find the proper folder.

	Changelog v2.3
	- 	RENAMED: "STB_player" to "STB_client" wherever it occurs
	-	ADDED: STB_intel.sqf - new function library.
	-   ADDED: STB_fnc_intel_groupMarkers and STB_fnc_intel_specialMarkers to handle local, updating group
		markers and special unit markers.  See comments for usage. 
	-	MOVED: Troop structure function to new file "STB\STB_functions\STB_intel.sqf".
			- new line in STB_init to compile these functions
			- renamed function to STB_fnc_intel_getTroopStructure

	Changelog v2.2.2
	- 	UPDATED: STB_Radio_init.sqf to allow user to modify parameters in STB_init.sqf for radio encryptions.
				- This comes with a new user-variable in STB_init.sqf
	- 	FIXED:	Radio settings were still set to the Dim-Transactions, mission-specific settings. Changed to a 
				more appropriate default setting.
	
	Changelog v2.2.1
	-	ADDED: STB_init.sqf now checks for and defines a variable containing the server admin (STB_ServerAdmin)
	-	ADDED: Ancillary function for generating an ST-style troop structure in the briefing. See comments for details
		(bottom of ATB_ancillary.sqf).

	Changelog v02.2
	-	REPLACED: Backpacks - no longer depends on STKR_BI (mod isn't approved, can be tweaked again later)
	-	REPLACED: References to Trixie Weapon Pack (until added to approved mods)
				- M249 for _ar
				- M240 for _mmg
	-	FIXED: MAT Loadout (tweaked backpack)
				- Replaced with _bag_large
	-	ADDED: DMR Loadout
	-	ADDED: TFAR Radio Compatibility (assigns radios depending on unit type)
				- Right before loadout cases are assigned
	-	ADDED: TFAR Radio Frequencies
				- New folder > STB\STB_Radio
				- added call in STB_init.sqf
	-	ADDED: Params section in STB_loadouts_west.sqf
				-	ADDED: STB_Param_Silencer Options
				-	ADDED: STB_Param_NVG Option
	- 	ADDED: Uniform Assignation Scripts
				- Randomly assigns uniforms depending on unit type and array.
				- Added _unit setCombatMode "safe" to prevent misfires on spawn.

	Changelog v02.1.1 (minor fixes and inclusion)
	-	FIXED: STB S&D Error - 0 Provided, 3 Expected
	-	ADDED: CSAT and AAF Gear Scripts
	-	REPLACED: Original instructions for gear script to include "nul =" to prevent confusion during use.
	
	
	Changelog v02.1 (bug-squash)
	-	FIXED: Undefined variables for sniper.
	-	FIXED: Undefined variables for HMG.
	-	FIXED: Undefined variables for Eng/Engm.
	-	FIXED: Spotter gets regular rifle instead of GL and gets rangefinder
	- 	FIXED: More SMG mags for vehicle drivers and crew
	-	REPLACED: "lmg" with "ar" in gear variable names
	-	FIXED: AR gets "B_AssaultPack_mcamo"
	-	FIXED: Medic gets only one medpack (note for AGM medipacks are converted into blood/epi/morphine -
		I added two so the medic could have double the numbers of these - I was using AGM at the time).

	Changelog v02.0
	- 	New folder structure separating different sorts of scripts
	-	Loadouts system (similar to f3 - see: STB\STB_logistics\STB_logistics_init.sqf and STB_loadouts_west.sqf)
		The new system is called in unit init lines like f3.
		Only bluFor is supported currently
		Uniforms are NOT supported yet
		Option for silencers and NVGs are on a per unit basis in script calling line
	- 	REMOVED: STB_attack and STB_environment as they are currently non-functional.
	- 	FIXED: bug with new "self" patrol feature where script attempts to compare a posArray to a string - was 
		stopping all patrols that didn't use the "self" option. Now checks for typeName "string" before doing string
		comparison.
		

[PRE-ALPHA (dev version 1.X)] 

	Changelog v01.2a
	-	added "STB\STB_player.sqf" and "STB\STB_server.sqf" as places to store the general player and server-side things
		(cleaning up the STB_init.sqf and mimicking Arma's own script structures).
	- 	REMOVED headless client support (you will need to remove the param from description too) . 
		I will re-implement this properly, it was a bit of a rush job.

	Changelog v01.2
	- 	fixed bug where garrisoned units that cant find valid building positions got marked as vehicles instead of 
		infantry.

	Changelog v01.1:
	-	added "self" option to ai patrol scripts for patrolling around the point at which they spawn, instead
		of all patrolling around the same center point
	- 	added AI skill setting to init settings
	-	worked in basic HC support but this is place-holder for now

	Changelog v01:
	-	added Massi's african units to available opfor factions.
	- 	added STB_StaticWeapons array for mortars, static MG and AT/AA units.
	-	added SAD functionality to spawned AI and a new higher-level functions for generating a 360 degree ambush.
	-	various improvements and refinements.
	- 	more thorough commenting
	- 	removed some unfinished / unnecessary functions
	-	added this readme document
	

