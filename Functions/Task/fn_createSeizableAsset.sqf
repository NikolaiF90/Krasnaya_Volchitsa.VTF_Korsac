params ["_location"];

private _spawnPos = [_location, 5, 50] call BIS_fnc_findSafePos;
private _model = selectRandom Task_SeizableAssetModels;
private _seizableAsset = _model createVehicle _spawnPos;
_seizableAsset setVariable ["HasBeenSeized", false, true];

// Add seize action
[
    _seizableAsset, 
    "Seize Asset", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target, _caller] call F90_fnc_seizeAsset;
    }, 
    "(_target getVariable 'HasBeenSeized') == false && (alive _target) == true", 
    "RSW_SeizeActionID"
] remoteExec ["F90_fnc_addAction", 0, true];

Task_CreatedAssets pushBack _seizableAsset;