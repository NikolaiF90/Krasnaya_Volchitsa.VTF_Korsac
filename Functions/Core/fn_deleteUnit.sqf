/*
    Author: PrinceF90

    Description:
        Deletes a unit from a list of created units and broadcasts the updated list if specified.

    Parameter(s):
        0: OBJECT - _unit: The unit to be deleted
        1: BOOL - _public: (Optional, default true) Indicates if the updated list should be made public

    Returns:
        None
*/
params ["_unit", "_public"];

private _index = Mission_CreatedUnits find _unit;
if (_index != -1) then
{
    Mission_CreatedUnits deleteAt _index;
};

if (isNil {_public}) then 
{
    _public = true;
};

if (_public) then 
{
    publicVariable "Mission_CreatedUnits";
};
deleteVehicle _unit;