/*
    Author: PrinceF90

    Description:
        This function generate unit data and obtain various skill values of a specified unit and stores them in an formatted [className, unitName, arrayOfSkill, unitWage].

    Parameter(s):
        0: OBJECT - _unit: Unit for which skills are being generated

    Returns:
        _unitData - Array formatted [className, unitName, [skills]]
*/

params ["_unit"]; 

private _className = _unit getVariable "RSW_UnitClass";
private _aimAccuracy = _unit skill "aimingAccuracy";
private _aimShake = _unit skill "aimingShake";
private _aimSpeed = _unit skill "aimingSpeed";
private _spotDistance = _unit skill "spotDistance";
private _spotTime = _unit skill "spotTime";
private _courage = _unit skill "courage";
private _reloadSpeed = _unit skill "reloadSpeed";
private _commanding = _unit skill "commanding";
private _skillArray = [_aimAccuracy, _aimShake, _aimSpeed, _spotDistance, _spotTime, _courage, _reloadSpeed, _commanding];
private _unitWage = _unit getVariable "SHARS_Wage";
private _unitData = [_className, name _unit, _skillArray, _unitWage];

_unitData