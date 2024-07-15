/*
    Author: PrinceF90

    Description:
        This function formats the current system time into a customizable date string.

    Parameter(s):
        _fullMonthName - (Optional, default true) Indicates whether to use full month names or abbreviations. [BOOL]
        _singleLine - (Optional, default true) Indicates whether to format the date in a single line or with line breaks. [BOOL]
        _largeText - (Optional, default false) Indicates whether to display the date string in larger text. [BOOL]

    Returns: 
        _dateString - A formatted date string based on the input parameters.
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

private _year = systemTime select 0;
private _month = systemTime select 1;
private _day = systemTime select 2;
private _hours = systemTime select 3;
private _minutes = systemTime select 4;


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
    _monthString = 
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


_month = _monthString select (_month -1);

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
    _dateString = format ["%1%2%3 %4:%5", _day, _month, _year, _hours, _minutes];
} else
{
    _dateString = format ["%1%2%3<br />%4:%5", _day, _month, _year, _hours, _minutes];
};

if (_largeText) then 
{
    _dateString = "<t size='1.2'>" + _dateString + "</t>";
};

_dateString