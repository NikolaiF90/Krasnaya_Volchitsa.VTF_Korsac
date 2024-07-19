// Get allied vehicles
Support_AlliedFactionVehicles = [DSC_AlliedFaction] call F90_fnc_getFactionVehicles;

[] remoteExec ["F90_fnc_showPurchaseVehicleAction", 0, true];

Support_SpawnedUnarmedVehicles = [];
Support_SpawnedArmedVehicles = [];
// Format [[object, displayName]]
Support_TransportVehicles = [];

// Get Helicopter
private _helicopterList = [Support_AlliedFactionVehicles] call F90_fnc_getHelicopter;
private _transportHeliData = _helicopterList select 0;
// Spawn transport heli
private _transportheli = createVehicle [_transportHeliData select 0, position helipadX, [], 0, "NONE"];
_transportheli setDir (direction helipadX);
// Spawn Crew 
createVehicleCrew _transportheli;
// Create Heli var 
_transportheli setVariable ["Mission_OnTransportMission", false, true];
_transportheli setVariable ["Mission_BasePosition", position helipadX, true];
_transportheli setVariable ["Mission_IsIdle", true, true];
Support_TransportVehicles pushBack [_transportheli, _transportHeliData select 1];

// Create request drop off action
[_transportheli] remoteExec ["F90_fnc_addTransportHeliAction", 0, true];