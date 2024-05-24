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
    ctrlSetText [VCR_MoneyTextIDC, _moneyText];
    ctrlSetText [VCR_TotalConductedIDC, _conductedText];
    ctrlSetText [VCR_TotalCompletedIDC, _successfulText];
    ctrlSetText [VCR_ConfirmedKillsIDC, _killText];
    ctrlSetText [VCR_ActiveTaskIDC, _activeTask];
    ctrlSetText [VCR_TotalArrestedHVTIDC, _arrestedHVTText];
    ctrlSetText [VCR_TotalKilledHVTIDC, _killedHVTText];

    // Wanted List
    lbClear VCR_WantedListBoxIDC;

    if (count CAB_WantedList > 0) then 
    {
        {
            private _wantedName = _x # 0;
            lbAdd [VCR_WantedListBoxIDC, _wantedName];
        }
        forEach CAB_WantedList;
    } else 
    {
        private _text1 = "No persons of interest";
        private _text2 = "at this moment."
        lbAdd [VCR_WantedListBoxIDC, format ["%1\n%2", _text1, _text2]];
    };
    
};