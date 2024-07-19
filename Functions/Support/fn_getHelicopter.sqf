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

_helicopter