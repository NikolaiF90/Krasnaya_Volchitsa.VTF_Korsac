params ["_weapon"];

private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;
// Get the magazine 
private _magazines = getArray (_weaponCfg >> "magazines");
private _magazine = _magazines select 0;

private _magCfg = configFile >> "CfgMagazines" >> _magazine;
// Get the ammo 
private _ammo = getText (_magCfg >> "ammo");

private _ammoCfg = configFile >> "CfgAmmo" >> _ammo;
// Get the damage 
private _hit = getNumber (_ammoCfg >> "hit");
_hit