
if (dialog) then 
{
    closeDialog 2;
};

private _dialogShown = createDialog "hireMenu";

if (_dialogShown) then 
{
    ctrlSetText [HireMenu_TierOneTextIDC, SHARS_TierOneName];
    ctrlSetText [HireMenu_TierTwoTextIDC, SHARS_TierTwoName];
    ctrlSetText [HireMenu_TierThreeTextIDC, SHARS_TierThreeName];

    // T1 Listbox
    lbClear HireMenu_TierOneListBoxIDC;
    for "_i" from 0 to (count SHARS_TierOneSoldiers)-1 do 
    {
        private _item = SHARS_TierOneSoldiers select _i;
        private _displayName = _item select 0;
        private _price = _item select 3;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_TierOneListBoxIDC, _text];
    };

    // T2 Listbox
    lbClear HireMenu_TierTwoListBoxIDC;
    for "_i" from 0 to (count SHARS_TierTwoSoldiers)-1 do 
    {
        private _item = SHARS_TierTwoSoldiers select _i;
        private _displayName = _item select 0;
        private _price = _item select 3;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_TierTwoListBoxIDC, _text];
    };

    // T3 Listbox
    lbClear HireMenu_TierThreeListBoxIDC;
    for "_i" from 0 to (count SHARS_TierThreeSoldiers)-1 do 
    {
        private _item = SHARS_TierThreeSoldiers select _i;
        private _displayName = _item select 0;
        private _price = _item select 3;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_TierThreeListBoxIDC, _text];
    };

    // Squad Listbox
    lbClear HireMenu_SquadListBoxIDC;
    for "_i" from 0 to (count SHARS_SquadsData)-1 do 
    {
        private _item = SHARS_SquadsData select _i;
        private _displayName = _item select 0;
        private _price = _item select 2;
        private _text = format ["%1 %2mc", _displayName, _price];
        lbAdd [HireMenu_SquadListBoxIDC, _text];
    };
};