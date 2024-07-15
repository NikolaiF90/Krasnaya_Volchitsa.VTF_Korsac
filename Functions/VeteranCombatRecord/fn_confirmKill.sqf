params ["_killed", "_caller"];

private _killer = _killed getVariable ["Record_UnitKiller", objNull];
private _killedSide = _killed getVariable ["Mission_UnitSide", civilian];

if (_caller == _killer) then 
{
    if (!isNull _killer && (side _killer != _killedSide)) then 
    {
        // Check for HVT
        private _isHVT = _killed getVariable ["Record_IsHVT", false];
        if (_isHVT) then 
        {
            private _unitName = name _killed;

            private _hvtID = _killed getVariable "CAB_WantedID";

            ["KILL", [_killer, _killed, _hvtID]] call F90_fnc_updateWantedList;
        };
        [_killer] call F90_fnc_addKillCount;

        // Intels 
        private _chance = random 101;

        if (CAB_IntelDropChance >= _chance) then 
        {
            private _addedPOI = [1] call F90_fnc_addWantedPerson;
            [format ["You have found an intel<br />%1 has been added to your wanted list", (_addedPOI select 0) select 0], "DEFAULT", 4, 101, false] call F90_fnc_textNotification;
            [format ["You have found an intel. %1 has been added to your wanted list",(_addedPOI select 0) select 0], _caller] call F90_fnc_addToRecentNotification;
        };
    };
} else 
{
    // Check for HVT
    private _isHVT = _killed getVariable ["Record_IsHVT", false];
    if (_isHVT) then 
    {
        private _unitName = name _killed;

        private _hvtID = _killed getVariable "CAB_WantedID";

        ["KILL", [_killer, _killed, _hvtID]] call F90_fnc_updateWantedList;
        [format ["%1 is confirmed KIA", _unitName], "DEFAULT"] call F90_fnc_textNotification;
    } else
    {
        ["It's not your kill", "WARNING"] call F90_fnc_textNotification;
    };
};
