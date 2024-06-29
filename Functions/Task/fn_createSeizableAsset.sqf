params ["_location"];

private _spawnPos = [_location, 5, 50] call BIS_fnc_findSafePos;
private _model = selectRandom Task_SeizableAssetModels;
private _seizableAsset = _model createVehicle _spawnPos;
_seizableAsset setVariable ["HasBeenSeized", false, true];

// Add seize action 
private _seizeActionID = _seizableAsset getVariable ["SeizeActionID", -1];
if (_seizeActionID != -1) then 
{
    [_seizableAsset, _seizeActionID, "SeizeActionID"] remoteExec ["F90_fnc_removeActionGlobal", 0, true];
};

[
    _seizableAsset, 
    "Seize Asset", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target, _caller] call F90_fnc_seizeAsset;
    }, 
    "(_target getVariable 'HasBeenSeized') == false && (alive _target) == true", 
    "SeizeActionID"
] remoteExec ["F90_fnc_addAction", 0, true];

Task_CreatedAssets pushBack _seizableAsset;