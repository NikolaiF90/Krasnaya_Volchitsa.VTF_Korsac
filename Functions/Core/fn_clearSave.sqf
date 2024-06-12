/*
    Author: PrinceF90

    Description:
    	Removes all persisted data for given save _slot.

    Parameter(s):
        0: _slot(optional) - if not specified, all data persisted by this system will be removed
*/
params ["_slot"];
// private ["_variables"];

if (isNil "_slot") then
{
	//_variables = [] call F90_fnc_listExistingVariables;
} else
{
	//_variables = [_slot] call F90_fnc_listExistingVariables;
};

/*
{
	profileNamespace setVariable [_x, nil];
} forEach _variables;

saveProfileNamespace;
*/