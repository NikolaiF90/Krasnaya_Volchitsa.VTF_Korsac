params ["_unit"];

if (dialog) then 
{
    closeDialog 2;
};

private _created = createDialog "tacticalMenu";

if (_created) then 
{
    // Get data
    private _amount = ["GETMONEY", _unit] call F90_fnc_economyHandler;
    private _killCount = _unit getVariable "Record_ConfirmedKills";
    private _conductedMissions = _unit getVariable "Record_TotalConductedMissions";
    private _successfulMissions = _unit getVariable "Record_TotalSuccessfulMissions";
    private _arrestedHVTs = _unit getVariable "Record_TotalArrestedHVT";
    private _killedHVTs = _unit getVariable "Record_TotalKilledHVT";
    private _notificationList = _unit getVariable "Record_RecentNotification";
    private _playerUID = _unit getVariable "Record_PlayerUID";
    private _playerName = name _unit;
    private _playerRank = [_unit] call F90_fnc_getUnitRank;
    private _totalOP = [_unit] call F90_fnc_getTotalOP;

    // Player info
    private _nameRankText = format ["(%1)%2", _playerRank, _playerName];
    private _playerUIDText = format ["UID: %1", _playerUID];
    private _moneyText = format ["Milcash: %1", _amount];
    
    ctrlSetText [REC_NameAndRankTextIDC, _nameRankText];
    ctrlSetText [REC_PlayerIDTextIDC, _playerUIDText];
    ctrlSetText [REC_MoneyTextIDC, _moneyText];

    // Statistic
    private _statistic = 
    [
        format ["Total OP: %1", _totalOP],
        format ["Confirmed Kills: %1", _killCount],
        format ["Total Conducted Missions: %1", _conductedMissions],
        format ["Total Successful Missions: %1", _successfulMissions],
        format ["Total Arrested HVTs: %1", _arrestedHVTs],
        format ["Total Killed HVTs: %1", _killedHVTs]
    ];

    [REC_StatisticListBoxIDC, _statistic, -1] call F90_fnc_populateListBox;
    
    // Show recent notification 
    [REC_NotificationListBoxIDC, _notificationList, -1, 1] call F90_fnc_populateListBox;

    // Wanted List
    private _wanted = [];

    if (count REC_WantedList > 0) then 
    {
        {
            private _wantedName = _x # 0;
            private _wantedValue = _x # 3;
            private _text = format ["%1milcash: %2", _wantedValue, _wantedName];

            _wanted pushBack _text;
        }
        forEach REC_WantedList;
    } else 
    {
        // ToDo
        _wanted = [parseText "No persons of interest<br />at this moment."];
    };

    [REC_WantedListBoxIDC, _wanted, -1] call F90_fnc_populateListBox;
};