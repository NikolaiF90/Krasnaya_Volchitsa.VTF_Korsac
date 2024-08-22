/*
    Author: PrinceF90

    Description:
        Function to get all helicopters from a list of vehicles.

    Parameter(s):
        _vehicleList - List of vehicles to get the helicopter from. [ARRAY]

    Returns:
        _helicopters - An array containing vehicle data (class name and display name) for helicopters.
*/
params ["_vehicleList"];

private _helicopters = [];

{
    private _vehicleData = _x;
    private _className = _vehicleData select 0;
    private _displayName = _vehicleData select 1;

    private _config = configFile >> "CfgVehicles";
    private _vehicleConfig = _config >> _className;

    private _mainBladeCenter = getText (_vehicleConfig >> "_mainBladeCenter");

    if !((isNil {_mainBladeCenter}) || (_mainBladeCenter isEqualTo "")) then 
    {
        _helicopters pushBack _vehicleData;
    };
} forEach _vehicleList;

if ((count _helicopters) <= 2) then 
{
    _helicopters = [];
    private _tempVehicleList = ["BLU_F"] call F90_fnc_getFactionVehicles;
    _helicopters = [_tempVehicleList] call F90_fnc_getHelicopter;
};

_helicopters