/*
    Author: PrinceF90

    Description:
        Function to get all helicopters from a list of vehicles.

    Parameter(s):
        _vehicleList - List of vehicles to get the helicopter from. [ARRAY]

    Returns:
        _helicopter - An array containing vehicle data (class name and display name) for helicopters.
*/
params ["_vehicleList"];

private _helicopter = [];

{
    private _vehicleData = _x;
    private _className = _vehicleData select 0;
    private _displayName = _vehicleData select 1;

    private _config = configFile >> "CfgVehicles";
    private _vehicleConfig = _config >> _className;

    private _mainBladeCenter = getText (_vehicleConfig >> "_mainBladeCenter");

    if !((isNil {_mainBladeCenter}) || (_mainBladeCenter isEqualTo "")) then 
    {
        _helicopter pushBack _vehicleData;
    };
} forEach _vehicleList;

if (count _helicopter <= 1) then 
{
    _helicopter = [];
    _vehicleList = ["BLU_G_F"] call F90_fnc_getFactionVehicles;
    _helicopter = [_vehicleList] call F90_fnc_getHelicopter;
};

_helicopter