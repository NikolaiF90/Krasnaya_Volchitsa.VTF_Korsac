/*
    Author: PrinceF90

    Description:
        This function retrieves vehicles from a specific faction. The function returns an ARRAY: (vehicle class name and display name).

    Parameter(s):
        _faction - The faction to extract the vehicles from. [STRING]

    Returns:
        _factionVehicles - An array containing vehicle data (vehicle class name and display name) for vehicles belonging to the specified faction.
*/
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

private _factionVehicles = [];

{
    private _vehicleFaction = getText (_config >> _x >> "faction");

    if (_vehicleFaction isEqualTo _faction) then 
    {
        private _displayName = getText (_config >> _x >> "displayName");
        private _vehicleData = [_x, _displayName];
        _factionVehicles pushBack _vehicleData;
    };
} forEach _vehicles;

if (count _factionVehicles < 2) then 
{
    _factionVehicles = [];
    _factionVehicles = ["BLU_G_F"] call F90_fnc_getFactionVehicles;
};

_factionVehicles
