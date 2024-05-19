params ["_heliPoints", "_missionPoints", "_totalPoints", "_rewards"];

if (dialog) then 
{
    closeDialog 1;
};

createDialog "dutyReportMenu";

ctrlSetText [VCR_TempKillsIDC, format ["Confirmed Kills: %1", VCR_TempKillCount]];
ctrlSetText [VCR_TempHelicoptersIDC, format ["Transport Heli: %1", _heliPoints]];
ctrlSetText [VCR_TempMissionSuccessIDC, format ["Successful Operation: %1", _missionPoints]];
ctrlSetText [VCR_TempTotalPointsIDC, format ["Total Points: %1", _totalPoints]];
ctrlSetText [VCR_TempRewardsIDC, format ["Milcash Rewards: %1", _rewards]];