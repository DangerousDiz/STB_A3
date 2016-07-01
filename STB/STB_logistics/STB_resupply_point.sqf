// turn objects and vehicles into resupply points

_object = _this select 0;
_amount = _this select 1;

// define addaction function
_STB_fnc_resupply_addAction = 
{
	_object = _this select 0;
	_amount = _this select 1;
	
	if (isNil {_object getVariable "STB_ResuppliesLeft"}) then {_object setVariable ["STB_ResuppliesLeft", _amount, true];};
	
	_object addAction 	[	"<t color=""#02EF5F"">" + "Rearm at supply point", // text
							"STB\STB_actions\STB_action_resupply.sqf", // script
							[], // params
							30, // priority
							true, // showWindow
							true, // hideOnUse
							"",
							"(_target getVariable ""STB_ResuppliesLeft"") != 0 &&
							!isNil {_this getVariable ""STB_Loadout""} &&
							isNil {_this getVariable ""STB_Resupply_Cooldown""} && 
							isNil {(vehicle _this) getVariable ""STB_Resupply_Cooldown""} && 
							alive _target" // params
						];	

	_object addAction 	[	"<t color=""#4E4FF0"">" + "Check remaining re-supplies", // text
							"STB\STB_actions\STB_action_checkResupply.sqf", // script
							[], // params
							29, // priority
							false, // showWindow
							true, // hideOnUse
							"",
							"alive _target" // params
						];	

};

// add the actions
[_object,_amount] spawn _STB_fnc_resupply_addAction;