private _completed = 0;
private _allKeys = 5;
if (lbCurSel ServerMenu_AlliedSideComboIDC == 0 || lbCurSel ServerMenu_AlliedSideComboIDC == -1) then 
{
    ["Please Select Allied Sides First", "ERROR", 4, 101, false] call F90_fnc_textNotification;
} else
{
    _completed = _completed +1;
};

if (lbCurSel ServerMenu_EnemySideComboIDC == 0 || lbCurSel ServerMenu_EnemySideComboIDC == -1) then 
{
    ["Please Select Enemy Sides First", "ERROR", 4, 101, false] call F90_fnc_textNotification;
} else 
{
    _completed = _completed +1;
};

if (lbCurSel ServerMenu_AlliedSideComboIDC != lbCurSel ServerMenu_EnemySideComboIDC) then 
{
    _completed = _completed +1;
};

if (isNil {DSC_AlliedFaction}) then 
{
    ["Please Select Allied Faction First", "ERROR", 4, 101, false] call F90_fnc_textNotification;
} else
{
    _completed = _completed +1;
};

if (isNil {DSC_EnemyFaction}) then 
{
    ["Please Select Enemy Faction First", "ERROR", 4, 101, false] call F90_fnc_textNotification;
} else
{
    _completed = _completed +1;
};

if (_completed == _allKeys) then 
{

    Server_Started = true;
    publicVariable "Server_Started";
    // Made public as player will access this once to change their unit side
    publicVariable "Mission_AlliedSide";
    publicVariable "Mission_EnemySide";
    
    if (dialog) then 
    {
        closeDialog 2;
    };
} else 
{
    private _errorText = "Please Complete Server Setup First";
    
    if (lbCurSel ServerMenu_AlliedSideComboIDC != lbCurSel ServerMenu_EnemySideComboIDC) then 
    {
        _errorText = "You can't have the same side as your enemy";
    };

    [_errorText, "ERROR", 4, 101, false] call F90_fnc_textNotification;  
};