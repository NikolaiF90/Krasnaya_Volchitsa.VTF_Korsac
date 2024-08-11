private _inventory = [];
while {true} do 
{
    _inventory = Shop_WeaponShopAllInventory;

    {
        private _rarity = _x select 3;
        private _chance = 100;

        switch (_rarity) do 
        {
            case "Common":
            {
                _chance = Shop_CommonAvailabilityChance;
            };
            case "Uncommon":
            {
                _chance = Shop_UncommonAvailabilityChance;
            };
            case "Rare":
            {
                _chance = Shop_RareAvailabilityChance;
            };
            case "Legendary":
            {
                _chance = Shop_LegendaryAvailabilityChance;
            };
        };

        private _rand = random 101;

        if (_chance >= _rand) then 
        {
            Shop_WeaponOnSale pushBack _x;
        };
    } forEach Shop_WeaponShopAllInventory;

    publicVariable "Shop_WeaponOnSale";
    sleep Shop_RefreshInterval;
};