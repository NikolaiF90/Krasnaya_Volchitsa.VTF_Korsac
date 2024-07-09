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
    deleteVehicle Task_TaskTrigger;
    Task_TaskTrigger = objNull;
}; 

private _activatorSide = nil;
switch (Mission_AlliedSide) do 
{
    case west: { _activatorSide = "WEST"};
    case east: { _activatorSide = "EAST"};
    case independent: { _activatorSide = "GUER"};
};

Task_TaskTrigger = createTrigger ["EmptyDetector", _location];
Task_TaskTrigger setTriggerArea [_areaX, _areaY, _areaDirection, true];
Task_TaskTrigger setTriggerActivation [_activatorSide, "PRESENT", true];
Task_TaskTrigger setTriggerStatements [_condition, "", ""];