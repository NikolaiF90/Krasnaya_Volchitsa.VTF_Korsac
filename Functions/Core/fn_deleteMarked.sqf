params ["_killed"];

private _killedData = [];

private _markersToDelete = [];

{
    private _markerData = _x;
    private _xKilled = _markerData select 1;
    private _index = _forEachIndex;

    if (isNil {_killed}) then 
    {
        // Remove the data if unit is nil or null
        _markersToDelete pushBack (_markerData select 2);
        Mission_SharpEyeMarkers deleteAt _index;
    } else
    {
        if (_xKilled == _killed) then
        {
            _markersToDelete pushBack (_markerData select 2);
            Mission_SharpEyeMarkers deleteAt _index;
        };
    };
} forEach Mission_SharpEyeMarkers;

{
    [_x] call F90_fnc_deleteMarker;
} forEach _markersToDelete;