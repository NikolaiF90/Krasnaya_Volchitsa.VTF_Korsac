// Configuration
Support_InfirmaryObject = infirmaryX;
Support_SupportDesk = supportDesk;

// Init 

// Get allied vehicles
Support_AlliedFactionVehicles = [DSC_AlliedFaction] call F90_fnc_getFactionVehicles;

[] remoteExec ["F90_fnc_showPurchaseVehicleAction", 0, true];

// Format [[object, displayName]]
Support_TransportHelicopters = [];
// Stores all temporary support team members
Task_TempTeamMembers = [];

// Holds helidata and its helipad
Support_HeliSlot = [[nil, helipadX_0], [nil, helipadX_1]];
// Get Helicopter
Support_HelicoptersList = [Support_AlliedFactionVehicles] call F90_fnc_getHelicopter;
// Get Trucks 
Support_TruckList = [Support_AlliedFactionVehicles] call F90_fnc_getTrucks;

// Create transport vehicles 
[] call F90_fnc_createTransportVehicles;

// Init heal 
[] remoteExec ["F90_fnc_initHeal", 0, true];

// Create Support Officer 
[] call F90_fnc_createSupportOfficer;