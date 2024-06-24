params ["_unit"];

// Every player will have the variable, but its unique for each player. Any changes won't be synchronized across network
_unit setVariable ["SHARS_ReservePool", [], true];