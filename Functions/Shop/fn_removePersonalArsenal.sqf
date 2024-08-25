params ["_target", "_caller"];

// Save arsenal inventory 
private _inventory = [_target] call F90_fnc_generateCargoData;
[_caller, _inventory] call F90_fnc_setPersonalArsenal;
// Delete arsenal box
deleteVehicle _target;

["RSW_RemovePersonalArsenalActionCreated"] call F90_fnc_removeVariable;
_caller setVariable ["RSW_PersonalArsenalCreated", false, true];

["Personal Arsenal has been saved", "DEFAULT"] call F90_fnc_textNotification;