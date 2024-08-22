Server_Configured = false;
// Configure scripts for all players
[] remoteExec ["F90_fnc_initModConfigurations", 0, true];

waitUntil {Server_Configured};

// All Init Scripts that should executed by the server
private _modFiles = 
[
    F90_fnc_initDSC,
    F90_fnc_initCivilian,
    F90_fnc_initCABServer,
    F90_fnc_initTask,
    F90_fnc_initSHARS,
    F90_fnc_initSupport,
    F90_fnc_initShop
];

{
    private _function = _x;
    [] call _function;
} forEach _modFiles;

if (isServer && hasInterface) then 
{
    Server_ModsInitialized = true;
};