Task_MainTaskStatus = -1;
publicVariable "Task_MainTaskStatus";
Task_CurrentTaskID = "";
Task_DutyName = "";
publicVariable "Task_DutyName";
Task_DutyDescription = "";
publicVariable "Task_DutyDescription";
Task_DutyStatus = -1; // -1 None, 0 Ongoing, 1 Completed, 2 Failed
publicVariable "Task_DutyStatus";

// Containing arrays of units that should be deleted when reset task takes place
private _unitListArray = 
[
    Task_AmbushUnits, 
    Task_EnemyPatrols, 
    Task_SpawnedHVT, 
    Task_SupportAlliedUnits, 
    Task_TempTeamMembers,
    Task_SupportSpawnedVehicles
];
{
    private _unitList = _x;
    if !(isNil {_unitList}) then 
    {
        private _listLength = count _unitList;
        
        if (_listLength > 0) then 
        {
            {
                if !(isNull _x) then 
                {
                    [_x, false] call F90_fnc_deleteUnit;
                }
            } forEach _unitList;
        };
    };
    _unitList = [];
} forEach _unitListArray;
publicVariable "Mission_CreatedUnits";

private _createdAssetCount = count Task_CreatedAssets;
if (_createdAssetCount > 0) then 
{
    {
        deleteVehicle _x;
    } forEach Task_CreatedAssets;
};
Task_CreatedAssets = [];

if (!isNil {Task_AoMarker}) then 
{
    deleteMarker Task_AoMarker;
    deleteMarker Task_AoZone;
};

if (!isNull Task_TaskTrigger) then
{
    deleteVehicle Task_TaskTrigger;
    Task_TaskTrigger = objNull;
};

[] call F90_fnc_clearGarbage;