params ["_unit"];

if (dialog) then 
{
    closeDialog 2;
};

_created = createDialog "tacticalMenu";

if (_created) then 
{
    private _amount = ["GETMONEY", _unit] call F90_fnc_economyHandler;
    private _killCount = _unit getVariable "Record_ConfirmedKills";

    private _moneyText = format ["Milcash: %1", _amount];
    private _killText = format ["Confirmed Kills: %1", _killCount];

    ctrlSetText [VCR_MoneyTextIDC, _moneyText];
    ctrlSetText [VCR_ConfirmedKillsIDC, _killText];
};