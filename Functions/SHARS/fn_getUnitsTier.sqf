/*
    Author: PrinceF90

    Description:
        This function determines the tier of a soldier based on the class name provided. If no tiers founded for the className, this function will return default value = "Tier One".

    Parameter(s):
        0: STRING - _className: The class name of the soldier

    Returns:
        _tier - The tier of the soldier, defaulting to "Tier One" if no tier is found.
*/
params ["_className"];

private _tier = "None";
private _soldierArrays = [SHARS_TierOneSoldiers, SHARS_TierTwoSoldiers, SHARS_TierThreeSoldiers];
private _tierArrays = ["Tier One", "Tier Two", "Tier Three"];

{
    private _array = _x;
    private _arrayIndex = _forEachIndex;

    if (_tier == "None") then
    {
        {
            if (_x select 1 == _className) exitWith 
            {
                _tier = _tierArrays select _arrayIndex;
            };
        } forEach _array;
    };
} forEach _soldierArrays;

// Sets default to Tier One if can't find tier
if (_tier == "None") then 
{
    _tier = "Tier One";
};
_tier