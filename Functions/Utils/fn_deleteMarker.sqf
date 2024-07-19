/*
    Author: PrinceF90

    Description:
        This function removes a marker from the Persistent_MarkerBlacklists array and deletes the specified marker.

    Parameter(s):
        _markerName - The name of the marker to be removed and deleted. [STRING]

    Returns:
        None
*/
params ["_markerName"];

if (_markerName in Persistent_MarkerBlacklists) then 
{
    private _index = Persistent_MarkerBlacklists find _markerName;
    Persistent_MarkerBlacklists deleteAt _index;
};

deleteMarker _markerName;