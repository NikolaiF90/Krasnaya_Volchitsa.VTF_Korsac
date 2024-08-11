private _config = configFile >> "CFGWeapons"; 
private _weaponClassList = _config call BIS_fnc_getCfgSubClasses; 
 
private _guns = [];

{
    private _weaponCfg = _config >> _x;
    private _scope = getNumber (_weaponCfg >> "scope");
    private _htMin = getNumber (_weaponCfg >> "htMin");
    private _cursor = getText (_weaponCfg >> "cursor");
    private _magazines = getArray (_weaponCfg >> "magazines");
    if (!(isNil {_htMin}) && !(isNil {_cursor} && !(isNil {_magazines}))) then 
    {
        if (_scope == 2 && !(_cursor isEqualTo "") && _htMin > 0 && (count _magazines > 0)) then
        {
            _guns pushBack _x;
        };
    };
} forEach _weaponClassList;

_guns