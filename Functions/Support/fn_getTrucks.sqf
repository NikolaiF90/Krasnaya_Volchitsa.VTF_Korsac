/*
    Author: PrinceF90

    Description:
        Function to get trucks from specified vehicle list. This function returns an array containing the classnames of obtained trucks.

    Parameter(s):
        _vehicleList - List of vehicles to get the truck from. [ARRAY]

    Returns:
        _trucks - An array containing the classnames of obtained trucks
*/
params ["_vehicleList"];

private _keywords = ["truck"];

private _trucks = [];
{
    private _vehicleClass = _x select 0;
    private _splittedName = _vehicleClass splitString "-_, ";

    {
        private _keyword = _x;

        if (_keyword in _splittedName) then 
        {
            if !(_vehicleClass in _trucks) then 
            {
                _trucks pushBack _vehicleClass;
            };
        };
    } forEach _keywords;
} forEach _vehicleList;

if (count _trucks <= 1) then 
{
    _trucks = [];
    _vehicleList = ["BLU_G_F"] call F90_fnc_getFactionVehicles;
    _trucks = [_vehicleList] call F90_fnc_getTrucks;
};

_trucks