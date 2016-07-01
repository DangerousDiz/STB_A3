// check remaining resupplies

_target = _this select 0;
_caller = _this select 1;

_remaining = _target getVariable "STB_ResuppliesLeft";
if (_remaining < 0) then {_remaining = "unlimited"};

hint parseText format ["Resupplies remaining:<br/><t color='#ffff00'>%1</t>", _remaining];