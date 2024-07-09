/*
    Author: PrinceF90

    Description:
        This function calculates the hours and minutes from a floating-point number and formats them into HH:MM.

    Parameter(s):
        _float - The floating-point number representing the time. [SCALAR]

    Returns:
        _timeString - A time string formatted HH:MM
*/
params ["_float"];

private _hours = floor _float;
private _minutes = round ((_float - _hours) * 60);

private _formattedHours = format ["%1", _hours];
private _formattedMinutes = if (_minutes < 10) then 
{
    format ["0%1", _minutes]
} else 
{
    format ["%1", _minutes]
};

format ["%1:%2", _formattedHours, _formattedMinutes]