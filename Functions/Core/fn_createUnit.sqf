/*
    Author: PrinceF90

    Description:
        This function creates a new unit for a given group at a specified position, loads injury system for the unit, sets starting money for the unit, and adds the unit to a list of created units.

    Parameter(s):
        0: OBJECT - _group: The group to which the unit belongs
        1: STRING - _type: The type/classname of unit to create
        2: ARRAY - _position: The position (format AGL) where the unit should be created

    Returns:
        OBJECT - The created unit
*/

params ["_group", "_type", "_position"];

private _returnValue = nil;
private _unit = _group createUnit [_type, _position, [], 0, "FORM"];
[_unit] call AIS_System_fnc_loadAIS;
["SETMONEY", [_unit, Economy_PlayerStartingMoney]] call F90_fnc_economyHandler;
[_unit] joinSilent _group;

Mission_CreatedUnits pushBack _unit;

_returnValue = _unit;
_returnValue;