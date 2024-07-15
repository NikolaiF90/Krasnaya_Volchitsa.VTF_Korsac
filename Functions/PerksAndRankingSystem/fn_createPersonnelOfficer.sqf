// Create the officer
private _group = createGroup [Mission_AlliedSide, true];
Mission_PersonnelOfficer = _group createUnit [DSC_OfficerClass, [0,0,0], [], 0, "FORM"];
[Mission_PersonnelOfficer, rankDesk] spawn F90_fnc_teleportUnit;
Mission_PersonnelOfficer setCombatBehaviour "SAFE";
Mission_PersonnelOfficer setUnitPos "Up";
[Mission_PersonnelOfficer, "MOVE"] remoteExec ["disableAI", 0, true];

[Mission_PersonnelOfficer, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0, true]; 
[Mission_PersonnelOfficer, "HubBriefing_loop"] remoteExec ["playMoveNow", 0, true];

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