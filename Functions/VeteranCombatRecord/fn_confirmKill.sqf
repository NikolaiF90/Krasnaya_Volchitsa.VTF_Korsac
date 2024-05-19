params ["_killed"];

private _killer = _killed getVariable "Record_UnitKiller";

if ((side _killer) != (side _killed)) then 
{
    // Check for HVT

    [_killer] call F90_fnc_addKillCount;
};
