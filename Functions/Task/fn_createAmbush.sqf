/*
    Author: PrinceF90 
 
    Description: 
        This function creates an ambush group with a random size and composition at a specified marker location based on a given spawn percentage. 
    
    Parameter(s): 
        0: NUMBER - _spawnPercentage: Percentage chance for the ambush group to spawn
        1: ARRAY - _position: Can be ARRAY: [position3D] or STRING: "Marker" where the ambush group will spawn
    
    Returns:  
        None
*/

params ["_spawnPercentage", "_position"];

private _random = floor random 101;
private _spawnPos = [];

if (_position isEqualType []) then 
{
    _spawnPos = [_position, 200, 300, 5] call BIS_fnc_findSafePos;
} else 
{
    // If position is STRING
    _spawnPos = [[_position]] call BIS_fnc_randomPos;
    // Adjust the spawn position to 200 meters from initial position
    _spawnPos = [_spawnPos select 0 + 200, _spawnPos select 1 + 200, _spawnPos select 2];
};

if (_spawnPercentage >= _random) then 
{
    private _group = createGroup [Mission_EnemySide, true];
    private _groupSize = [4, 16] call BIS_fnc_randomInt;

    for "_i" from 1 to _groupSize do 
    {
        private _unitClass = selectRandom DSC_EnemyFaction;
        private _unit = [_group, _unitClass, _spawnPos, Mission_DefaultEnemySkill] call F90_fnc_createUnit;
    };
    sleep 1;
    private _wp1 = _group addWaypoint [markerPos _position, 20];
    _wp1 setWaypointBehaviour "AWARE";
    _wp1 setWaypointType "SAD";
};