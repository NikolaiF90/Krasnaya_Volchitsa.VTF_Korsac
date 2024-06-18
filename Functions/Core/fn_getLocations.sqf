/*
    Author: PrinceF90

    Description:
        This function retrieves locations across the map based on the specified types.

    Parameter(s):
        0: ARRAY - Optional, default "NameCityCapital". Array containing location types to search for. Can be one of "NameLocal", "NameVillage", "NameCity", "NameCityCapital".

    Returns: 
        ARRAY - Array of locations with information formatted [[location name, position, direction, size, isRectangle]]
*/

params ["_type"];

private _locations = [];
if (count _type < 1) then 
{
    _type = ["NameCityCapital"];
};

{
    {
        _locations pushBack [text _x, locationPosition _x, direction _x, size _x, rectangular _x];
    } forEach (nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_x], worldSize]);
} forEach _type;

_locations