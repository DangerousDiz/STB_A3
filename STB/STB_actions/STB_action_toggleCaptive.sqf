// STB addAction toggle captive
_unit = _this select 1;

if (captive _unit) then {_unit setCaptive false; hint "captive = off";} else {_unit setCaptive true; hint "captive = on";};