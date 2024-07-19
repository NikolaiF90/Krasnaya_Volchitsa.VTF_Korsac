params ["_helicopter", "_caller", "_dropOffPoint"];

if !(alive _helicopter) exitWith {};

if ((_helicopter getVariable "Mission_IsIdle")) then 
{
    _helicopter setVariable ["Mission_IsIdle", false, true];
    private _heliWaitingTime = 3;

    // Feedback
    private _requestChat = format ["Requesting for a drop-off at map position: Grid %1.", mapGridPosition _dropOffPoint];
    [_caller, _requestChat] remoteExec ["sideChat", 0];
    sleep _heliWaitingTime;
    [_helicopter, "Affirmative!"] remoteExec ["sideChat", 0];

    // Create marker 
    private _dropOffMarker = [["DropOff", true], _dropOffPoint, "mil_pickup"] call F90_fnc_createMarker;
    _dropOffMarker setMarkerText "Drop-Off Point";

    private _transportReady = false;

    _helicopter move _dropOffPoint;

    sleep _heliWaitingTime;
    [_helicopter, "Preparing to take off."] remoteExec ["sideChat", 0];

    sleep _heliWaitingTime;
    // Get Cargo 
    private _cargoCrew = fullCrew [_helicopter, "cargo"];
    private _cargoUnits = [];
    {
        _cargoUnits pushBack (_x select 0);
    } forEach _cargoCrew;

    // Arrive Check
    while {alive _helicopter && !(unitReady _helicopter)} do 
    {
        sleep 1;
    };
    // Land
    if (alive _helicopter && unitReady _helicopter) then 
    {
        // Feedback
        [_helicopter, "We have arrived. Preparing to land."] remoteExec ["sideChat", 0];
        // Land
        _helicopter land "GET OUT";
        
        // Delete marker 
        [_dropOffMarker] call F90_fnc_deleteMarker;

        // RTB Check
        private _transportDone = false;
        while {alive _helicopter && !_transportDone} do
        {
            if (count _cargoUnits > 0) then
            {
                doGetOut _cargoUnits;
                {
                    if (objectParent _x != _helicopter) then 
                    {
                        _transportDone = true;
                    };
                    if (objectParent _x == _helicopter) exitWith
                    {
                        _transportDone = false;
                    };
                } forEach _cargoUnits;
            } else 
            {
                _transportDone = true;
            };

            sleep _heliWaitingTime;
        };

        _helicopter setVariable ["Mission_IsIdle", true, true];
        [_helicopter] spawn F90_fnc_requestRtb;
    };
} else 
{
    ["The transport vehicle is already on another mission", "ERROR"] call F90_fnc_textNotification;
};