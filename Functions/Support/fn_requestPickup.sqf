private _caller = player;

private _selectedItem = Support_TransportVehicles select (lbCurSel TransportSMenu_VehiclesListBoxIDC);
private _transportVehicle = _selectedItem select 0;

if (!(isNil {_transportVehicle}) && alive _transportVehicle && !(_transportVehicle getVariable "Mission_OnTransportMission")) then 
{
    if (dialog) then {closeDialog 2};

    openMap [true, true];
    [_caller, _transportVehicle] onMapSingleClick 
    {
        [_this select 0, _this select 1, _pos] spawn 
        {
            params ["_caller", "_transportVehicle", "_pickupPoint"];
            
            if !(alive _transportVehicle) exitWith {};

            if ((_transportVehicle getVariable "Mission_IsIdle")) then 
            {
                _transportVehicle setVariable ["Mission_IsIdle", false, true];

                private _requestChat = format ["Requesting for a pickup at location: Grid %1", mapGridPosition _pickupPoint];
                [_caller, _requestChat] remoteExec ["sideChat", 0];

                private _pickupMarker = [["Pickup", true], _dropOffPoint, "mil_pickup"] call F90_fnc_createMarker;
                _pickupMarker setMarkerText "Pickup Point";

                _transportVehicle setVariable ["Mission_OnTransportMission", true, true];
                _transportVehicle move _pickupPoint;
                [_transportVehicle, "Affirmative!"] remoteExec ["sideChat", 0];

                // Arrive Check
                while {alive _transportVehicle && !(unitReady _transportVehicle)} do 
                {
                    sleep 1;
                };
                // Land
                if (alive _transportVehicle && unitReady _transportVehicle) then 
                {
                    _transportVehicle land "GET IN";
                    [_pickupMarker] call F90_fnc_deleteMarker;
                    _transportVehicle setVariable ["Mission_IsIdle", true, true];
                };
            } else 
            {
                ["The transport vehicle is already on another mission", "ERROR"] call F90_fnc_textNotification;
            };
        };
        onMapSingleClick "";
        openMap [false, false];
    };
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

    if (_transportVehicle getVariable "Mission_OnTransportMission") then 
    {
        ["Transport vehicle is already assigned for another task", "ERROR"] call F90_fnc_textNotification;
    };
}