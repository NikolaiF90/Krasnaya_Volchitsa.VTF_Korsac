/*
    Author: PrinceF90

    Description:
        This function filters a list of houses based on certain criteria to find habitable houses.

    Parameter(s):
        _houseList - The list of houses to be filtered. [ARRAY]

    Returns:
        _habitableHouse - The list of habitable houses after applying the filtering criteria.
*/
params ["_houseList"];

private _habitableHouse = [];

{
    if (! (isobjecthidden _x) &&
        !(["estroy", gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString) &&
        !(["amage", gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString) &&
        !(["uin", gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString) &&
        !(["bandon", gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayname")] call BIS_fnc_inString)
    ) then {
        _habitableHouse pushBack _x;
    }
} forEach _houseList;

_habitableHouse