Task_MainTaskStatus = -1;
publicVariable "Task_MainTaskStatus";
Task_CurrentTaskID = "";
Task_DutyName = "";
publicVariable "Task_DutyName";
Task_DutyDescription = "";
publicVariable "Task_DutyDescription";
Task_DutyStatus = -1; // -1 None, 0 Ongoing, 1 Completed, 2 Failed
publicVariable "Task_DutyStatus";

private _patrolCount = count Task_CreatedPatrolGroups;
if (_patrolCount > 0) then 
{
    {
        private _group = _x;
        {
            [_x] call F90_fnc_deleteUnit;
        } forEach units _group;
        deleteGroup _group;
    } forEach Task_CreatedPatrolGroups;
};
Task_CreatedPatrolGroups = [];

private _spawnedHVTCount = count Task_SpawnedHVT;
if (_spawnedHVTCount > 0) then
{
    {
        [_x] call F90_fnc_deleteUnit;
    } forEach Task_SpawnedHVT;
};
Task_SpawnedHVT = [];

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
