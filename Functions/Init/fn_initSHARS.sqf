// Generate unit data like skills and hire cost
[] remoteExec ["F90_fnc_generateHireData", 0, true];

private _hireActionID = recruitX getVariable ["SHARS_RecruitActionID", -1];

// Remove hire action if already exist
if (_hireActionID != -1) then 
{
    [recruitX, _hireActionID, "SHARS_RecruitActionID"] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
};

[
    recruitX, 
    "Hire Recruits", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [] call F90_fnc_showHireMenu;
    },
    "alive _this",
    "SHARS_RecruitActionID"
] remoteExec ["F90_fnc_addAction", 0, true];

private _squadManagementActionID = reserveX getVariable ["SHARS__SquadManagementActionID", -1];

if (_squadManagementActionID != -1) then 
{
    [reserveX, _squadManagementActionID, "SHARS__SquadManagementActionID"] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
};

[
    reserveX,
    "Manage Squads",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] call F90_fnc_showSquadManagementMenu;
    },
    "alive _this",
    "SHARS__SquadManagementActionID"
] remoteExec ["F90_fnc_addAction", 0, true];
