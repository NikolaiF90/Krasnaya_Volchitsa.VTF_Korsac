/*
    The economy system is responsible for ensuring that all players and spawned units have in-game currency.
    This system includes a function called F90_fnc_economyHandler, which manages all monetary operations such as "SETMONEY," "GETMONEY," "ADDMONEY," and "DEDUCTMONEY." 
*/
params [["_unit", player]];

private _money = ["SETMONEY", [_unit, Economy_PlayerStartingMoney]] call F90_fnc_economyHandler;

[MissionDebug, "initEconomy", format ["%1 milcash has been given to %2", _money, name _unit], true] call F90_fnc_debug;
