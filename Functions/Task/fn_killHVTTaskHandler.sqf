/*
    Author: PrinceF90

    Description:
        Monitors the status of a high-value target (HVT) until it is killed or arrested, then triggers related tasks.

    Parameter(s):
        None

    Returns:
        None
*/
private _hvtUnit = Task_SpawnedHVT select 0;
private _taskCompleted = false;
private _hvtStatus = "Alive";

while {true} do 
{
    if !(alive _hvtUnit) exitWith 
    {
        // HVT No longer alive
        _taskCompleted = true;
        _hvtStatus = "killed";
    };

    if ((_hvtUnit getVariable ["CAB_HasBeenArrested", false])) exitWith
    {
        // HVT has been arrested
        _taskCompleted = true;
        _hvtStatus = "arrested";
    };

    _taskCompleted = false;

    sleep 3;
};

if (_taskCompleted) then 
{
    // Task has been completed

    // Remove unit from array 
    Task_SpawnedHVT deleteAt 0;

    // Spawn enemy QRF
    [80, position Task_TaskTrigger] spawn F90_fnc_createAmbush;

    // Notify player
    [format ["HVT %1", _hvtStatus], "DEFAULT"] call F90_fnc_textNotification; 
    [Mission_AlliedSide, Task_CurrentTaskID, "SUCCEEDED"] call F90_fnc_showTaskNotification;

    // Update task status
    Task_DutyStatus = 1;
    Task_DutyName = "";
    Task_DutyDescription = "";
    Persistent_MarkerBlacklists = Persistent_MarkerBlacklists - [Task_AoMarker, Task_AoZone];
    publicVariable "Persistent_MarkerBlacklists";
    deleteMarker Task_AoMarker;
    deleteMarker Task_AoZone;

    // RTB mission
    {  
        _x setVariable ["TASK_IsSuccessfulMission", true, true];
    } forEach allPlayers;
    ["Task_RTB"] call F90_fnc_createTask;
};