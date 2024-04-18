/*
    The economy system is responsible for ensuring that all players and spawned units have in-game currency.
    This system includes a function called F90_fnc_economyHandler, which manages all monetary operations such as "SETMONEY," "GETMONEY," "ADDMONEY," and "DEDUCTMONEY." 
*/

[EconomyDebug, "initEconomy", "Initializing economy system...", true] call F90_fnc_debug;

{
    ["SETMONEY", [_x, Economy_PlayerStartingMoney]] call F90_fnc_economyHandler;
    [EconomyDebug, "initEconomy", "Milcash has been given to all players.", false] call F90_fnc_debug;
} forEach allPlayers;

[EconomyDebug, "initEconomy", "Done initializing economy system.", true] call F90_fnc_debug;