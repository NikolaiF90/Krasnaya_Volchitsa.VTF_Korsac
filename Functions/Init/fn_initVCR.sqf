/*
    VCR - Veteran Combat Record is a system that records the player's progress in the mission like score, kill counts, successful mission etcetera.
*/

[VCRDebug, "initVCR", "Initializing Veteran Combat Record...", true] call F90_fnc_debug;

// Dialog IDC
VCR_MoneyTextIDC = 1204;
VCR_ConfirmedKillsIDC = 1205;
VCR_ActiveTaskIDC = 1206;
VCR_TotalConductedIDC = 1207;
VCR_TotalCompletedIDC = 1208;
VCR_TotalArrestedHVTIDC = 1209;
VCR_TotalKilledHVTIDC = 1210;

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

VCR_WantedListBoxIDC = 1212;

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


private _defaultUnitVariables = [
    ["Record_ConfirmedKills", 0],
    ["Record_TotalConductedMissions", 0],
    ["Record_TotalSuccessfulMissions", 0],
    ["Record_TotalArrestedHVT", 0],
    ["Record_TotalKilledHVT", 0]
];

{
    private _unit = _x;
    {
        private _currentValue = _unit getVariable [_x select 0, -1];
        if (_currentValue == -1) then 
        {
            _unit setVariable [_x select 0, _x select 1];
        };
    } forEach _defaultUnitVariables;
} forEach (Mission_Playables + [Mission_Host]);

player addAction 
[
    "<t color='#23d1cd'>Open Tactical Tab</t>", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        [_caller] call F90_fnc_openTacticalTab
    }, 
    nil, 
    4, 
    false, 
    false, 
    "", 
    "_target == _this"
];

[VCRDebug, "initVCR", "Done initializing Veteran Combat Record.", true] call F90_fnc_debug;