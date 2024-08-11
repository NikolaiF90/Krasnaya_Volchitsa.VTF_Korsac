/*
    Author: PrinceF90

    Description:
        Generates a list of usable items and magazines from the game's configuration, filtering by specific criteria and calculating their prices based on demand levels.

    Parameter(s):
        None
        
    Returns: 
        _useableItems + _useableMags - A combined array of usable items and magazines.
*/
private _useableMags = [];
private _useableItems = [];

private _fnc_generateItemPrice = 
{
    params ["_itemCfg"];

    private _itemInfo = _xCfg >> "ItemInfo";
    private _price = 0;
    private _type = getNumber (_itemInfo >> "type");
    // Meds
    if (_type == 301 || _type == 619 || _type == 401) then 
    {
        _price = floor ((Shop_ItemsBasePrice / 2) * (1 + (Mission_DemandLevel / 100)));
    } else 
    {
        // Binos 
        private _useAsBinocular = getNumber (_xCfg >> "useAsBinocular");
        if (_useAsBinocular == 1) then 
        {
            private _maxRange = getNumber (_xCfg >> "maxRange");
            _price = floor (Shop_BinosBasePrice * (1 + (_maxRange / 100)));
        } else 
        {
            _price = floor (Shop_WeaponAttachmentsBasePrice * (1 + (Mission_DemandLevel / 100)));
        };
    };

    _price
};

// Define item config
private _itemCfg = configFile >> "CfgWeapons";
// Extract items from config
private _items = _itemCfg call BIS_fnc_getCfgSubClasses;
{
    private _itemClass = _x;
    private _xCfg = _itemCfg >> _itemClass;
    private _scope = getNumber (_xCfg >> "scope");

    // Filter by scopes 
    if (_scope == 2) then 
    {
        // Filter out guns
        private _htMin = getNumber (_xCfg >> "htMin");
        if (_htMin == 0) then 
        {
            private _xSubClasses = _xCfg call BIS_fnc_getCfgSubClasses;
            private _itemInfo = _xSubClasses find "ItemInfo";

            if !(isNil {_itemInfo}) then 
            {
                // Filter out headgear and vest item 
                private _generalMacro = getText (_xCfg >> "ItemInfo" >> "_generalMacro");
                if !(_generalMacro isEqualTo "HeadgearItem" || _generalMacro isEqualTo "VestItem") then 
                {
                    // Filter out uniforms
                    private _containerClass = getText (_xCfg >> "ItemInfo" >> "containerClass");
                    if (_containerClass isEqualTo "" || _containerClass isEqualTo " ") then
                    {
                        // Filter out items with no name
                        private _displayName = getText (_xCfg >> "displayName");
                        if !(_displayName isEqualTo "" || _displayName isEqualTo " ") then 
                        {
                            private _price = [_xCfg] call _fnc_generateItemPrice;              
                            private _data = [_itemClass, _displayName, _price];
                            _useableItems pushBack _data;
                        };
                    };
                };
            };
        };


    };
} forEach _items;

// Define magazine config
private _magazineCfg = configFile >> "CfgMagazines";
// Extract mags from config
private _magazines = _magazineCfg call BIS_fnc_getCfgSubClasses;
{
    private _magClass = _x;
    private _magCfg = _magazineCfg >> _magClass;
    private _scope = getNumber (_magCfg >> "scope");

    // Filter by scopes
    if (_scope == 2) then 
    {
        // Filter weight to exclude leaflet 
        private _mass = getNumber (_magCfg >> "mass");
        if (_mass > 5) then 
        {
            // Filter by type 
            private _type = getNumber (_magCfg >> "type");
            if (_type != 0) then 
            {
                private _displayName = getText (_magCfg >> "displayName");
                private _price = floor (Shop_MagsBasePrice * (1 + (Mission_DemandLevel / 100)));
                private _data = [_magClass, _displayName, _price];
                _useableMags pushBack _data;
            };
        };
    };

} forEach _magazines;
_useableItems + _useableMags