Scenario_Name = "Krasnaya Volchitsa";
[true, "init",format ["Starting %1...", Scenario_Name], false] call F90_fnc_debug;

// Mission Variables
Mission_Host = missionHost;
Mission_Playables = [player1, player2];
Mission_HostStartPos = [2587.65,2063.63,0];
Mission_P1StartPos = [2587,2069.77,0];
Mission_P2StartPos = [2586.27,2067.28,0];
Mission_TaskOfficerStartPos = [2586.12,2051.29,0];

Mission_CreatedUnits = [];

[] call F90_fnc_resetMap;

// Init Team switch
enableTeamSwitch true;

addMissionEventHandler ["TeamSwitch", 
{
	params ["_previousUnit", "_newUnit"];

    [_previousUnit, _newUnit] call F90_fnc_switchUnitAddAction;
}];