params ["_target", "_caller"];

// Create arsenal box 
private _arsenalBox = "VirtualReammoBox_small_F" createVehicle [0,0,0];
_caller setVariable ["RSW_PersonalArsenalBox", _arsenalBox, true];

// Get persistent arsenal inventory 
private _arsenal = [_caller] call F90_fnc_getPersonalArsenal;
// Fill arsenal box 
[_arsenalBox, _arsenal] call F90_fnc_applyCargoData;
// Add remove action 
[
    _arsenalBox,
    "Save Arsenal",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target, _caller] call F90_fnc_removePersonalArsenal;
    },
    "alive _this && alive _target",
    "RSW_RemovePersonalArsenalActionCreated"
] call F90_fnc_addAction;
// Teleport the box 
[_arsenalBox, _caller, 180] call F90_fnc_teleportObject;

_caller setVariable ["RSW_PersonalArsenalCreated", true, true];

["Personal Arsenal Box has been created for you. Check behind you", "DEFAULT"] call F90_fnc_textNotification;