/*
	
	Rearm, Refuel and Repair Action
	
*/

refuelling = true;
_driver = _this select 1;
_vic = vehicle _driver;
_fuel = fuel _vic;
_damage = damage _vic;
_condition = true;

// start repair loop
while {damage _vic > 0 && _condition} do {
	_vic setDamage (_damage - 0.001);
	_damage = damage _vic;
	_pct = (round(1000*(1-_damage)))/10;
	hint parsetext format ["<t color='#00FF00'>Repairing:</t><br/>%1 percent",_pct]; 
	sleep 0.25;
	_condition = (speed _vic <= 0.2);
};

// if loop broke here
if (!_condition) exitWith {	hint parsetext format ["<t color='#FF0000'>Repairs stopped before completion!</t>"]; refuelling = false;};

// pause and hint
hint parsetext format ["<t color='#FFFF00'>Repairs complete! Refueling...</t>"];
sleep 1.5;

// start refuel loop
while {fuel _vic < 0.99 && _condition} do {
	_vic setFuel (fuel _vic + 0.001);	
	_pct = round((fuel _vic) * 100);
	hint parsetext format ["<t color='#00FF00'>Refueling:</t><br/>%1 percent",_pct]; 
	sleep 0.1;
	_condition = (speed _vic <= 0.5);
};
_vic setFuel 1;

// if loop broke here
if (!_condition) exitWith {hint parsetext format ["<t color='#FF0000'>Refueling stopped before completion!</t>"];  refuelling = false;};

// pause and hint
hint parsetext format ["<t color='#FFFF00'>Refueling complete! Rearming...</t>"];
sleep 1.5;

// Rearm Vehicle
_i=0.1;
while {_i < 100 && _condition} do {
	hint parsetext format ["<t color='#00FF00'>Rearming:</t><br/>%1 percent",ceil (_i)]; 
	sleep 0.1;
	_i=_i+1;
	_condition = (speed _vic <= 0.5);	
};

// if loop broke here
if (!_condition) exitWith {hint parsetext format ["<t color='#FF0000'>Rearming stopped before completion</t>"];  refuelling = false;};

_vic setVehicleAmmo 1;
hint parsetext format ["<t color='#00FF00'>Repairs, refuelling and rearming complete.<br/><br/></t><t color='#FFFFFF'>Clear to move out.</t>"];

refuelling = false;