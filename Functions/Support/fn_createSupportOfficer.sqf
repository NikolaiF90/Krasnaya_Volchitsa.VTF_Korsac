private _fn_createOfficer = 
{
    private _group = createGroup [Mission_AlliedSide, true];
    private _officerClass = [DSC_AlliedUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
    RSW_SuppportOfficer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
    [RSW_SuppportOfficer, Support_SupportDesk] spawn F90_fnc_teleportObject;
    [RSW_SuppportOfficer] call F90_fnc_setStandingAnimation;

    [RSW_SuppportOfficer] call AIS_System_fnc_loadAIS;
};

// Create the officer if not exist yet 
if (isNil {RSW_SuppportOfficer}) then 
{
    [] call _fn_createOfficer;
} else 
{
    if !(alive RSW_SuppportOfficer) then 
    {
        [] call _fn_createOfficer;
    };
};

// Add action 
[
    RSW_SuppportOfficer,
    "Change Transport Heli",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] call F90_fnc_openChangeTransportHeliMenu;
    },
    "alive _this && alive _target",
    "RSW_ChangeTransportHeliActionID"
] remoteExec ["F90_fnc_addAction", 0, true];

[
    RSW_SuppportOfficer,
    "Request Temporary Team",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        private _hasRequested = _caller getVariable ['REC_TempTeamRequested', false];
        if !(_hasRequested) then 
        {
            private _unitCounts = 3;
            private _spawnPos = [_caller, 10, 20, 5] call BIS_fnc_findSafePos;
            private _teamSide = _caller getVariable "RSW_UnitSide";
            private _debuffedSkills = Mission_DefaultAlliedSkill - 0.1;

            // Spawn units 
            private _group = [_unitCounts, DSC_AlliedUnitList, _spawnPos, _teamSide, _debuffedSkills] call F90_fnc_createSquad;

            // Individual setup
            {
                _x setVariable ["RSW_IsTempSupportUnit", true, true];
                Task_TempTeamMembers pushBack _x;
                [_x] join _caller;
            } forEach units _group;

            _caller setVariable ["REC_TempTeamRequested", true, true];
        } else 
        {
            ["You can only request once per mission", "ERROR"] call F90_fnc_textNotification;
        };
    },
    "Task_MainTaskStatus == 0",
    "RSW_RequestTempTeamActionID"
] remoteExec ["F90_fnc_addAction", 0, true];