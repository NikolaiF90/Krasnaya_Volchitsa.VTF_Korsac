params ["_spawnPercentage", "_marker"];

private _random = floor random 101;
private _spawnPos = [[_marker]] call BIS_fnc_randomPos;

if (_spawnPercentage >= _random) then 
{
    [TaskDebug, "createAmbush", "Creating ambush group...", true] call F90_fnc_debug;
    private _group = createGroup [west, true];
    private _groupSize = [4, 16] call BIS_fnc_randomInt;
    for "_i" from 0 to _groupSize do 
    {
        private _random = floor random (count Mission_WestFIAUnits);
        _unitClass = Mission_WestFIAUnits # _random;

        private _unit = [_group, _unitClass, _spawnPos] call F90_fnc_createUnit;
    };

    sleep 1;
    private _wp1 = _group addWaypoint [markerPos _marker, 20];
    _wp1 setWaypointBehaviour "COMBAT";
    _wp1 setWaypointType "SAD";
};