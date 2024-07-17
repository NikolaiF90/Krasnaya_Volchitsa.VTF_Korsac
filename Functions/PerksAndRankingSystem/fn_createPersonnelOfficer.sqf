// Create the officer if not exist yet 
if (isNil {Mission_PersonnelOfficer}) then 
{
    private _group = createGroup [Mission_AlliedSide, true];
    private _officerClass = [DSC_AlliedUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;
    Mission_PersonnelOfficer = _group createUnit [_officerClass, [0,0,0], [], 0, "FORM"];
    [Mission_PersonnelOfficer, rankDesk] spawn F90_fnc_teleportUnit;
    [Mission_PersonnelOfficer] call F90_fnc_setStandingAnimation;

    // Add action 
    private _askPromotionActionID = Mission_PersonnelOfficer getVariable ["Mission_AskPromotionActionID", -1];
    if (_askPromotionActionID != -1) then 
    {
        [] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
    };

    [
        Mission_PersonnelOfficer,
        "Ask For Promotion",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            [_caller] call F90_fnc_promoteUnit;
        },
        "alive _this",
        "Mission_AskPromotionActionID"
    ] remoteExec ["F90_fnc_addAction", 0, true];
};