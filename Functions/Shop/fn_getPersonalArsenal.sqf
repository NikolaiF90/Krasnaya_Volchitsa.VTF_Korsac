/*
    Author: PrinceF90

    Description:
        Retrieves the personal arsenal inventory of a specified unit.

    Parameter(s):
        _unit - The unit from which to retrieve the personal arsenal. [OBJECT]

    Returns: 
        _arsenal - The personal arsenal inventory of the unit, or an empty array if none exists.
*/
params ["_unit"];

private _arsenal = _unit getVariable ["RSW_PersonalArsenal", nil];

if (isNil {_arsenal}) then 
{
    _arsenal =
    [
        ["items", []],
        ["magazines", []],
        ["weapons", []],
        ["containers", []],
        ["backpacks", []]
    ];
};

_arsenal