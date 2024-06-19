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
    private _arrestedHVTs = _unit getVariable "Record_TotalArrestedHVT";
    private _killedHVTs = _unit getVariable "Record_TotalKilledHVT";

    private _moneyText = format ["Milcash: %1", _amount];
    private _killText = format ["Confirmed Kills: %1", _killCount];
    private _conductedText = format ["Total Conducted Missions: %1", _conductedMissions];
    private _successfulText = format ["Total Successful Missions: %1", _successfulMissions];
    private _arrestedHVTText = format ["Total Arrested HVTs: %1", _arrestedHVTs];
    private _killedHVTText = format ["Total Killed HVTs: %1", _killedHVTs];

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

    // Personal Statistic
    ctrlSetText [REC_MoneyTextIDC, _moneyText];
    ctrlSetText [REC_TotalConductedIDC, _conductedText];
    ctrlSetText [REC_TotalCompletedIDC, _successfulText];
    ctrlSetText [REC_ConfirmedKillsIDC, _killText];
    ctrlSetText [REC_ActiveTaskIDC, _activeTask];
    ctrlSetText [REC_TotalArrestedHVTIDC, _arrestedHVTText];
    ctrlSetText [REC_TotalKilledHVTIDC, _killedHVTText];

    // Wanted List
    lbClear REC_WantedListBoxIDC;

    if (count REC_WantedList > 0) then 
    {
        {
            private _wantedName = _x # 0;
            private _wantedValue = _x # 3;
            private _text = format ["%1milcash: %2", _wantedValue, _wantedName];

            lbAdd [REC_WantedListBoxIDC, _text];
        }
        forEach REC_WantedList;
    } else 
    {
        lbAdd [REC_WantedListBoxIDC, parseText "No persons of interest<br />at this moment."];
    };
};