params ["_unit"];

private _className = typeOf _unit;
private _basePrice = 0;

// Find the unit's base price
{
    private _unitData = _x;
    private _unitClass = _unitData select 1;
    if (_unitClass == _className) exitWith 
    {
        _basePrice = _unitData select 3;
    };
} forEach SHARS_TierOneSoldiers + SHARS_TierTwoSoldiers + SHARS_TierThreeSoldiers;

// Get unit's skills
private _aimAccuracy = _unit skill "aimingAccuracy";
private _aimShake = _unit skill "aimingShake";
private _aimSpeed = _unit skill "aimingSpeed";
private _spotDistance = _unit skill "spotDistance";
private _spotTime = _unit skill "spotTime";
private _courage = _unit skill "courage";
private _reloadSpeed = _unit skill "reloadSpeed";
private _commanding = _unit skill "commanding";
private _skillArray = [_aimAccuracy, _aimShake, _aimSpeed, _spotDistance, _spotTime, _courage, _reloadSpeed, _commanding];

// Generate the price value for each skills
private _totalSkillPrice = 0;
{
    private _skillValue = _x;
    private _skillPrice = (_skillValue / 0.01) * SHARS_SkillWageValue;
    _totalSkillPrice = _totalSkillPrice + _skillPrice;
} forEach _skillArray;

// Calculate final wage
private _totalWage = (_basePrice * SHARS_WageBaseMultiplier) + _totalSkillPrice;
_totalWage
