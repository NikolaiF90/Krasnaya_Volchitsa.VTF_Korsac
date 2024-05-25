params ["_radius"];

private _returnValue = nil;

private _nearbyHouses = CAB_HousesNearPlayer select {_x distance player < _radius};

_nearbyHouses = _nearbyHouses select {!(isobjecthidden _x)};
_nearbyHouses = _nearbyHouses select {!(["estroy",gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString)}; 
_nearbyHouses = _nearbyHouses select {!(["amage",gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString)}; 
_nearbyHouses = _nearbyHouses select {!(["uin",gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString)}; 
_nearbyHouses = _nearbyHouses select {!(["bandon",gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString)}; 
_returnValue = _nearbyHouses; 

_returnValue