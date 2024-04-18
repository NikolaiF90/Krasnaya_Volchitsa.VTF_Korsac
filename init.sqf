Scenario_Name = "Krasnaya Volchitsa";

[true, "init",format ["Starting %1...", Scenario_Name], false] call F90_fnc_debug;

// Init persistence
configurePersistentDone = false;
[] call F90_fnc_configurePersistent;
waitUntil {configurePersistentDone};
[] call F90_fnc_persistentInit;