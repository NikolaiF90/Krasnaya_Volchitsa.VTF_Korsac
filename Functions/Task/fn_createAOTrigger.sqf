/*
    Author: PrinceF90

    Description:
        Creates a trigger for a task with specified location, area dimensions, and activation condition. e.g [getMarkerPos "Marker1", 100, 100, 0, "this"] call F90_fnc_createAOTrigger;

    Parameter(s):
        0: ARRAY - Location format AGL for the trigger
        1: NUMBER - X-axis dimension of the trigger area
        2: NUMBER - Y-axis dimension of the trigger area
        3: NUMBER - Direction of the trigger area
        4: STRING - Condition for trigger activation

    Returns:
        None
*/

params ["_location", "_areaX", "_areaY", "_areaDirection", "_condition"];

if (!isNull Task_TaskTrigger) then 
{
    [TaskDebug, "createAOTrigger", format ["Deleting Task_TaskTrigger (%1)...", Task_TaskTrigger], true] call F90_fnc_debug;
    deleteVehicle Task_TaskTrigger;
    Task_TaskTrigger = objNull;
    [TaskDebug, "createAOTrigger", "Task_TaskTrigger deleted.", true] call F90_fnc_debug;
}; 
Task_TaskTrigger = createTrigger ["EmptyDetector", _location];
Task_TaskTrigger setTriggerArea [_areaX, _areaY, _areaDirection, true];
Task_TaskTrigger setTriggerActivation ["EAST", "PRESENT", true];
Task_TaskTrigger setTriggerStatements [_condition, "", ""];