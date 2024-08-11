if (dialog) then {closeDialog 2};

createDialog "weaponShopMenu";

private _list = [];

{
    private _data = _x;
    private _className = _data select 0;
    private _displayName = _data select 1;
    private _weaponPrice = _data select 2;
    private _weaponRarity = _data select 3;
    _item = format ["[%1] %2 - %3 milcash", _weaponRarity, _displayName, _weaponPrice];
    _list pushBack _item;
} forEach Shop_WeaponOnSale;

[ShopMenu_InventoryListBoxIDC, _list] call F90_fnc_populateListBox;

private _balance = [player] call F90_fnc_getMoney;
private _balanceText = format ["%1: %2", Economy_CurrencyName, _balance];
ctrlSetText [ShopMenu_BalanceTextIDC, _balanceText];