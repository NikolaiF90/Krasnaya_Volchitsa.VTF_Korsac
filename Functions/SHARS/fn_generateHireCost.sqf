/*
    Author: PrinceF90

    Description:
        This function calculates the hire cost for units based on their skills and tiers.

    Parameter(s):
        _array - An array containing unit data including display name, class, and tier. [ARRAY]

    Returns:
        None
*/
params ["_array"];

private _arrayLength = count _array -1;

for "_i" from 0 to _arrayLength do 
{
    private _data = _array select _i;
    private _displayName = _data select 0;
    private _class = _data select 1;
    private _tier = _data select 2;
    private _totalSkillCost = 0;
    private _skillCounts = 8;
    private _skill = 0;
    private _tierMultiplier = 0;

    switch (_tier) do 
    {
        case "TierOne": 
        {
            _skill = SHARS_TierOneSkill;
            _tierMultiplier = SHARS_TierOneMultiplier;
        };
        case "TierTwo": 
        {
            _skill = SHARS_TierTwoSkill;
            _tierMultiplier = SHARS_TierTwoMultiplier;
        };
        case "TierThree": 
        {
            _skill = SHARS_TierThreeSkill;
            _tierMultiplier = SHARS_TierThreeMultiplier;
        };
    };

    private _skillCost = (_skill / 0.01) * SHARS_SkillHireValue;
    _totalSkillCost = _totalSkillCost + (_skillCost * _skillCounts);

    private _hireCost = (SHARS_BaseUnitCost + _totalSkillCost) * _tierMultiplier;

    private _skillArray = [];
    for "_i" from 0 to _skillCounts -1 do 
    {
        _skillArray set [_i, _skill];
    };

    private _newData = [_displayName, _class, _skillArray, _hireCost];
    _array set [_i, _newData];
};