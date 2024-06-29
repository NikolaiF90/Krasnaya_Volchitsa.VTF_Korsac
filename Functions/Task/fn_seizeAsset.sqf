params ["_target", "_caller"];

// Mark as seized
_target setVariable ["HasBeenSeized", true, true];

// Add player seized assets count
private _seizedAssetsCount = _caller getVariable ["REC_TempSeized", 0];
_seizedAssetsCount = _seizedAssetsCount + 1;
_caller setVariable ["REC_TempSeized", _seizedAssetsCount, true];

// Notify player
["Asset Seized", "DEFAULT"] call F90_fnc_textNotification;