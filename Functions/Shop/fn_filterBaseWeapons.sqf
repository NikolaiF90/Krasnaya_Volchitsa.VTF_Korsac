params ["_weaponList"];

private _config = configFile >> "CfgWeapons";
private _baseWeapons = [];

{
    private _weaponConfig = _config >> _x;
    private _baseWeapon = getText (_weaponConfig >> "baseWeapon");

    if !(isNil {_baseWeapon}) then 
    {
        if (_baseWeapon isEqualTo _x && !(_baseWeapon isEqualTo "")) then 
        {
            _baseWeapons pushBack _x;
        };
    };
} forEach _weaponList;

_baseWeapons