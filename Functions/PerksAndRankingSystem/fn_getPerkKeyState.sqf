params ["_unit", "_perkKey"];

private _unlocked = false;

private _perks = _unit getVariable "PRS_Perks";

{
    private _perk = _x;
    private _key = _perk select 0;
    if (_key == _perkKey) then 
    {
        _unlocked = _perk select 1;
    };
} forEach _perks;

_unlocked