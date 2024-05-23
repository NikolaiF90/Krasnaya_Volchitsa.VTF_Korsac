params ["_unit"];

if (dialog) then 
{
    closeDialog 2;
};

private _created = createDialog "tacticalMenu";

if (_created) then 
{
    private _amount = ["GETMONEY", _unit] call F90_fnc_economyHandler;
    private _killCount = _unit getVariable "Record_ConfirmedKills";
    private _conductedMissions = _unit getVariable "Record_TotalConductedMissions";
    private _successfulMissions = _unit getVariable "Record_TotalSuccessfulMissions";

    private _moneyText = format ["Milcash: %1", _amount];
    private _killText = format ["Confirmed Kills: %1", _killCount];
    private _conductedText = format ["Total Conducted Missions: %1", _conductedMissions];
    private _successfulText = format ["Total Successful Missions: %1", _successfulMissions];

    // Get any active task
    private _activeTask = "There are no active task currently.";

    if (Task_DutyStatus != -1) then 
    {
        private _status = "";

        switch (Task_DutyStatus) do 
        {
            case 0: {_status = "Ongoing"};
            case 1: {_status = "Completed"};
            case 2: {_status = "Failed"};
        };

        _activeTask = format ["[%1] %2: %3", _status, Task_DutyName, Task_DutyDescription];
    };

    ctrlSetText [VCR_MoneyTextIDC, _moneyText];
    ctrlSetText [VCR_TotalConductedIDC, _conductedText];
    ctrlSetText [VCR_TotalCompletedIDC, _successfulText];
    ctrlSetText [VCR_ConfirmedKillsIDC, _killText];
    ctrlSetText [VCR_ActiveTaskIDC, _activeTask];
};