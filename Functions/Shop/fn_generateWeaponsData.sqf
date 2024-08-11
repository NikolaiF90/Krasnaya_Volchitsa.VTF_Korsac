params ["_rawList"];

private _config = configFile >> "CfgWeapons";
private _weaponList = [];

{
    private _weaponCfg = _config >> _x;
    // Get the display name 
    private _displayName = getText (_weaponCfg >> "displayName");
    // Generate price and rarity score
    private _weaponPriceAndScore = [_x] call F90_fnc_generateWeaponPrice;
    private _weaponPrice = _weaponPriceAndScore select 0;
    private _weaponScore = _weaponPriceAndScore select 1;

    // Define rarity 
    private _rarity = "Common";

    // Rarity thresholds
    if (_weaponScore > 7237) then 
    {
        _rarity = "Legendary"
    } else 
    {
        if (_weaponScore > 4681) then 
        {
            _rarity = "Rare";
        } else 
        {
            if (_weaponScore > 3848) then 
            {
                _rarity = "Uncommon";
            };
        };
    };

    private _weaponData = [_x, _displayName, _weaponPrice, _rarity];
    _weaponList pushBack _weaponData;
} forEach _rawList;

_weaponList