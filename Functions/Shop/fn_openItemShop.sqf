// Close existing menu
if (dialog) then {closeDialog 2};

// Create the dialog
createDialog "equipmentShopMenu";

// Populate shops inventory
private _content = [];
{
    private _text = format ["%1", _x select 1];
    _content pushBack _text;
} forEach Shop_ItemsOnSale;

[EShopMenu_InventoryListboxIDC, _content, 0] call F90_fnc_populateListBox;

// Get balance
private _balance = [player] call F90_fnc_getMoney;
private _balanceText = format ["%1: %2", Economy_CurrencyName, _balance];
ctrlSetText [EShopMenu_BalanceTextIDC, _balanceText];

// Price 
private _selectedItem = Shop_ItemsOnSale select (lbCurSel EShopMenu_InventoryListboxIDC);
private _itemPrice = _selectedItem select 2;
private _priceText = format ["Price: %1", _itemPrice];
ctrlSetText [EShopMenu_PriceTextIDC, _priceText];

// EH 
(findDisplay EShopMenu_DisplayIDD) displayCtrl EShopMenu_InventoryListboxIDC ctrlAddEventHandler 
[
    "LBSelChanged",
    {
        params ["_control", "_lbCurSel", "_lbSelection"];

        // Price 
        private _selectedItem = Shop_ItemsOnSale select _lbCurSel;
        private _itemPrice = _selectedItem select 2;
        private _priceText = format ["Price: %1", _itemPrice];
        ctrlSetText [EShopMenu_PriceTextIDC, _priceText];
    }
];