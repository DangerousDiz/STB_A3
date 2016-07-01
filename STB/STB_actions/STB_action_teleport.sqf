// STB teleport
_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_clicked = 0;
sleep 0.1;
openmap true;
onMapSingleClick "player setpos [_pos select 0, _pos select 1, 0]; clicked = 1; openmap false;onMapSingleClick ''; true;";
waitUntil {_clicked == 1};