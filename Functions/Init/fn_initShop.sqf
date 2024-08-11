Shop_WeaponShop = weaponDesk;

// Get all weapons
private _allWeaponsRaw = [] call F90_fnc_getAllWeapons;
G_weaponsNoAttachments = [_allWeaponsRaw] call F90_fnc_filterBaseWeapons;
// Contains weapon on sale. Weapon's data format: [0:"class_name", 1:"Display Name". 2:Price, 3:Rarity]
Shop_WeaponShopAllInventory = [G_weaponsNoAttachments] call F90_fnc_generateWeaponsData;
// Weapons on sale for weapon shop. Weapon's data format: [0:"class_name", 1:"Display Name". 2:Price, 3:Rarity]
Shop_WeaponOnSale = [];
publicVariable "Shop_WeaponOnSale";
// Get all items from config 
private _allItems = [] call F90_fnc_getAllEquipments;
// Items and equipments on sale. Each items format: [0:"class_name", 1:"Display Name". 2:Price]
Shop_ItemsOnSale = _allItems;

// Create officer
[] call F90_fnc_createLogisticOfficer;

// Execute saleHandler
[] spawn F90_fnc_saleHandler;