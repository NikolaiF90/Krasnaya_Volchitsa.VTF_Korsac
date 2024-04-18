params ["_unit"];
[true, "openTacticalTab", format ["%1 opened tactical tab", _unit], true] call F90_fnc_debug;

if (dialog) then 
{
    closeDialog 2;
};

_created = createDialog "tacticalMenu";

if (_created) then 
{
    private _amount = ["GETMONEY", _unit] call F90_fnc_economyHandler;
    private _moneyText = format ["Milcash: %1", _amount];
    ctrlSetText [1202, _moneyText];
    [true, "openTacticalTab", _moneyText, true] call F90_fnc_debug;
};