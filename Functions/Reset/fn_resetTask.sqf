Task_MainTaskStatus = -1;
publicVariable "Task_MainTaskStatus";
Task_CurrentTaskID = "";
Task_DutyName = "";
publicVariable "Task_DutyName";
Task_DutyDescription = "";
publicVariable "Task_DutyDescription";
Task_DutyStatus = -1; // -1 None, 0 Ongoing, 1 Completed, 2 Failed
publicVariable "Task_DutyStatus";

if (count Task_CreatedPatrolGroups > 0) then 
{
    {
        private _group = _x;
        {
            deleteVehicle _x;
        } forEach units _group;
        deleteGroup _group;
    } forEach Task_CreatedPatrolGroups;
};
Task_CreatedPatrolGroups = [];

if (!isNil {Task_AoMarker}) then 
{
    deleteMarker Task_AoMarker;
    deleteMarker Task_AoZone;
};

Persistent_MarkerBlacklists = [];
publicVariable "Persistent_MarkerBlacklists";

if (!isNull Task_TaskTrigger) then
{
    deleteVehicle Task_TaskTrigger;
    Task_TaskTrigger = objNull;
};
