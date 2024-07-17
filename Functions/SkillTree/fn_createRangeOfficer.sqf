// Create one if doesn't exist yet
if (isNil {Mission_RangeOfficer}) then 
{
    private _group = createGroup [Mission_AlliedSide, true];
    private _type = [DSC_AlliedUnitList, ["rangemaster", "officer"]] call F90_fnc_getSuitableClass;
    Mission_RangeOfficer = [_group, _type, [0,0,0]] call F90_fnc_createUnit;
    [Mission_RangeOfficer, skillBoardX, 180] call F90_fnc_teleportUnit;
    [Mission_RangeOfficer] call F90_fnc_setStandingAnimation;

    // Create a report duty action
    private _openSkillShopActionID = Mission_RangeOfficer getVariable ["Mission_openSkillShopActionID", -1];
    if (_openSkillShopActionID != -1) then 
    {
        [Mission_RangeOfficer, _openSkillShopActionID] remoteExec ["removeAction", 0, true];
    };

    [
        Mission_RangeOfficer,
        "Open Skill Menu",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            
            [] call F90_fnc_openSkillMenu;
        },
        "alive _this",
        "Mission_openSkillShopActionID"    
    ] remoteExec ["F90_fnc_addAction", 0, true];

    [Mission_RangeOfficer] call AIS_System_fnc_loadAIS;
};