private _markerIcon = "mil_triangle";
private _allMarkers = 
[
    ["Reporting Officer", Mission_TaskOfficer, _markerIcon],
    ["Personnel Officer", PRS_PersonnelOfficer, _markerIcon],
    ["Infirmary", infirmaryX, _markerIcon],
    ["Barracks", reserveX, _markerIcon],
    ["Repair Station", repairX, _markerIcon],
    ["Shooting Range", skillDesk, _markerIcon]
];

{
    private _item = _x;
    private _markerName = [_item select 0, _item select 1, _item select 2] call F90_fnc_createMarker;
    _markerName setMarkerText _markerName;
    _markerName setMarkerColor "ColorWhite";
} forEach _allMarkers;