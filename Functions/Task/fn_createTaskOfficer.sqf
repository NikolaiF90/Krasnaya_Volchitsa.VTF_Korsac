/*
    Author: PrinceF90

    Description:
        This function creates a Task Officer if one does not exist or is dead. It assigns the officer a suitable class, sets up a report duty action, and loads the AIS system.

    Parameter(s):
        None

    Returns:
        None
*/

private _fn_createOfficer = 
{
    // Create reporting officer
    private _group = createGroup [Mission_AlliedSide, true];
    private _officerClass = [DSC_AlliedUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
    Mission_TaskOfficer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
    [Mission_TaskOfficer, mapX] spawn F90_fnc_teleportObject;
    [Mission_TaskOfficer] call F90_fnc_setStandingAnimation;

    // Init revive system
    [Mission_TaskOfficer] call AIS_System_fnc_loadAIS;

    publicVariable "Mission_TaskOfficer";
};

if (isNil {Mission_TaskOfficer}) then 
{
    [] call _fn_createOfficer;
} else 
{
    if !(alive Mission_TaskOfficer) then 
    {
        [] call _fn_createOfficer;
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