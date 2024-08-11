private _fn_createOfficer = 
{
    private _group = createGroup [Mission_AlliedSide, true];
    private _officerClass = [DSC_AlliedUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
    PRS_PersonnelOfficer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
    [PRS_PersonnelOfficer, rankDesk] spawn F90_fnc_teleportObject;
    [PRS_PersonnelOfficer] call F90_fnc_setStandingAnimation;

    [PRS_PersonnelOfficer] call AIS_System_fnc_loadAIS;
};

// Create the officer if not exist yet 
if (isNil {PRS_PersonnelOfficer}) then 
{
    [] call _fn_createOfficer;
} else 
{
    if !(alive PRS_PersonnelOfficer) then 
    {
        [] call _fn_createOfficer;
    };
};

// Add action 
[
    PRS_PersonnelOfficer,
    "Ask For Promotion",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] call F90_fnc_promoteUnit;
    },
    "alive _this",
    "RSW_AskPromotionActionID"
] remoteExec ["F90_fnc_addAction", 0, true];