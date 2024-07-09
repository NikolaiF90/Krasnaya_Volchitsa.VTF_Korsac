params ["_operation", "_args"];

if (_operation == "TIME") then 
{
    // Default Date
    Mission_Date = [2035, 8, 01];

    private _time = _args;
    private _timeString = [_time] call F90_fnc_convertToTime;
    private _timeStrings = _timeString splitString ":";

    private _timeArray = [];

    for "_i" from 0 to 1 do
    {
        private _item = _timeStrings select _i;
        _timeArray set [_i, parseNumber _item];
    };

    Mission_Date append _timeArray;

    setDate Mission_Date;
};
