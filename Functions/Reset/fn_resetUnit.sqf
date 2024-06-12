params ["_unit", "_defaultPosition"];

private _spawnPos = [_defaultPosition, 5, 10] call BIS_fnc_findSafePos;
_unit setPosATL [_spawnPos # 0, _spawnPos # 1, 0];
_unit setBehaviour "SAFE";
_unit setUnitPos "UP";
_unit setDamage 0;
_unit setFatigue 0;