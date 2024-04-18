/*
    VCR - Veteran Combat Record is a system that records the player's progress in the mission like score, kill counts, successful mission etcetera.
*/

[VCRDebug, "initVCR", "Initializing Veteran Combat Record...", true] call F90_fnc_debug;

// Dialog IDC
VCR_MoneyTextIDC = 1204;
VCR_ConfirmedKillsIDC = 1205;

{
    private _confirmedKills = _x getVariable ["Record_ConfirmedKills", -1];
    if (_confirmedKills == -1) then 
    {
        _x setVariable ["Record_ConfirmedKills", 0];
    };

    _x addAction ["<t color='#23d1cd'>Open Tactical Tab</t>", {params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] call F90_fnc_openTacticalTab}, nil, 6, false, false, "", "_target == _this", -1, false];
} forEach allPlayers;

[VCRDebug, "initVCR", "Done initializing Veteran Combat Record.", true] call F90_fnc_debug;