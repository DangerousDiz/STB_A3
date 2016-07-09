/*
	STB_Extensions: 
		DDZ_Extensions.sqf
		Author: DangerousDiz
		Credit: Clyde [3CB] + Shuko
		STB_fnc_AI_forceFlashlights
		STB_fnc_ancillary_findPlayer
		STB_action_exitIntoChute
		STB_fnc_AI_sad_logistics
		STB_fnc_Intel_DeadCivilianCounter
*/
/*--------------------------------------------------------------------------
----------------------------------------------------------------------------*/
/*
	Overwrite: STB_fnc_AI_forceFlashlights
	Usage: [Array: units to force [Optional], Number: % of units in array[Optional]] call STB_fnc_AI_forceFlashlights
	Default: Runs on all units using allUnits array.
*/
DDZ_fnc_AI_forceFlashlights =
{
	_unitsToForce = if(count _this < 1) then {allUnits}else{_this select 0};
	_pcToForce = if(count _this < 2 ) then {100}else{_this select 1};
	_nightime = if ((date select 3) < 6 or (date select 3) > 19) then {true} else {false}; 
	if(!_nightime) exitWith {
		if(STB_DebugEnabled) then {
			systemchat "DDZ_fnc_AI_forceFlashlights: Flashlights not required...";
		};
	};
	{
		private "_unit";
		_unit = _x;		
		if((floor random 100) < _pcToForce) then {
			if ((side _unit != WEST) && (primaryWeapon _unit != "")) then {
				_nvgs = if (side _x == EAST) then {"NVGoggles_OPFOR"} else {"NVGoggles_INDEP"};
				_unit unassignItem _nvgs;
				_unit removeItem _nvgs;
				if( (vehicle _unit != _unit) && (_unit == (driver vehicle _unit)) ) then {
					//_unit addItem _nvgs;
					//_unit assignItem _nvgs;
					(vehicle _unit) setPilotlight true;
				};
				//_unit removeWeapon "Binocular";
				_unit unassignItem "acc_pointer_IR";
				_unit removePrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "acc_flashlight";
				if (((getPos _x) select 2) < 10) then {_unit setBehaviour "SAFE"};
				if("acc_flashlight" in (primaryWeaponItems _unit) ) then {_unit enableGunLights "ForceOn"};
			};
		};
	} foreach _unitsToForce;
	true;
};
STB_fnc_AI_forceFlashlights = DDZ_fnc_AI_forceFlashlights;

/*
	Addition: STB_fnc_ancillary_findPlayer
	Descrition: Find a random player inside a trigger area and return their positionATL, if that player is in a vehicle or there are no players returns empty array.
	Usage: (Trigger/Marker: Area in which to look for players [Optional]) call DDZ_fnc_ancillary_findPlayer;
	Default: Finds a random player from the playableUnits array
*/
DDZ_fnc_ancillary_findPlayer = {
	_playerInAO = []; 
	_targetPos = [];
	_validTarg = if(!isNull _this) then {
		{
			if(_x inArea _this) then {
				_playerInAO pushBack _x;
				true;
			}else{
				false;
			};
		} count playableUnits;
	} else {
		_playerInAO = playableUnits;
		count playableUnits
	};
	
	if(_validTarg > 0) then {
		_targetPlayer = (_playerInAO select(floor random (count _playerInAO)));
		hint str _targetPlayer;
		if(vehicle _targetPlayer == _targetPlayer ) then {
			_targetPos = getPosATL _targetPlayer;
			hint format ["Found Player %1 at %2",_targetPlayer,_targetPos];
		};
	};
	_targetPos
};
STB_fnc_ancillary_findPlayer = DDZ_fnc_ancillary_findPlayer;
/*
	Addition: DDZ_action_exitIntoChute
	Descrition: Force a unit out of a vehicle and if that results them being >10m up open a parachute.
	Usage: (Unit: AI or Player) call DDZ_action_exitIntoChute;
	Default: N/A
	Requires: @CBA_A3
*/
DDZ_action_exitIntoChute = {
	_JumpingUnit = _this;
	_vehTrans = vehicle _JumpingUnit;
	if(_vehTrans != _JumpingUnit ) then {
		_JumpingUnit action ["Eject", _vehTrans];
		[_JumpingUnit] orderGetIn false;
		unassignVehicle _JumpingUnit;
		moveout _JumpingUnit;
	};
	sleep 3;
	if(((getPosATL _JumpingUnit) select 2) > 3) then {
		_chute = createVehicle ['Steerable_Parachute_F', position _JumpingUnit, [], 0, 'FLY']; 
		_chute disableCollisionWith _vehTrans;
		_chute setPos position _JumpingUnit;
		_JumpingUnit moveIndriver _chute;
	
	
	
	};
	true;

};
STB_action_exitIntoChute = DDZ_action_exitIntoChute;
/*
		Addition: STB_fnc_AI_sad_logistics
		Description: Spawn a single reinforcement vehicle with appropriate troops in cargo.
		Usage: [
			Trigger: Activating BLUFOR trigger, 
			Array: Marker names to spawn Transport vehicle,
			Array: Marker names to which to deliver troops,
			Classname: Vehicle to use as transport [Supports:- CARS, TRUCKS, HELICOPTERS],
			Number: STB Faction ID or troops,
			Marker: Safe location to temporarily spawn troops,
			Array: Troop Options - 4 Elements 
			[
				String: STB group size,
				Number: additional groups,
				String: Additional STB group size,
				Bool: Force Flashlights
			]
		] spawn DDZ_fnc_AI_sad_logistics;
		Example: [myTrigger, ["vehSpawn_1","vehSpawn_2"], ["vehDrop_1","vehDrop_2"], "O_G_Boat_Transport_01_F", 5, "allSpawn", ["fireteam",0,"fireteam",true]] spawn STB_fnc_AI_sad_logistics;
		Notes: 
			Spawn Marker array should be the same size as dropoff marker array.
			If you spawn more troops than can fit in the vehicle they will just get left behind but still recieve sad waypoint when the vehicle unloads.
		Requires: DDZ_fnc_ancillary_findPlayer + DDZ_fnc_AI_forceFlashlights + DDZ_action_exitIntoChute (For Helicopters)
		Credit:	Uses parts of the vehicle reinforcment code originally by clyde [3CB]
		TODO: 	Use Vehicles defined by STB, if no vehicle defined check side of troops and use a default vehicle of that type and side.
				Check cargo capacity of vehicle and reduce group sizes to fit.
				Reorganise init array in line with STB_fnc_AI_SpawnAI
		
	*/
DDZ_fnc_AI_sad_logistics = {
	
	_WaveAdj = 20;
	_activatedTrigger = _this select 0; //The trigger that is used to gather the list of players to target
	_spawnMkrs = _this select 1; //An array of Spawn Position Marker names
	_dropOffMkrs = _this select 2; //An Array of Dropoff Positions (same number as spawnMkr [Required])
	_vehicleClass = _this select 3; //Vehicle Classname (Must of the same SIDE as reinforcement troops (but not required to be the same faction))
	_reinfSideID = _this select 4; //STB ID of the faction to use for the Troops
	_reinfSpawnMkr = _this select 5; //Marker name of a safe position to initially spawn the troops (placed out of player view)
	//Optional Params
	_refGroupArray = if ((count _this) > 4) then {_this select 6} else {["fireteam"]}; //[STB type "STRING" ("section", "fireteam", "weapons", "at", "aa", "sentry", "sniper", "mortar"), number of additional groups, additional groups STB type "STRING", forceFalshlights bool]
		_mainGroupType = (_refGroupArray select 0);
		_extraGroups = if ((count _refGroupArray) > 1) then {_refGroupArray select 1} else {0};
		_extraGroupType = if ((count _refGroupArray) > 2) then {_refGroupArray select 2} else {""};
		_forceFlashlights = if ((count _refGroupArray) > 3) then {_refGroupArray select 3} else {false};
							
							
							
							
							
	if((triggerActivated _activatedTrigger) && ({side _x != west}count allUnits < (STB_MaxAI - _WaveAdj))) then {
		
		if(!(({!(_x in playableUnits)} count allUnits) < (STB_MaxAI - _WaveAdj))) exitWith {};
		sleep 30;
		_mkrIndex = (floor random (count _spawnMkrs));
		_vehTrans = objNull;
		if(_vehicleClass isKindOf "Helicopter") then {
			_vehTrans = createVehicle [_vehicleClass, [(getMarkerPos (_spawnMkrs select _mkrIndex))select 0, (getMarkerPos (_spawnMkrs select _mkrIndex))select 1, 300],[] , 0, "FLY"];
			//(units (group _vehTrans)) spawn DDZ_fnc_AI_forceFlashlights;
			
		}else{
			_vehTrans = createVehicle [_vehicleClass, (getMarkerPos (_spawnMkrs select _mkrIndex)),[] , 0, "NONE"];
		};
		createVehicleCrew _vehTrans;
		sleep 1;
		_vehDriver = (driver _vehTrans);
		_reinfGroups = [];
		while {(count _reinfGroups) < (_extraGroups + 1)} do {
			
			_newRefGroup = [_reinfSideID,"infantry",_mainGroupType,[_reinfSpawnMkr],100,"none",[]] call STB_fnc_AI_spawnAI;
			_reinfGroups pushback (_newRefGroup select 0);
			hint (str _reinfGroups);
		};
		sleep 0.5;
		{
			
			_thisGroup = _x;
			if(_forceFlashlights) then {
				[(units _thisGroup),90] spawn DDZ_fnc_AI_forceFlashlights;
			};
			{_x assignAsCargo _vehTrans; _x moveInCargo _vehTrans; } forEach (units _thisGroup);

			_infwp0 = _thisGroup addWaypoint [_vehTrans, 0];
			_infwp0 setWaypointType "GETIN";
			(units _thisGroup) orderGetIn true;
			
		} forEach _reinfGroups;
		if(!(_vehTrans isKindOf "Helicopter")) then {
		
			_vehSite = (_dropOffMkrs select _mkrIndex);
			hint (str _vehSite);
			_wp1 = (group _vehDriver) addWaypoint [(getMarkerPos _vehSite), 1];
			_wp1 setWaypointType "MOVE";
			_wp1 setWaypointSpeed "FULL";
			_wp1 setWaypointBehaviour "AWARE";
			_wp1 setWaypointStatements ["true", "" ];
			// activate first move for pilot incase something stops 1st wp to be executed somehow
			
			_vehDriver doMove (getWPPos _wp1);
			(group _vehDriver) setCurrentWaypoint _wp1;
			//_vehDriver disableAI "TARGET";
			_vehDriver disableAI "AUTOTARGET";

			sleep 1;
			
			waitUntil 
			{
				(!alive _vehTrans) || (!alive (driver _vehTrans)) || ((_vehTrans distance (getMarkerPos _vehSite) < 150) && (speed _vehTrans < 1))
			};
			hint "Vehicle infantry dismounting";
		}else{
			_vehSite = (_dropOffMkrs select _mkrIndex);
			hint (str _vehSite);
			_wp1 = (group _vehDriver) addWaypoint [(getMarkerPos _vehSite), 1];
			_wp1 setWaypointType "MOVE";
			_wp1 setWaypointSpeed "NORMAL";
			_wp1 setWaypointBehaviour "SAFE";
			_wp1 setWaypointStatements ["true", "" ];
			

			// activate first move for pilot incase something stops 1st wp to be executed somehow
			_vehDriver doMove (getWPPos _wp1);
			(group _vehDriver) setCurrentWaypoint _wp1;
			//_vehDriver disableAI "TARGET";
			_vehDriver disableAI "AUTOTARGET";
			_vehTrans flyInHeight (300 + (((floor random 6) - 3) * 10));
			sleep 1;
			
			waitUntil 
			{
				(!alive _vehTrans) || (!alive (driver _vehTrans)) || (_vehTrans distance (getMarkerPos _vehSite) < 500)
			};
			hint "heli infantry dismounting";
		};
		
		
		sleep 0.2;
		{
			
			_thisGroup = _x;
			if(({alive _x}count (units _thisGroup)) == 0) exitWith {
				if(STB_DebugEnabled) then {
					systemchat format["[STB_fnc_AI_sad_logistics: EXIT at %1] : Everybodies Dead Dave!",time];
				};
			};
			
			doStop _vehDriver;	
				//Run parajump script
			{
				_x spawn DDZ_action_exitIntoChute;
				sleep 3;
			
			} forEach (units _thisGroup);
			_playerTarget = _activatedTrigger call DDZ_fnc_ancillary_findPlayer;
			if((count _playerTarget) == 3 ) then {
				if(_playerTarget distance (leader _thisGroup) < 1000) then {
					[_thisGroup,[_playerTarget, 50,['patrol250','self']]] spawn STB_fnc_AI_sad;
				}else {
					[_thisGroup,['self', 250]] spawn STB_fnc_AI_patrol;
				};
			} else {
				[_thisGroup,['self', 250]] spawn STB_fnc_AI_patrol;
			};
			
			sleep 5;
		} forEach _reinfGroups;
		sleep 10;
		_wp2 = (group _vehDriver) addWaypoint [(getMarkerPos (_spawnMkrs select _mkrIndex)), 50];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointSpeed "FULL";
		_wp2 setWaypointBehaviour "SAFE";
		_wp2 setWaypointStatements ["true","thisList spawn {sleep 120; {if(!(vehicle _x == _x))then { deleteVehicle (vehicle _x); deleteVehicle _x; }else {deleteVehicle _x;}} forEach _this;};"];
		_vehDriver doMove (getWPPos _wp2);
		sleep 5;
		_vehTrans flyInHeight (150 + (((floor random 6) - 3) * 10));
	};
};
STB_fnc_AI_sad_logistics = DDZ_fnc_AI_sad_logistics;

/*
	Addition: STB_fnc_Intel_DeadCivilianCounter
	Credit: Dead Civilian Counter by Shuko
		Edited by DangerousDiz
	Description: Looks for a Marker named "CivilianKIAMkr" and sets its text to the current number of dead civilians.
		Does not count civilians killed by non west units.
	Usage: [Number: Max limit of dead civilians,Code: called when max limit reached] call STB_fnc_Intel_DeadCivilianCounter
*/
SHK_DeadCivilianCounter = {
	SHK_DeadCivilianCount = 0;
	SHK_DeadCivilianLimit = _this select 0;
	SHK_fnc_MaxReached = _this select 1;
	SHK_fnc_deadCivilians = {
		
		if (_this >= SHK_DeadCivilianLimit) then {
				[SHK_DeadCivilianLimit ,SHK_DeadCivilianCount] call SHK_fnc_MaxReached;

		};
	};
	[] spawn {
		sleep 120;
		//wait for 2 minutes to make sure all the civilians are spawned in.
		if (isServer) then {
		  {
			if (side _x == civilian && _x iskindof "Man") then {
			  _x addEventHandler ["killed", {
				if(((primaryWeapon (_this select 0)) == "") && (side (_this select 1) == west)) then {
					SHK_DeadCivilianCount = SHK_DeadCivilianCount + 1;
					publicvariable "SHK_DeadCivilianCount";
					if("CivilianKIAMkr" in allMapMarkers) then {
						"CivilianKIAMkr" setMarkerText (format["Civilians KIA: %1",SHK_DeadCivilianCount]);
					};
					if (!isdedicated) then {
					  SHK_DeadCivilianCount call SHK_fnc_deadCivilians;
					  
					};
				};
			  }];
			};
		  } foreach allunits;
		} else {
		  "SHK_DeadCivilianCount" addpublicvariableeventhandler { (_this select 1) call SHK_fnc_deadCivilians };
		};

	};



};
STB_fnc_Intel_DeadCivilianCounter = SHK_DeadCivilianCounter;
/*
	SlingParaDrop Eventhandler
	Allow specific Helicopter sling load to parachute down from height.
	Params: [Helicopter, [Classnames of slingload para drop objs]] call STB_server_addSlingloadParaDrop_EH;
	/-- Special --/
	If the load is a B_supplyCrate_F then a chemlight is attached.
	-isServer Only-
	-Global Effect-
*/
STB_server_addSlingloadParaDrop_EH = {
	if(!isServer) exitWith {};
	_heli = (_this select 0);
	_slingLoad = if((count _this) > 1)then{(_this select 1)} else {["B_supplyCrate_F","B_CargoNet_01_ammo_F","B_Boat_Transport_01_F"]};
	//START EH
	_heli setVariable ["loadTypes", _slingLoad];
	_heli addEventhandler 
	[
		"RopeBreak",
		{
			if ((typeOf (_this select 2)) in ((_this select 0) getVariable "loadTypes") ) then 
			{
				_this spawn 
				{
					sleep (random 1 max 0.1 );
					
					if (isServer) then 
					{
						_heli = (_this select 0);
						_rope = (_this select 1);
						_load = (_this select 2);
						
						waitUntil {_load distance _heli >= 30};

						if ((getPosATL _load select 2) > 10) then 
						{
							_para = createVehicle ['B_Parachute_02_F', [0,0,0], [], 0, 'FLY'];
							_para disableCollisionWith _heli;
							_para setDir (getDir _load);
							_para setPos (getPos _load);
							
							if ( !isNull (attachedTo _load) ) exitWith 
							{
								detach _para;
								deleteVehicle _para;
							};
							_load attachTo [_para,[0,0,0]];
							
							_nightime = if ((date select 3) < 6 or (date select 3) > 19) then {true} else {false}; 
							if(((typeOf _load) == "B_supplyCrate_F") && _nightime) then {
								
								_light = createVehicle ['Chemlight_green', getPosATL _load, [], 0, 'CAN_COLLIDE'];
								_light attachTo [_load,[0.65,0,0]];
							};
							_smokeColor = ["SmokeShellGreen","F_40mm_White"];
							switch (side _heli) do {
								case west : {
									_smokeColor = ['SmokeShellBlue',"F_40mm_White"];
								};
								case east : {
									_smokeColor = ['SmokeShellWhite',"F_40mm_Red"];
								};
								case resistance  : {
									_smokeColor = ['SmokeShellGreen',"F_40mm_White"];
								};
							};
							
							0 = [_load, _para,_smokeColor,_heli] spawn 
							{
								_thisLoad = _this select 0;
								_parachute = _this select 1;
								_smokeColor = ((_this select 2) select 0);
								_flare = ((_this select 2) select 1);
								_heli = _this select 3;
								_nightime = if ((date select 3) < 6 or (date select 3) > 19) then {true} else {false};
								_flare1 = objNull;
								_flare2 = objNull;
								if(_nightime) then {
									_flare1 = createVehicle [_flare, getPosATL _thisLoad, [], 0, 'CAN_COLLIDE'];
									_flare1 attachTo [_thisLoad,[0,0,0]];
								
								};
								waitUntil {getPos _thisLoad select 2 < 50};
								
								_smoke1 = createVehicle [_smokeColor, getPosATL _thisLoad, [], 0, 'CAN_COLLIDE'];
								_smoke1 attachTo [_thisLoad,[0,0,0]];
								_thisLoad allowDamage false;
								waitUntil {getPos _thisLoad select 2 < 4};
								_smoke2 = createVehicle [_smokeColor, getPosATL _thisLoad, [], 0, 'CAN_COLLIDE'];
								_smoke2 attachTo [_thisLoad,[0,0,0]];
								_vel = velocity _thisLoad;
								_thisLoad allowDamage false;
								detach _thisLoad;
								_thisLoad setVelocity _vel;
								detach _parachute;
								_parachute disableCollisionWith _thisLoad;   
								_time = time + 5;
								waitUntil {time > _time};
								detach _smoke1;
								detach _smoke2;
								detach _flare1;
								_thisLoad allowDamage true;
								if (!isNull _parachute) then {deleteVehicle _parachute};
							};
						};
					};
				};
			};
		}
	];
	//END EH
};
/*
	player call DDZ_fnc_JumpMaster;
*/
DDZ_fnc_JumpMaster = {
	_this addAction ["<t color=""#00FF00"">DEPLOY CHUTE", // text
	{
		addCamShake [8, 2, 20];
		_chute = createVehicle ['Steerable_Parachute_F', position player, [], 0, 'FLY'];
		_chute setPos position player;
		player moveIndriver _chute;
		//_chute allowDamage false;
	
	
	}, // script
	[], // params
	50, // priority
	true, // showWindow
	true, // hideOnUse
	"",
	"(((getPos player) select 2) > 30) && ((vehicle player) == player)"];
};	
STB_fnc_action_jumpMaster = DDZ_fnc_JumpMaster;
