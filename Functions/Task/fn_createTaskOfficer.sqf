/*
    Author: PrinceF90

    Description:
        This function creates a Task Officer if one does not exist or is dead. It assigns the officer a suitable class, sets up a report duty action, and loads the AIS system.

    Parameter(s):
        None

    Returns:
        None
*/
if (isNil {Mission_TaskOfficer}) then 
{
    Mission_TaskOfficer = [mapX, Mission_AlliedSide, DSC_AlliedUnitList] call F90_fnc_createOfficer;
} else 
{
    if !(alive Mission_TaskOfficer) then 
    {
        Mission_TaskOfficer = [mapX, Mission_AlliedSide, DSC_AlliedUnitList] call F90_fnc_createOfficer;
    };
};

// Create officer's action
[
    Mission_TaskOfficer,
    "Report Duty",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        [] remoteExec ["F90_fnc_requestMission", 2];
    },
    "Task_MainTaskStatus == -1",
    "RSW_ReportDutyActionID"    
] remoteExec ["F90_fnc_addAction", 0, true];

// Remove report action ID if still exist.
["RSW_ReportMissionActionCreated"] remoteExec ["F90_fnc_removeVariable", 0, true];