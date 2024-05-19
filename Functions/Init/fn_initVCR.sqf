/*
    VCR - Veteran Combat Record is a system that records the player's progress in the mission like score, kill counts, successful mission etcetera.
*/

[VCRDebug, "initVCR", "Initializing Veteran Combat Record...", true] call F90_fnc_debug;

// Dialog IDC
VCR_MoneyTextIDC = 1204;
VCR_ConfirmedKillsIDC = 1205;
VCR_ActiveTaskIDC = 1206;

VCR_TempKillsIDC = 1311;
VCR_TempHVTKilledIDC = 1312;
VCR_TempHVTCapturedIDC = 1313;
VCR_TempAirSupportIDC = 1314;
VCR_TempArtilleryIDC = 1315;
VCR_TempHelicoptersIDC = 1316;
VCR_TempVehiclesIDC = 1317;
VCR_TempCivilianCasualtiesIDC = 1318;
VCR_TempTeamCasualtiesIDC = 1319;
VCR_TempRewardsIDC = 1320;
VCR_TempMissionSuccessIDC = 1321;
VCR_TempTotalPointsIDC = 1322;

// Task Record Variables
VCR_TempKillCount = 0;
VCR_TempHVTKilled = 0;
VCR_TempHVTCaptured = 0;
VCR_TempAirSupportUsed = 0;
VCR_TempArtilleryUsed = 0;

VCR_TempHeliUsed = 0;
VCR_TempLightArmedHeliLoss = 0;
VCR_TempLightUnarmedHeliLoss = 0;
VCR_TempAttackHeliLoss = 0;

VCR_TempVehiclesUsed = 0;
VCR_TempCivilianCasualties = 0;
VCR_TempTeamCasualties = 0;

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