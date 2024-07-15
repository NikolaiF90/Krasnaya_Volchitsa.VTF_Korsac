/*
    Author: PrinceF90

    Description:
        This function saves player data, vehicles, containers, variables, and map markers to a specified slot. If no slot is specified, it saves to a new slot.

    Parameter(s):
        _slot - (Optional, will save to a new slot if unspecified) The slot number to save the data to [SCALAR]

    Returns:
        _slot - The slot the save applied to
*/
params ["_slot"];

// Save to new slot if not specified
if (isNil {_slot}) then 
{
    private _persistentSaves = profileNamespace getVariable Persistent_PersistentListKey;
    _slot = count _persistentSaves;
};

[_slot] call F90_fnc_savePlayer;
[_slot] call F90_fnc_saveVehicles;
[_slot] call F90_fnc_saveContainers;
[_slot] call F90_fnc_saveVariables;
[_slot] call F90_fnc_saveMapMarkers;

saveMissionProfileNamespace;

_slot