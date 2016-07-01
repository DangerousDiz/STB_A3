DDZ_fnc_PlayerHunter = {
	_playerInAO = []; 
	_targetPos = [];
	_validTarg = {
		if(_x in (list (_this))) then {
			_playerInAO pushBack _x;
			true;
		}else{
			false;
		};
	} count playableUnits;
	if(_validTarg > 0) then {
		_targetPlayer = (_playerInAO select(floor random (count _playerInAO)));
		hint str _targetPlayer;
		if(((getPosATL _targetPlayer)select 2) < 3) then {
			_targetPos = getPos _targetPlayer;
			hint str _targetPlayer;
		};
	};
	_targetPos
};

DDZ_fnc_STB_spawnWaveLogistics = {
	/*
		Function for Spawning a single reinforcement vehicle with appropriate troops in cargo.
		Requires STB_FrameWork (SubVersion 3.3DDZ) 
		Requires STB_Init
		Requires DDZ_fnc_PlayerHunter
		Author: DangerousDiz for the STB Framework by Dom.STB and Howl	
		params eg: [(allIslaBluTrigs select 0),SeaSpawn1,landingPoints1,"O_G_Boat_Transport_01_F",9,"allSpawn",[2]] spawn DDZ_fnc_STB_spawnWaveLogistics;
	*/
	_WaveAdj = 20;
	_activatedTrigger = _this select 0; //The trigger that is used to gather the list of players to target
	_spawnMkrs = _this select 1; //An array of Spawn Position Marker names
	_dropOffMkrs = _this select 2; //An Array of Dropoff Positions (same number as spawnMkr [Required])
	_vehicleClass = _this select 3; //Vehicle Classname (Must of the same SIDE as reinforcement troops (but not required to be the same faction))
	_reinfSideID = _this select 4; //STB ID of the faction to use for the Troops
	_reinfSpawnMkr = _this select 5; //Marker name of a safe position to initially spawn the troops (placed out of player view)
	//Optional Params
	_optional = if ((count _this) > 4) then {_this select 6} else {[]}; //[0: isLand 1: isAir 2: isSea, NA] default: empty array
	if((triggerActivated _activatedTrigger) && ({side _x != west}count allUnits < (STB_maxAI - _WaveAdj))) then {
		//Send sea wave to Island 1
		
		if(!(({!(_x in playableUnits)} count allUnits) < (STB_MaxAI - _WaveAdj))) exitWith {};
		sleep 30;
		_mkrIndex = (floor random (count _spawnMkrs));
		_vehTrans = createVehicle [_vehicleClass, (getMarkerPos (_spawnMkrs select _mkrIndex)),[] , 0, "NONE"];
		createVehicleCrew _vehTrans;
		sleep 1;
		_vehDriver = (driver _vehTrans);
		_reinfGroups1 = [_reinfSideID,"infantry","fireteam",[_reinfSpawnMkr],100,"none",[]] call STB_fnc_AI_spawnAI;
		
		_reinfGroups = _reinfGroups1;
		{
			_reinfGroup = _x;
			{_x assignAsCargo _vehTrans; _x moveInCargo _vehTrans; } forEach (units _reinfGroup);

			_infwp0 = _reinfGroup addWaypoint [_vehTrans, 0];
			_infwp0 setWaypointType "GETIN";
			(units _reinfGroup) orderGetIn true;
			[(units _reinfGroup),90] call DDZ_STB_fnc_AI_forceFlashlights;
		} forEach _reinfGroups;
		_vehSite = (_dropOffMkrs select _mkrIndex);
		_wp1 = (group _vehDriver) addWaypoint [(getMarkerPos _vehSite), 5];
		_wp1 setWaypointType "MOVE";
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointBehaviour "CARELESS";

		// activate first move for pilot incase something stops 1st wp to be executed somehow
		
		_vehDriver doMove (getWPPos _wp1);

		sleep 1;

		waitUntil 
		{
			(!alive _vehTrans) || (!alive (driver _vehTrans)) || ((_vehTrans distance (getMarkerPos _vehSite) < 150) && (speed _vehTrans < 2))
		};

		hint "vehicle arrived - infantry dismounting";
		
		sleep 2;
		{
			_reinfGroup = _x;
			if(({alive _x}count (units _reinfGroup)) == 0) exitWith {
				hint "Everybodies Dead Dave";
			};
			{
				[_x] orderGetIn false;
			} forEach (units _reinfGroup);
		
			{
				_x action ["Eject", vehicle _x];
			} forEach (units _reinfGroup);

			{
				unassignVehicle _x;
			} forEach (units _reinfGroup);
			
			_playerTarget = _activatedTrigger call DDZ_fnc_PlayerHunter;
			if((count _playerTarget) == 3 ) then {
				if(_playerTarget distance (leader _reinfGroup) < 1000) then {
					[_reinfGroup,[_playerTarget, 50,['delete300s','']]] spawn STB_fnc_AI_sad;
				}else {
					[_reinfGroup,['self', 250]] spawn STB_fnc_AI_patrol;
				};
			} else {
				[_reinfGroup,['self', 250]] spawn STB_fnc_AI_patrol;
			};
			
		} forEach _reinfGroups;
		
		_wp2 = (group _vehDriver) addWaypoint [(getMarkerPos (_spawnMkrs select _mkrIndex)), 50];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointSpeed "FULL";
		_wp2 setWaypointBehaviour "CARELESS";
		_wp2 setWaypointStatements ["true","deleteVehicle (vehicle this); deleteVehicle this;"];
	
	};
};
/*
	Dead Civilian Counter by Shuko
	Edited by DangerousDiz
	params: [Max limit of dead civilians (number),function to call when max limit reached {code} / global function ]
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
				if((primaryWeapon (_this select 0)) == "") then {
					SHK_DeadCivilianCount = SHK_DeadCivilianCount + 1;
					publicvariable "SHK_DeadCivilianCount";
					"CivilianKIAMkr" setMarkerText (format["Civilians KIA: %1",SHK_DeadCivilianCount]);
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
/*
	Modification of the STB force AI gunlights fnc
	Usage [] call DDZ_STB_fnc_AI_forceFlashlights;
	Optional params [[array of units],%ofUnits]
*/
DDZ_STB_fnc_AI_forceFlashlights =
{
	_unitsToForce = if(count _this < 1) then {allUnits}else{_this select 0};
	_pcToForce = if(count _this < 2 ) then {100}else{_this select 1};
	{
		private "_unit";
		_unit = _x;		
		if((floor random 100) < _pcToForce) then {
			if (side _unit != WEST) then {
				_nvgs = if (side _x == EAST) then {"NVGoggles_OPFOR"} else {"NVGoggles_INDEP"};
				_unit unassignItem _nvgs;
				_unit removeItem _nvgs;
				//_unit removeWeapon "Binocular";
				_unit unassignItem "acc_pointer_IR";
				_unit removePrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "acc_flashlight";
				_unit assignItem "acc_flashlight";
				if (((getPos _x) select 2) < 10) then {_unit setBehaviour "SAFE"};
				_unit enableGunLights "ForceOn";
			};
		};
	} foreach _unitsToForce;
	true;
};