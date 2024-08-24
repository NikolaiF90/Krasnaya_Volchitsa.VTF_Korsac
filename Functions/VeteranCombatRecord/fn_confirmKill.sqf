params ["_killed", "_caller"];

private _killer = _killed getVariable ["Record_UnitKiller", objNull];
private _killedSide = [_killed] call F90_fnc_getUnitSide;

if (_caller == _killer) then 
{
    if (!isNull _killer && (side _killer != _killedSide)) then 
    {
        // Check for HVT
        private _isHVT = _killed getVariable ["Record_IsHVT", false];
        if (_isHVT) then 
        {
            private _unitName = name _killed;

            ["KILL", [_killer, _killed]] call F90_fnc_updateWantedList;
        };
        [_killer, _killed] call F90_fnc_addKillCount;

        // Intels 
        private _chance = random 101;

        if (CAB_IntelDropChance >= _chance) then 
        {
            private _addedPOI = [1] call F90_fnc_addWantedPerson;
            {
                REC_WantedList pushBack _x;
            } forEach _addedPOI;
            publicVariable "REC_WantedList";
            
            [["You have found an intel. ", format ["%1 has been added to your wanted list", (_addedPOI select 0) select 0]], "DEFAULT"] call F90_fnc_textNotification;
        };

        // Delete SharpEye marker if any 
        [_killed] spawn F90_fnc_deleteMarked;
    };
} else 
{
    // Check for HVT
    private _isHVT = _killed getVariable ["Record_IsHVT", false];
    if (_isHVT) then 
    {
        private _unitName = name _killed;

        ["KILL", [_killer, _killed]] call F90_fnc_updateWantedList;
        [format ["%1 is confirmed KIA", _unitName], "DEFAULT"] call F90_fnc_textNotification;
    } else
    {
        ["It's not your kill", "WARNING"] call F90_fnc_textNotification;
    };
};
