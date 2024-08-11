params ["_unit", "_amount"];

private _currentSP = _unit getVariable Economy_SPName;
_currentSP = _currentSP - _amount;
_unit setVariable [Economy_SPName, _currentSP, true];