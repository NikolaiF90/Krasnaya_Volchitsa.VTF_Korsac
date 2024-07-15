/*
    Author: PrinceF90

    Description:
        Spawns a group of enemy units 800m-1km from provided position based on a given spawn percentage.

    Parameter(s):
        _spawnPercentage - The percentage chance of spawning the enemy group [SCALAR]
        _position - The position where the enemy group will perform an ambush task [ARRAY]

    Returns:
        None
*/
params ["_spawnPercentage", "_position"];

private _random = floor random 101;
private _spawnPos = [];

_spawnPos = [_position, 800, 1000, 5] call BIS_fnc_findSafePos;

if (_spawnPercentage >= _random) then 
{
    private _groupSize = [4, 16] call BIS_fnc_randomInt;
    private _group = [_groupSize, DSC_EnemyUnitList, _spawnPos, Mission_EnemySide, Mission_DefaultEnemySkill] call F90_fnc_createSquad;
    
    sleep 1;
    private _wp1 = _group addWaypoint [_position, 20];
    _wp1 setWaypointBehaviour "AWARE";
    _wp1 setWaypointType "SAD";
};