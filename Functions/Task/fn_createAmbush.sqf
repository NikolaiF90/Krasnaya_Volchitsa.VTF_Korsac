/*
    Author: PrinceF90

    Description:
        Spawns a squad of enemy units based on a given spawn percentage and position.

    Parameter(s):
        _spawnPercentage - Percentage chance of spawning the enemy squad [SCALAR]
        _position - Position where the enemy squad will be spawned [ARRAY]
        _distance - (Optional) Distance range for finding a safe spawn position [ARRAY]

    Returns:
        None
*/
params ["_spawnPercentage", "_position", "_distance"];

private _random = floor random 101;
private _spawnPos = [];
private _spawnedUnits = [];

if (isNil {_distance}) then {_distance = [800, 1000]};
if (count _distance == 0) then {_distance = [800, 1000]};

_spawnPos = [_position, _distance select 0, _distance select 1, 5] call BIS_fnc_findSafePos;

if (_spawnPercentage >= _random) then 
{
    private _groupSize = [4, 16] call BIS_fnc_randomInt;
    private _group = [_groupSize, DSC_EnemyUnitList, _spawnPos, Mission_EnemySide, Mission_DefaultEnemySkill] call F90_fnc_createSquad;
    
    sleep 1;
    private _wp1 = _group addWaypoint [_position, 20];
    _wp1 setWaypointBehaviour "AWARE";
    _wp1 setWaypointType "SAD";

    {
        _spawnedUnits pushBack _x;
    } forEach units _group;
};

_spawnedUnits