private _configurationFiles  = 
[
    F90_fnc_configureCAB,
    F90_fnc_configureDSC,
    F90_fnc_configureEconomy,
    F90_fnc_configureIdentity,
    F90_fnc_configurePersistent,
    F90_fnc_configurePRS,
    F90_fnc_configureREC,
    F90_fnc_configureSHARS,
    F90_fnc_configureShop,
    F90_fnc_configureSkillTree,
    F90_fnc_configureSupport,
    F90_fnc_configureTask
];

{
    private _function = _x;
    [] call _function;
} forEach _configurationFiles;

if (isServer && hasInterface) then {Server_Configured = true};