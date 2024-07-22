if (dialog) then {closeDialog 2};

createDialog "transportSupportMenu";

private _transportNameList = [];

{
    _transportNameList pushBack (_x select 1);
} forEach Support_TransportHelicopters;

[TransportSMenu_VehiclesListBoxIDC, _transportNameList, 0] call F90_fnc_populateListBox;