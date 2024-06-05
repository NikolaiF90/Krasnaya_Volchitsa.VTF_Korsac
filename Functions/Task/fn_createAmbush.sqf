/*
    Author: PrinceF90 
 
    Description: 
        This function creates an ambush group with a random size and composition at a specified marker location based on a given spawn percentage. 
    
    Parameter(s): 
        0: SCALAR - _spawnPercentage: Percentage chance for the ambush group to spawn
        1: OBJECT - _marker: Marker object where the ambush group will spawn
    
    Returns:  
        _group - Created group
*/

params ["_spawnPercentage", "_marker"];

private _random = floor random 101;
private _spawnPos = [[_marker]] call BIS_fnc_randomPos;
private _returnValue = nil;

if (_spawnPercentage >= _random) then 
{
    [TaskDebug, "createAmbush", "Creating ambush group...", true] call F90_fnc_debug;
    private _group = createGroup [west, true];
    private _groupSize = [4, 16] call BIS_fnc_randomInt;

    for "_i" from 0 to _groupSize do 
    {
        private _unitClass = selectRandom Mission_WestFIAUnits;
        private _unit = [_group, _unitClass, _spawnPos] call F90_fnc_createUnit;
    };
    sleep 1;
    private _wp1 = _group addWaypoint [markerPos _marker, 20];
    _wp1 setWaypointBehaviour "COMBAT";
    _wp1 setWaypointType "SAD";
    _returnValue = _group;
};

_returnValue;