// STB addAction check server

hint "Gathering Information ...";
// look for number of AI deployed on the server and HC
[[],"STB_fnc_debug_checkNetworkAI",true,false] call BIS_fnc_MP;
// wait for information to be broadcast back to the player
waitUntil {!isNil "temp_hc_ai_count" && !isNil "temp_hc_grp_count" && !isNil "temp_server_ai_count" && !isNil "temp_server_grp_count"};
_hcName = if (STB_HC_Connected) then {STB_HC_Name} else {"n/a"};

// figure out AI that remain on player clients
_local_player_ai_count = {local _x && !(_x in playableUnits)} count allUnits;	
_local_player_grp_count = {local (leader _x) && !((leader _x) in playableUnits)} count allGroups;

_playerIsServer = isServer;

// hint this information
hint parseText format 	[	"<t align='center'>AI deployed on <t color='#ffff00'>server</t>:<br/>
							<t color='#ffff00'>%1</t> units in <t color='#ffff00'>%2</t> groups.<br/><br/>
							HC Connected = <t color='#55ff55'>%3</t> <br/>
							HC Name = <t color='#55ff55'>%4</t> <br/><br/>
							AI deployed on <t color='#55ff55'>HC</t>:<br/>
							<t color='#55ff55'>%5</t> units in <t color='#55ff55'>%6</t> groups.<br/><br/>
							AI Deployed your <t color='#00ffff'>local client</t>:<br/>
							<t color='#00ffff'>%7</t> units in <t color='#00ffff'>%8</t> groups.<br/><br/>
							Player is server = <t color='#ff2222'>%9</t>.</t>",				
							temp_server_ai_count,temp_server_grp_count,
							STB_HC_Connected, _hcName,
							temp_hc_ai_count, temp_hc_grp_count,
							_local_player_ai_count, _local_player_grp_count,
							_playerIsServer
						];
			
// cleanup the temporary variables
temp_server_ai_count = nil;
temp_server_grp_count = nil;
temp_hc_ai_count = nil;
temp_hc_grp_count = nil;
publicVariable "temp_server_ai_count";
publicVariable "temp_server_grp_count";
publicVariable "temp_hc_ai_count";
publicVariable "temp_hc_grp_count";

				
				