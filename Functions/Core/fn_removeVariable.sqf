params ["_key"];

private _isExist = player getVariable [_key, nil];

if !(isNil {_isExist}) then 
{
    player setVariable [_key, nil, true];
};