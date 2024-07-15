params ["_unit", "_perkKey"];

private _perks = _unit getVariable "PRS_Perks";
private _perkInfo = "";
private _perkFound = false;
{
    private _perk = _x;
    private _forEachKey = _perk select 0;
    if (_forEachKey == _perkKey) exitWith 
    {
        _perks set [_forEachIndex, [_perkKey, true]];
        _perkInfo = _perk select 2;
        _perkFound = true;
    };
} forEach _perks;

if (_perkFound) then 
{
    _unit setVariable ["PRS_Perks", _perks, true];

    // Notify player 
    if (isPlayer _unit) then 
    {
        [format ["You have unlocked the ability to %1", _perkInfo], "DEFAULT"] call F90_fnc_textNotification;
    } else 
    {
        [format ["%1 have unlocked the ability to %2", name _unit, _perkInfo], "DEFAULT"] call F90_fnc_textNotification;
    };
} else 
{
    [MissionDebug, "unlockPerk", format ["Perk key:%1 is not found", _perkKey]] call F90_fnc_debug;
};