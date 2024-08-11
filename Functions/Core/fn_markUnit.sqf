params ["_killer", "_killed"];

private _opacity = _killer getVariable ["Skill_SharpEye", 0];

if (_opacity != 0) then 
{
    private _killerSide = _killer getVariable "RSW_UnitSide";
    private _killedSide = _killed getVariable "RSW_UnitSide";

    // Dont mark friendly kill or civilian kill
    if (_killerSide != _killedSide && _killedSide != civilian) then 
    {
        private _deadPos = position _killed;
        private _uniqueString = ["Killed"] call F90_fnc_generateUniqueID;
        private _markerType = "mil_warning";
        private _deadMarker = [[_uniqueString, true], _deadPos, _markerType] call F90_fnc_createMarker;

        // Configure the marker 
        _deadMarker setMarkerAlpha _opacity;
        _deadMarker setMarkerColor "ColorWhite";
        _deadMarker setMarkerSize [0.5, 0.5];

        Mission_SharpEyeMarkers pushBack [_killer, _killed, _deadMarker];
    };
};