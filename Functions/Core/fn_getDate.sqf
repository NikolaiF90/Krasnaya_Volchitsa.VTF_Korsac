private _date = date;
private _year = _date select 0;
private _month = _date select 1;
private _day = _date select 2;
private _hours = _date select 3;
private _minutes = _date select 4;

private _monthString = 
[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June", 
    "July", 
    "August", 
    "Septembre",
    "October",
    "November",
    "December"
];

_month = _monthString select _month;

if (_hours < 10) then 
{
    _hours = format ["0%1", _hours];
};

if (_minutes < 10) then 
{
    _minutes = format ["0%1", _minutes];
};

private _dateString = format ["<t size='1.2'>%1 %2, %3<br />%4%5hrs</t>", _day, _month, _year, _hours, _minutes];

_dateString