// ToDo - Optimize
private _fromIndex = lbCurSel ChangeTransportHeliMenu_FromListBoxIDC;
private _selectedHeli = Support_TransportHelicopters select _fromIndex;
private _newData = Support_HelicoptersList select (lbCurSel ChangeTransportHeliMenu_ToListBoxIDC);
private _selectedHeliSlot = Support_HeliSlot select _fromIndex;
private _dropOffKey = (_selectedHeli select 0) getVariable "RSW_DropOffActionKey";

// Reset drop off action 
[_dropOffKey] call F90_fnc_removeVariable;

// Delete Old Heli
private _oldHeli = _selectedHeli select 0; 
private _oldGroup = group _oldHeli;

deleteVehicle _oldHeli;
{
    [_x] call F90_fnc_deleteUnit;
} forEach units _oldGroup;

// Remove related data
_selectedHeliSlot set [0, nil];

0 = [_selectedHeliSlot, _newData, _fromIndex, _dropOffKey] spawn 
{
    params ["_selectedHeliSlot", "_newData", "_fromIndex", "_dropOffKey"];
    // Give time for the script to delete the old Heli
    sleep 0.5;

    // Create new heli
    private _helipad = _selectedHeliSlot select 1;
    private _helicopter = createVehicle [_newData select 0, position _helipad, [], 0, "NONE"];
    _helicopter setDir (direction _helipad);

    // Spawn Crew 
    createVehicleCrew _helicopter;

    // Join allied side 
    private _group = createGroup [Mission_AlliedSide, true];
    {
        [_x] joinSilent _group;
    } forEach (units (group _helicopter));

    // Create heli variables 
    _helicopter setVariable ["RSW_OnTransportMission", false, true];
    _helicopter setVariable ["RSW_BasePosition", position _helipad, true];
    _helicopter setVariable ["RSW_IsIdle", true, true];
    _helicopter setVariable ["RSW_DropOffActionKey", _dropOffKey, true];

    Support_TransportHelicopters set [_fromIndex, [_helicopter, _newData select 1]];
    Support_HeliSlot set [_fromIndex, [[_helicopter, _newData select 1], _helipad]];

    // Create request drop off action
    [_helicopter, _dropOffKey] remoteExec ["F90_fnc_addTransportHeliAction", 0, true];
};

// Feedback 
["Transport Helicopter has been changed", "DEFAULT"] call F90_fnc_textNotification;

if (dialog) then {closeDialog 2};