if (isNil {PRS_PersonnelOfficer}) then 
{
    PRS_PersonnelOfficer = [rankDesk, Mission_AlliedSide, DSC_AlliedUnitList] call F90_fnc_createOfficer;
} else 
{
    if !(alive PRS_PersonnelOfficer) then 
    {
        PRS_PersonnelOfficer = [rankDesk, Mission_AlliedSide, DSC_AlliedUnitList] call F90_fnc_createOfficer;
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