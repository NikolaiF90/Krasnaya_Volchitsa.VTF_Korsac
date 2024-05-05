

params ["_target", "_caller", "_actionID"];

if (Task_ActiveTask == 0) then 
{
    // Give random task
    Task_ActiveTask = random [1, 2, count Task_AllTask];
    [TaskDebug, "requestMission", format ["Current task: %1", Task_AllTask # Task_ActiveTask], true] call F90_fnc_debug;
    hint "You are now in duty.";
    _target removeAction _actionID;
};