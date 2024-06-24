private _caller = player;
private _selectedIndex = lbCurSel SquadMenu_HighCommandListBoxIDC;

if (lbSize SquadMenu_HighCommandListBoxIDC > 0) then 
{
    // Close squad management menu
    if (dialog) then 
    {
        closeDialog 1;
    };
    
    if (_selectedIndex == -1) then 
    {
        lbSetCurSel [SquadMenu_HighCommandListBoxIDC, 0];
        _selectedIndex = 0;
    };

    _caller setVariable ["SquadMenu_SelectedIndex", _selectedIndex, true];
    createDialog "renameHighCommandMenu";
};

