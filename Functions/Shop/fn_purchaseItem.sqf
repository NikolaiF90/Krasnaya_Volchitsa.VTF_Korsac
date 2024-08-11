private _selectedItem = Shop_ItemsOnSale select (lbCurSel EShopMenu_InventoryListboxIDC);

private _itemPrice = _selectedItem select 2;
private _amount = floor (parseNumber (ctrlText EShopMenu_AmountEditIDC)); 
private _totalPrice = _itemPrice * _amount;

private _balance = [player] call F90_fnc_getMoney;

if (_balance >= _totalPrice) then 
{
    private _itemClass = _selectedItem select 0;
    Shop_InventoryBox addItemCargoGlobal [_itemClass, _amount];

    private _itemName = _selectedItem select 1;
    private _notificationText = [format ["You have bought %1 %2. ", _amount, _itemName], "Find your item in the box next to the officer"];
    [_notificationText, "DEFAULT"] call F90_fnc_textNotification;

    if (dialog) then {closeDialog 2};
} else 
{
    ["You do not have enough money", "ERROR"] call F90_fnc_textNotification;
};