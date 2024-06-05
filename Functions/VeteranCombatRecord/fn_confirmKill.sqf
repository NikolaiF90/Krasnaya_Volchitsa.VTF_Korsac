params ["_killed", "_killer"];

private _killer = _killed getVariable ["Record_UnitKiller", objNull];

if (!isNull _killer && (side _killer != side _killed)) then 
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
};
