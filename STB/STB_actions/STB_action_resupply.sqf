// action for re-arm point

_target = _this select 0;
_caller = _this select 1;
_params = if (count _this <= 3) then {[]} else {_this select 3};

// get remaining resupplies
_remaining = _target getVariable "STB_ResuppliesLeft";

// is caller in vehicle?
_isVehicle = if (vehicle _caller != _caller) then {true} else {false};

if (_isVehicle) then {
	
	// get vehicle
	_vic = vehicle _caller;
	// do vehicle cargo things
	_params = _vic getVariable "STB_Cargo";
	_class = _params select 0;
	_side = _params select 1;
	
	// if there are still remaining resupply tickets
	if (_remaining != 0) then {

		// call cargo script
		[_vic, _class, _side] execVM "STB\STB_logistics\STB_cargo.sqf";
		
		// refill fuel and ammo
		_vic setFuel 1;
		_vic setVehicleAmmo 1;
		hint parseText format ["Rearming Vehicle...<br/><br/>Cargo class<br/><t color='#ffff00'>%1</t>", _class call STB_fnc_intel_getCargoClass];
		
		// add the variable to lock the unit out from using the resupply again for a minute
		_vic setVariable ["STB_Resupply_Cooldown", true, true];
		
		// remove this variable after the cooldown period
		_vic spawn {sleep 60; _this setVariable ["STB_Resupply_Cooldown", nil, true];};
		
		// decrement remaining resupplies if they are not already unlimited
		if (_remaining > 0) then {  
			_target setVariable ["STB_ResuppliesLeft", (_remaining - 1), true];
			systemChat format ["Resupplies remaining at this supply point: %1",(_remaining - 1)];
		};
		
	};
	
} else {

	// do player loadout things
	_class = _caller getVariable "STB_Loadout";
	_side = side _caller;
	// if there are still remaining resupply tickets
	if (_remaining != 0) then {

		// call loadout script
		[_caller, _class, _side] execVM "STB\STB_logistics\STB_loadouts.sqf";
		hint parseText format ["Rearming...<br/><br/>Loadout class:<br/><t color='#ffff00'>%1</t>", _class call STB_fnc_intel_getLoadoutClass];	

		// add the variable to lock the unit out from using the resupply again for a minute
		_caller setVariable ["STB_Resupply_Cooldown", true, true];
		
		// remove this variable after the cooldown period
		_caller spawn {sleep 60; _this setVariable ["STB_Resupply_Cooldown", nil, true];};		
		
		// decrement remaining resupplies if they are not already unlimited
		if (_remaining > 0) then {  
			_target setVariable ["STB_ResuppliesLeft", (_remaining - 1), true];
			systemChat format ["Resupplies remaining at this supply point: %1",(_remaining - 1)];
		};
		
	};
	
};