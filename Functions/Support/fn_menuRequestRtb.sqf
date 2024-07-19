private _caller = player;

private _selectedItem = Support_TransportVehicles select (lbCurSel TransportSMenu_VehiclesListBoxIDC);
private _transportVehicle = _selectedItem select 0;

if (!(isNil {_transportVehicle}) && alive _transportVehicle && (_transportVehicle getVariable "Mission_OnTransportMission")) then 
{
    [_transportVehicle] spawn F90_fnc_requestRtb;
} else 
{
    if (isNil {_transportVehicle}) then 
    {
        ["Transport vehicle is not exist", "ERROR"] call F90_fnc_textNotification;
    };

    if !(alive _transportVehicle) then 
    {
        [format ["No response from %1", _selectedItem select 1], "WARNING"] call F90_fnc_textNotification;
    };

    if !(_transportVehicle getVariable "Mission_OnTransportMission") then 
    {
        ["Transport vehicle is already at the base", "ERROR"] call F90_fnc_textNotification;
    };
}