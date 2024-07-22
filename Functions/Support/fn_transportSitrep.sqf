private _caller = player;

private _selectedItem = Support_TransportHelicopters select (lbCurSel TransportSMenu_VehiclesListBoxIDC);
private _transportVehicle = _selectedItem select 0;

private _status = "";
if (alive _transportVehicle) then 
{
    if (_transportVehicle getVariable "RSW_OnTransportMission") then 
    {
        _status = "On Transport Mission";
    } else 
    {
        _status = "Idle";
    };
} else 
{
    _status = "Destroyed";
};

[format ["%1 Status: %2", _selectedItem select 1, _status], "DEFAULT"] call F90_fnc_textNotification;