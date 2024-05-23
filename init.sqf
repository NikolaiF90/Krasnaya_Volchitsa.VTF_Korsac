Scenario_Name = "Krasnaya Volchitsa";
[true, "init",format ["Starting %1...", Scenario_Name], false] call F90_fnc_debug;

[] call F90_fnc_initVariables;
[] call F90_fnc_resetMap;

// Init Team switch
enableTeamSwitch true;

civilian setFriend [east, 1];

addMissionEventHandler ["TeamSwitch", 
{
	params ["_previousUnit", "_newUnit"];

    [_previousUnit, _newUnit] call F90_fnc_switchUnitAddAction;
}];