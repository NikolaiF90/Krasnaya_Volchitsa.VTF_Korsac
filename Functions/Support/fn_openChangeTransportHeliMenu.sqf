if (dialog) then {closeDialog 2};

createDialog "changeTransportHeliMenu";

private _spawnedHeli = [];
{
    private _displayName = _x select 1;
    _spawnedHeli pushBack _displayName;
} forEach Support_TransportHelicopters;

[ChangeTransportHeliMenu_FromListBoxIDC, _spawnedHeli, 0] call F90_fnc_populateListBox;

private _toList = [];
{
    private _displayName = _x select 1;
    _toList pushBack _displayName;
} forEach Support_HelicoptersList;

[ChangeTransportHeliMenu_ToListBoxIDC, _toList, 0] call F90_fnc_populateListBox;