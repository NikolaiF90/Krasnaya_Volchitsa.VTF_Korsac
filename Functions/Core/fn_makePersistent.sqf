/*
    Author: PrinceF90

    Description:
        A function that manages the persistence of an object by adding it to a persistent array if it is not already present.

    Parameter(s):
        0: OBJECT - The object to be made persistent.
        1: ARRAY - The array containing persistent objects.

    Returns:
        None

    Examples:
        [_container, Persistent_ContainersToSave] call F90_fnc_makePersistent;
*/
params ["_object", "_persistentArray"];

private _objectID = _persistentArray find _object;

if (_objectID == -1) then 
{
    _persistentArray pushback _object;
    hint format ["%1 is now persistent.", _object];
} else 
{
    hint format ["%1 is already persistent.", _object];
};