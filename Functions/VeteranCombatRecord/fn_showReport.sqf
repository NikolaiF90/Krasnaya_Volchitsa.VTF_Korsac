params ["_heliPoints", "_missionPoints", "_seizePoints", "_totalPoints", "_rewards"];

if (dialog) then 
{
    closeDialog 1;
};

createDialog "dutyReportMenu";

ctrlSetText [VCR_TempKillsIDC, format ["Confirmed Kills: %1", VCR_TempKillCount]];
ctrlSetText [VCR_TempCapturedPrisonersIDC, format ["Captured Prisoners: %1", VCR_TempCapturedPrisoners]];
ctrlSetText [VCR_TempHVTKilledIDC, format ["HVT Killed: %1", VCR_TempHVTKilled]];
ctrlSetText [VCR_TempHVTCapturedIDC, format ["HVT Captured: %1", VCR_TempHVTCaptured]];
ctrlSetText [VCR_TempHelicoptersIDC, format ["Transport Heli: %1pts", _heliPoints]];
ctrlSetText [VCR_TempMissionSuccessIDC, format ["Successful Operation: %1pts", _missionPoints]];
ctrlSetText [VCR_TempSeizedIDC, format ["Seized Assets Points: %1pts", _seizePoints]];
ctrlSetText [VCR_TempTotalPointsIDC, format ["Total Points: %1pts", _totalPoints]];
ctrlSetText [VCR_TempRewardsIDC, format ["Milcash Rewards: %1", _rewards]];