/*
    Author: PrinceF90

    Description:
        Same as engine's deleteVehicle command, but this function is made specially for the mission since all created units will be added to Mission_CreatedUnits, and this function will handle the variable.

    Parameter(s):
        _unit - The unit to be removed [OBJECT]
        _public - (Optional, default true) Indicates if the updates should be made public [BOOL]

    Returns:
        None
*/
params ["_unit", "_public"];

// Remove SharpEye's marker first 
[] remoteExec ["F90_fnc_deleteMarked", 0, true];

if (_unit in Mission_CreatedUnits) then 
{
    private _index = Mission_CreatedUnits find _unit;
    Mission_CreatedUnits deleteAt _index;

    if (isNil {_public}) then 
    {
        _public = true;
    };

    if (_public) then 
    {
        publicVariable "Mission_CreatedUnits";
    };
};
deleteVehicle _unit;