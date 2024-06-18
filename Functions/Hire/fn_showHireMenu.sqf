
if (dialog) then 
{
    closeDialog 2;
};

private _dialogShown = createDialog "hireMenu";

if (_dialogShown) then 
{
    ctrlSetText [HireMenu_TierOneTextIDC, HIRE_TierOneName];
    ctrlSetText [HireMenu_TierTwoTextIDC, HIRE_TierTwoName];
    ctrlSetText [HireMenu_TierThreeTextIDC, HIRE_TierThreeName];

    // T1 Listbox
    lbClear HireMenu_TierOneListBoxIDC;
    for "_i" from 0 to (count HIRE_TierOneSoldiers)-1 do 
    {
        private _item = HIRE_TierOneSoldiers select _i;
        private _displayName = _item select 0;
        private _price = _item select 2;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_TierOneListBoxIDC, _text];
    };

    // T2 Listbox
    lbClear HireMenu_TierTwoListBoxIDC;
    for "_i" from 0 to (count HIRE_TierTwoSoldiers)-1 do 
    {
        private _item = HIRE_TierTwoSoldiers select _i;
        private _displayName = _item select 0;
        private _price = _item select 2;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_TierTwoListBoxIDC, _text];
    };

    // T3 Listbox
    lbClear HireMenu_TierThreeListBoxIDC;
    for "_i" from 0 to (count HIRE_TierThreeSoldiers)-1 do 
    {
        private _item = HIRE_TierThreeSoldiers select _i;
        private _displayName = _item select 0;
        private _price = _item select 2;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_TierThreeListBoxIDC, _text];
    };

    // Squad Listbox
    lbClear HireMenu_SquadListBoxIDC;
    for "_i" from 0 to (count HIRE_Squad)-1 do 
    {
        private _item = HIRE_Squad select _i;
        private _displayName = _item select 0;
        private _price = _item select 2;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_SquadListBoxIDC, _text];
    };
};