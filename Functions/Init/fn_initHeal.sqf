private _unit = player;

[
    Support_InfirmaryObject, 
    "Get Medical Support",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        _caller setDamage 0;
        if (isPlayer _caller) then 
        {
            ["You have been healed", "DEFAULT"] call F90_fnc_textNotification;
        };
    },
    "alive _this && (damage _this > 0)",
    "RSW_HealActionID"
] call F90_fnc_addAction;