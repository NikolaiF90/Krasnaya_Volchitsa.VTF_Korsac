params ["_weapon"];

// Define price weight factors 
private _basePrice = Shop_BaseWeaponPrice;
private _pWeightAutoFire = 50;
private _pWeightDexterity = 200;
private _pWeightDispersion = 150;
private _pWeightInitSpeed = 0.5;
private _pWeightMagazineReloadTime = 100;
private _pWeightRecoil = 50;
private _pWeightReloadTime = 200;
private _pWeightDamage = 500;

// Define rarity weight 
private _baseScore = 500;
private _rWeightAutoFire = 100;
private _rWeightDexterity = 800;
private _rWeightDispersion = 2;
private _rWeightInitSpeed = 1;
private _rWeightMagazineReloadTime = 1;
private _rWeightMaxZeroing = 3;
private _rWeightMuzzles = 800;
private _rWeightRecoil = 5;
private _rWeightReloadTime = 5;
private _rWeightDamage = 7;

private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;

// If true, weapon will fire repeatedly all the while you hold the fire button down.
private _autoFire = getNumber (_weaponCfg >> "autoFire");
// In-game weapon handling value, lower value = takes more time to traverse a weapon.
private _dexterity = getNumber (_weaponCfg >> "dexterity");
// In-game weapon dispersion in radians. Bigger value = more dispersion.
private _dispersion = getNumber (_weaponCfg >> "dispersion");
// Initial speed of shot in meters per second.
private _initSpeed = getNumber (_weaponCfg >> "initSpeed");
// Time delay when reloading the weapon (changing magazines).
private _magazineReloadTime = getNumber (_weaponCfg >> "magazineReloadTime");
// Max zeroing distance. Sniper has greater zeroing distance
private _maxZeroing = getNumber (_weaponCfg >> "maxZeroing");
// Magazines the weapon can load once. 
private _muzzles = count (getArray (_weaponCfg >> "muzzles"));
// Selects recoil defined in cfgRecoils class. Arma differs substantially in Recoil ability; much more of them, and very different names.
private _recoil = getText (_weaponCfg >> "recoil");
// Delay (in seconds) between each individual shot.
private _reloadTime = getNumber (_weaponCfg >> "reloadTime");
// Damage dealt by the weapon's ammo
private _damage = [_weapon] call F90_fnc_getWeaponDamage;

private _recoilValue = [_recoil] call F90_fnc_getRecoilValue;

private _price = _basePrice;
private _score = _baseScore;
_price = _price + (_autoFire * _pWeightAutoFire);
// AutoFire - Higher autoFire makes the weapon more common
_score = _score - (_autoFire * _rWeightAutoFire);
_price = _price + ((1 / _dexterity) * _pWeightDexterity);
// Dexterity - Higher dexterity makes the weapon more common
_score = _score - (_dexterity * _rWeightDexterity);
_price = _price - (_dispersion * _pWeightDispersion);
// Dispersion - Higher dispersion makes the weapon more common
if (_dispersion > 0.00029) then // most weapons has dispersion of 0.00029
{
    _score = _score - (_dispersion * _rWeightDispersion);
} else 
{
    _score = _score + (_dispersion * _rWeightDispersion);
};
_price = _price + (_initSpeed * _pWeightInitSpeed);
// InitSpeed - Higher initSpeed makes the weapon more rare
_score = _score + (_initSpeed * _rWeightInitSpeed);
_price = _price - (_magazineReloadTime * _pWeightMagazineReloadTime);
// MagazineReloadTime - Lower magazineReloadTime makes the weapon more common
_score = _score - (_magazineReloadTime * _rWeightMagazineReloadTime);
// MaxZeroing - Higher zeroing distance makes the weapon more rare 
_score = _score + (_maxZeroing * _rWeightMaxZeroing);
// Muzzles - Higher muzzle counts make the weapon more rare
_score = _score + (_muzzles * _rWeightMuzzles);
_price = _price - (_recoilValue * _pWeightRecoil);
// RecoilValue - Higher recoilValue makes the weapon more common
_score = _score + (_recoilValue * _rWeightRecoil);
_price = _price - (_reloadTime * _pWeightReloadTime);
// ReloadTime - Lower reloadTime makes the weapon more rare
_score = _score + (_reloadTime * _rWeightReloadTime);
_price = _price + (_damage * _pWeightDamage);
// Damage - Higher damage makes the weapon more rare
if (_damage > 11) then // common ammo like 5.56mm and 7.62mm has the damage less than 11
{
    _score = _score + (_damage * _rWeightDamage);
} else 
{
    _score = _score - (_damage * _rWeightDamage);
};
_score = _score max _baseScore;
_price = floor _price;

[_price, _score]