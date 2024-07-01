waitUntil {!isNil "Scenario_Name" && !isNull player};

hcRemoveAllGroups player;

sleep 5;
[] spawn F90_fnc_splashScreen;
sleep 3;
[player, Mission_StartingPosition] remoteExec ["F90_fnc_resetUnit",2];

[MissionDebug, "init",format ["Starting %1...", Scenario_Name], false, true] call F90_fnc_debug;
[player] call F90_fnc_initPersistent;
[player] call F90_fnc_initEconomy;
[player] call F90_fnc_initREC;
[player] call F90_fnc_initCABPlayer;
[player] call F90_fnc_initSHARSPlayers;