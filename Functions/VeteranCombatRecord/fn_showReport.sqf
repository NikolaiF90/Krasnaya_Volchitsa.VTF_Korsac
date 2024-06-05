params ["_heliPoints", "_missionPoints", "_totalPoints", "_rewards"];

if (dialog) then 
{
    closeDialog 1;
};

createDialog "dutyReportMenu";

ctrlSetText [VCR_TempKillsIDC, format ["Confirmed Kills: %1", VCR_TempKillCount]];
ctrlSetText [VCR_TempHVTKilledIDC, format ["HVT Killed: %1", VCR_TempHVTKilled]];
ctrlSetText [VCR_TempHelicoptersIDC, format ["Transport Heli: %1points", _heliPoints]];
ctrlSetText [VCR_TempMissionSuccessIDC, format ["Successful Operation: %1points", _missionPoints]];
ctrlSetText [VCR_TempTotalPointsIDC, format ["Total Points: %1points", _totalPoints]];
ctrlSetText [VCR_TempRewardsIDC, format ["Milcash Rewards: %1", _rewards]];