private _object = cursorObject;

[format ["Deleting %1...", _object], "WARNING"] call F90_fnc_textNotification;

deleteVehicle _object;
private _objectIndex = Mission_CreatedUnits find _object;
if (_objectIndex != -1) then 
{
    Mission_CreatedUnits deleteAt _objectIndex;
};