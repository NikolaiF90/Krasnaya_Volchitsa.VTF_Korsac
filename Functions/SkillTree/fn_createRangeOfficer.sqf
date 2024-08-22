// Create one if doesn't exist yet
if (isNil {Skill_RangeOfficer}) then 
{
    Skill_RangeOfficer = [skillDesk, Mission_AlliedSide, DSC_AlliedUnitList] call F90_fnc_createOfficer;
} else 
{
    if !(alive Skill_RangeOfficer) then 
    {
        Skill_RangeOfficer = [skillDesk, Mission_AlliedSide, DSC_AlliedUnitList] call F90_fnc_createOfficer;
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