params ["_faction"];

private _config = configFile >> "CfgVehicles";
private _allVehicles = [_config] call BIS_fnc_getCfgSubClasses;

private _vehicles = [];
{
    private _fuelCapacity = getNumber (_config >> _x >> "fuelCapacity");
    if (!(isNil {_fuelCapacity}) && _fuelCapacity > 0) then 
    {
        _vehicles pushBack _x;
    };
} forEach _allVehicles;

private _factionVehicle = [];


{
    private _vehicleFaction = getText (_config >> _x >> "faction");

    if (_vehicleFaction isEqualTo _faction) then 
    {
        private _displayName = getText (_config >> _x >> "displayName");
        private _vehicleData = [_x, _displayName];
        _factionVehicle pushBack _vehicleData;
    };
} forEach _vehicles;

_factionVehicle
