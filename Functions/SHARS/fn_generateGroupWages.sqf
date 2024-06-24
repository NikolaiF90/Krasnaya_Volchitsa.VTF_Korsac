private _unit = player;
private _groupArray = units group _unit;
private _totalWage = 0;

if (count _groupArray > 1) then 
{
    {
        private _member = _x;
        if (_member != _unit) then 
        {
            private _wage = _member getVariable ["SHARS_Wage", 0];
            _totalWage = _totalWage + _wage;
        };
    } forEach _groupArray;
};

_unit setVariable ["REC_TempWages", _totalWage, true];