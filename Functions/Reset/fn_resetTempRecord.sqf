[VCRDebug, "resetTempRecord", "Resetting temporary records...", false] call F90_fnc_debug;

// Task Record Variables
VCR_TempKillCount = 0;
VCR_TempCapturedPrisoners = 0;
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
VCR_TempSeized = 0;

[VCRDebug, "resetTempRecord", "Temporary records has been resetted.", false] call F90_fnc_debug;