params ["_amount"];

private _unit = player;
private _milcash = ["GETMONEY", [_unit]] call F90_fnc_economyHandler;
private _netPrice = _amount * Skill_SPPrice;

if (_milcash >= _netPrice) then 
{
    [_unit, _amount] call F90_fnc_addSP;
    ["DEDUCTMONEY", [_unit, _netPrice]] call F90_fnc_economyHandler;
    
    [format ["You have bought %1 SP for %2 Milcash", _amount, _netPrice], "DEFAULT"] call F90_fnc_textNotification;
} else 
{
    ["You do not have enough milcash", "ERROR"] call F90_fnc_textNotification;
};

// Update displayed total SP
[] call F90_fnc_openSkillMenu;