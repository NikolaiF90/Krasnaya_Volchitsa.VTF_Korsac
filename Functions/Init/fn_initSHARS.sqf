private _hireActionID = recruitX getVariable ["SHARS_RecruitActionID", -1];

// Remove hire action if already exist
if (_hireActionID != -1) then 
{
    [_hireActionID] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
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

private _dismissUnitActionID = recruitX getVariable ["SHARS_DismissUnitActionID", -1];

if (_dismissUnitActionID != -1) then 
{
    [_dismissUnitActionID] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
};

[
    recruitX,
    "Dismiss Selected Unit",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] call F90_fnc_dismissUnit;
    },
    "alive _this",
    "SHARS_DismissUnitActionID"
] remoteExec ["F90_fnc_addAction", 0, true];

private _dismissSquadActionID = recruitX getVariable ["SHARS_DismissSquadActionID", -1];

if (_dismissSquadActionID != -1) then 
{
    [_dismissSquadActionID] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
};

[
    recruitX,
    "Dismiss Selected Squad",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] call F90_fnc_dismissSquad;
    },
    "alive _this",
    "SHARS_DismissSquadActionID"
] remoteExec ["F90_fnc_addAction", 0, true];