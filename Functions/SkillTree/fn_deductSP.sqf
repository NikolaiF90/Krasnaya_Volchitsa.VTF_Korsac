params ["_unit", "_amount"];

private _currentSP = _unit getVariable "Skill_Points";
_currentSP = _currentSP - _amount;
_unit setVariable ["Skill_Points", _currentSP, true];