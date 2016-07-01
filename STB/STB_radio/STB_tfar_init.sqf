/*
	*** Task Force Radio Initialiser ***

	Calling this script with no parameters will set the radio encryptions to default (each side separate).
	Params are 3 element array of strings with underscores in front. Default TFAR encryptions are:
	
	["_bluefor","_opfor","_independant"] where element 0 is blue radio code, 1 is red radio code and 2 is green radio code.
	
	If you want to have blue and independant on the same encryption, call this script with the
	params as follows:
	
	["_bluefor","_opfor","_bluefor"] execVM "STB\STB_Radio\STB_Radio_Init.sqf";
	
	To use it with default settings give an empty array or nothing for parameters e.g.
	
	[] execVM "STB\STB_Radio\STB_Radio_Init.sqf";
*/

// Task Force Radio Functions
#include "\task_force_radio\functions\common.sqf";

// Get Params
_defaultEncryptionArray = ["_bluefor","_opfor","_independant"];
_encryptionArray = [];

// get passed array if valid, else use default
if (typeName _this == "ARRAY") then { 
	_encryptionArray = 	if (count _this == 3 && 
							typeName (_this select 0) == "STRING" && 
							typeName (_this select 1) == "STRING" && 
							typeName (_this select 2) == "STRING" ) 
						then {_this} else {_defaultEncryptionArray};	
} else {_encryptionArray = _defaultEncryptionArray};

// Do Not Give out Long Ranges
tf_no_auto_long_range_radio = true;
publicVariable "tf_no_auto_long_range_radio";

// set each group on side to use same short range frequencies
tf_same_sw_frequencies_for_side = true;
publicVariable "tf_same_sw_frequencies_for_side";

// set each group on side to use same long range frequencies
tf_same_lr_frequencies_for_side = true;
publicVariable "tf_same_lr_frequencies_for_side";

// set short range radio frequencies (7800 & 152)
_settingsSwWest = false call TFAR_fnc_generateSwSettings;
_settingsSwWest set [2,  STB_TFAR_Frequencies_SR_West];
tf_freq_west = _settingsSwWest;
_settingsSwEast = false call TFAR_fnc_generateSwSettings;
_settingsSwEast set [2, STB_TFAR_Frequencies_SR_East];
tf_freq_east = _settingsSwEast;
_settingsSwGuer = false call TFAR_fnc_generateSwSettings;
_settingsSwGuer set [2, STB_TFAR_Frequencies_SR_Resistance];
tf_freq_guer = _settingsSwGuer;
publicVariable "tf_freq_west";
publicVariable "tf_freq_east";
publicVariable "tf_freq_guer";

// set long range radio frequencies  (1523G etc)
_settingsLrWest = false call TFAR_fnc_generateLrSettings;
_settingsLrWest set [2, STB_TFAR_Frequencies_LR_West];
tf_freq_west_lr = _settingsLrWest;
_settingsLrEast = false call TFAR_fnc_generateLrSettings;
_settingsLrEast set [2, STB_TFAR_Frequencies_LR_East];
tf_freq_east_lr = _settingsLrEast;
_settingsLrGuer = false call TFAR_fnc_generateLrSettings;
_settingsLrGuer set [2, STB_TFAR_Frequencies_LR_Resistance];
tf_freq_guer_lr = _settingsLrGuer;
publicVariable "tf_freq_west_lr";
publicVariable "tf_freq_east_lr";
publicVariable "tf_freq_guer_lr";

// set encryption codes for radios
tf_west_radio_code = _encryptionArray select 0;
tf_east_radio_code = _encryptionArray select 1;
tf_guer_radio_code = _encryptionArray select 2;
publicVariable "tf_west_radio_code";
publicVariable "tf_east_radio_code";
publicVariable "tf_guer_radio_code";