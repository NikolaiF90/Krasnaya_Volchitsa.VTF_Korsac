/*
    Author: PrinceF90 
 
    Description: 
        This function creates an ambush group with a random size and composition at a specified marker location based on a given spawn percentage. 
    
    Parameter(s): 
        0: INT - _minGroup: the minimum count of group(s) to spawn.
        1: INT - _maxGroup: the maximum count of group(s) to spawn.
        2: ARRAY - _position: the position for spawning the patrol groups.
    
    Returns:  
        _groupArray - Array of created groups
*/

params ["_minGroup", "_maxGroup", "_position"];

private _returnValue = nil;
private _groupCount = [_minGroup, _maxGroup] call BIS_fnc_randomInt;
private _createdGroups = [];

for "_i" from 1 to _groupCount do 
{
    private _spawnPos = _position;
    private _group = createGroup [west, true];
    private _groupSize = [2, 6] call BIS_fnc_randomInt;

    for "_j" from 1 to _groupSize do 
    {
        private _unitClass = selectRandom Mission_WestFIAUnits;
        private _unit = [_group, _unitClass, _position] call F90_fnc_createUnit;
    };
    _createdGroups pushBack _group;
    
    [_group, _position, 100] call BIS_fnc_taskPatrol;
};

_returnValue = _createdGroups;

_returnValue;