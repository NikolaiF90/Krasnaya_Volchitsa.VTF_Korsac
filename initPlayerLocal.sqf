waitUntil {!isNil "Scenario_Name" && !isNull player};

sleep 5;
[MissionDebug, "init",format ["Starting %1...", Scenario_Name], true] call F90_fnc_debug;

[player] call F90_fnc_initPersistent;
[player] call F90_fnc_initEconomy;
[player] call F90_fnc_initREC;
[player] call F90_fnc_initCABPlayer;