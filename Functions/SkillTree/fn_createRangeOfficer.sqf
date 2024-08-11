private _fn_createOfficer = 
{
    private _group = createGroup [Mission_AlliedSide, true];
    private _officerClass = [DSC_AlliedUnitList, ["rangemaster", "officer"]] call F90_fnc_getSuitableClass;
    Skill_RangeOfficer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
    [Skill_RangeOfficer, skillDesk, 180] spawn F90_fnc_teleportObject;
    [Skill_RangeOfficer] call F90_fnc_setStandingAnimation;

    [Skill_RangeOfficer] call AIS_System_fnc_loadAIS;
};

// Create one if doesn't exist yet
if (isNil {Skill_RangeOfficer}) then 
{
    [] call _fn_createOfficer;
} else 
{
    if !(alive Skill_RangeOfficer) then 
    {
        [] call _fn_createOfficer;
    };
};

// Create Open Skill Menu action
[
    Skill_RangeOfficer,
    "Open Skill Menu",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [] call F90_fnc_openSkillMenu;
    },
    "alive _this",
    "RSW_OpenSkillShopActionID"    
] remoteExec ["F90_fnc_addAction", 0, true];