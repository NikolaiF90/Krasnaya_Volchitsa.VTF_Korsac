/*
    Author: PrinceF90

    Description:
        This function allows a player to seize an asset.

    Parameter(s):
        _target - The target asset to be seized. [OBJECT]
        _caller - The player attempting to seize the asset. [OBJECT]

    Returns:
        None
*/
params ["_target", "_caller"];

private _unlocked = [_caller, "PERK_SeizeAsset"] call F90_fnc_getPerkKeyState;

if (_unlocked) then 
{
    // Mark as seized
    _target setVariable ["HasBeenSeized", true, true];

    // Add player seized assets count
    private _seizedAssetsCount = _caller getVariable ["REC_TempSeized", 0];
    _seizedAssetsCount = _seizedAssetsCount + 1;
    _caller setVariable ["REC_TempSeized", _seizedAssetsCount, true];

    // Notify player
    ["Asset Seized", "DEFAULT"] call F90_fnc_textNotification;
} else 
{
    ["You do not have the permission to seize any assets", "ERROR"] call F90_fnc_textNotification;
};