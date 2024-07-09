/*
    Author: PrinceF90

    Description:
        Function to get a in-game/server date formatted by "day month, year hoursminutes" based on the input parameters. The params allows for customization of the date format.

    Parameter(s):
        0: BOOL - _fullMonthName (Optional, default true): Determines whether to display the full month name or the short month name.
        1: BOOL - _singleLine (Optional, default true): Determines whether to format the date in a single line or with line breaks.
        2: BOOL - _largeText (Optional, default false): Determines whether to display the date in large text.

    Returns:
        _dateString - The formatted date string.
*/
params ["_fullMonthName", "_singleLine", "_largeText"];

if (isNil {_fullMonthName}) then
{
    _fullMonthName = true;
};

if (isNil {_singleLine}) then 
{
    _singleLine = true;
};

if (isNil {_largeText}) then 
{
    _largeText = false;
};

private _year = date select 0;
private _month = date select 1;
private _day = date select 2;
private _hours = date select 3;
private _minutes = date select 4;


private _monthString = [];

if (_fullMonthName) then 
{
    _monthString = 
    [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June", 
        "July", 
        "August", 
        "September",
        "October",
        "November",
        "December"
    ];
} else 
{
    [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "June", 
        "July", 
        "Aug", 
        "Sept",
        "Oct",
        "Nov",
        "Dec"
    ];
};


_month = _monthString select _month;

if (_hours < 10) then 
{
    _hours = format ["0%1", _hours];
};

if (_minutes < 10) then 
{
    _minutes = format ["0%1", _minutes];
};

private _dateString = "";

if (_singleLine) then 
{
    _dateString = format ["%1 %2, %3 %4%5hrs", _day, _month, _year, _hours, _minutes];
} else
{
    _dateString = format ["%1 %2, %3<br />%4%5hrs", _day, _month, _year, _hours, _minutes];
};

if (_largeText) then 
{
    _dateString = "<t size='1.2'>" + _dateString + "</t>";
};

_dateString