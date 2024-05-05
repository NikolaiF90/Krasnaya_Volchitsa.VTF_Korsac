/*
    Author: Skhpersist(Original), PrinceF90(Revisited)

    Description:
        This script loads player data from a specified slot and then loads the unit data for the player.

    Parameter(s):
        0: NUMBER - The slot number from which player data will be loaded.

    Returns:
        None

    Examples:
        [1] call F90_fnc_loadPlayer;
*/
params ["_slot"];

[PersistentDebug, "loadPlayables", format ["Loading playables data from slot %1...", _slot], false]call F90_fnc_debug;

{
    private _key = format ["%1data", _x];
    private _unitData = [_key, _slot] call F90_fnc_loadData;
    [_x, _unitData, objNull] call F90_fnc_loadUnitData;
} forEach Mission_Playables;

[PersistentDebug, "loadPlayables", "Done loading playables data.", false]call F90_fnc_debug;