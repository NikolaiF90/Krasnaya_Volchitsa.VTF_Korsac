/*
    Author: PrinceF90

    Description:
        This function searches for civilian classnames that meet specific criteria and adds them to an array.

    Parameter(s):
        0: CONFIG - _cfg: configFile containing vehicle configurations. (Optional) Default: (configFile >> "CfgVehicles")
        1: STRING - _className: String to match against classnames (Optional) Default: "c_man"

    Returns:
        None  
*/

params ["_cfg", "_className"];

if (isNil {_cfg}) then 
{
    _cfg = (configFile >> "CfgVehicles");
};

if (isNil {_className}) then 
{
    _className = "c_man";
};


for "_i" from 0 to (count _cfg)-1 do 
{
    if (isClass ((_cfg select _i))) then 
    {
        private _cfgName = configName (_cfg select _i);

        if (_cfgName isKindOf "camanbase" AND (getNumber ((_cfg select _i) >> "scope") == 2) AND ([_className,str _cfgName] call BIS_fnc_inString)) then 
        {
            CAB_AllCivilianClassnames pushBack _cfgName;
        };
    };
};
publicVariable "CAB_AllCivilianClassnames";