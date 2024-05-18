/*
    Author: PrinceF90

    Description:
        This function creates two markers, one for a zone itself and one for a marker, at a specified location with specific dimensions and properties. e.g ["Patrol", getMarkerPos "Marker1", 100, 100, 0] call F90_fnc_createAOMarker;

    Parameter(s):
        0: STRING - _taskName: This is for the generation of marker name
        1: ARRAY - _location: Position format AGL where the marker will be shown on map
        2: NUMBER - _areaX: zone X dimension
        3: NUMBER - _areaY: zone Y dimension
        4: NUMBER - _areaDirection: Rotation of the zone in map

    Returns:
        None
*/

params ["_taskName", "_location", "_areaX", "_areaY", "_areaDirection"];

// Delete existing marker
if (!isNil {Task_AoZone}) then {deleteMarker Task_AoZone};
if (!isNil {Task_AoMarker}) then {deleteMarker Task_AoMarker};

private _zoneName = [format ["%1Zone", _taskName]] call F90_fnc_generateUniqueID;
private _markerName = [format ["%1Marker", _taskName]] call F90_fnc_generateUniqueID;

Task_AoZone = createMarker [_zoneName, _location];
Task_AoZone setMarkerAlpha 1;
Task_AoZone setMarkerBrush "FDiagonal";
Task_AoZone setMarkerColor "ColorRed";
Task_AoZone setMarkerDir _areaDirection;
Task_AoZone setMarkerShape "Rectangle";
Task_AoZone setMarkerSize [_areaX, _areaY];

Task_AoMarker = createMarker [_markerName, _location];
Task_AoMarker setMarkerAlpha 1;
Task_AoMarker setMarkerColor "ColorWhite";
Task_AoMarker setMarkerDir 0;
Task_AoMarker setMarkerText Task_DutyName;
Task_AoMarker setMarkerType "hd_dot";

// Blacklist marker from saving
Persistent_MarkerBlacklists pushBack Task_AoMarker;
Persistent_MarkerBlacklists pushBack Task_AoZone;