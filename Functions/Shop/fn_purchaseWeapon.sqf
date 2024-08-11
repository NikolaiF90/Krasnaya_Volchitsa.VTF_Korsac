private _selectedItemData = Shop_WeaponOnSale select (lbCurSel ShopMenu_InventoryListBoxIDC);

private _weaponPrice = _selectedItemData select 2;
private _balance = [player] call F90_fnc_getMoney;

if (_balance >= _weaponPrice) then 
{
    [player, _weaponPrice] call F90_fnc_deductMoney;

    private _container = "GroundWeaponHolder" createVehicle (position player);

    private _weaponClass = _selectedItemData select 0;
    _container addWeaponCargo [_weaponClass, 1];
    
    [_container, player] call F90_fnc_teleportObject;

    if (dialog) then {closeDialog 2};

    private _weaponName = _selectedItemData select 1;
    [format ["You have purchased %1 for %2 %3. ", _weaponName, _weaponPrice, Economy_CurrencyName], "DEFAULT"] call F90_fnc_textNotification;
} else 
{
    ["You do not have enough money", "ERROR"] call F90_fnc_textNotification;
};

