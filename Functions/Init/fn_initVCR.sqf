/*
    VCR - Veteran Combat Record is a system that records the player's progress in the mission like score, kill counts, successful mission etcetera.
*/

[VCRDebug, "initVCR", "Initializing Veteran Combat Record...", true] call F90_fnc_debug;

// Dialog IDC
VCR_MoneyTextIDC = 1204;
VCR_ConfirmedKillsIDC = 1205;

/*
{
    _x addAction ["<t color='#23d1cd'>Open Tactical Tab</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] call F90_fnc_openTacticalTab}, nil, 6, false, false, "", "_target == _this", -1, false];
} forEach Mission_Playables + [Mission_Host];
*/
private _confirmedKills = Mission_Host getVariable ["Record_ConfirmedKills", -1];
if (_confirmedKills == -1) then 
{
    Mission_Host setVariable ["Record_ConfirmedKills", 0];
};
VCR_ActionID = Mission_Host addAction ["<t color='#23d1cd'>Open Tactical Tab</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] call F90_fnc_openTacticalTab}, nil, 6, false, false, "", "_target == _this", -1, false];

[VCRDebug, "initVCR", "Done initializing Veteran Combat Record.", true] call F90_fnc_debug;