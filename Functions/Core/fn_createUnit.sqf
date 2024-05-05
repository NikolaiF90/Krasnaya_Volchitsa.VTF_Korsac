params ["_group", "_type", "_position"];

private _returnValue = nil;
private _unit = _group createUnit [_type, _position, [], 0, "FORM"];
[_unit] call AIS_System_fnc_loadAIS;
["SETMONEY", [_unit, Economy_PlayerStartingMoney]] call F90_fnc_economyHandler;

Mission_CreatedUnits pushBack _unit;

_returnValue = _unit;
_returnValue;