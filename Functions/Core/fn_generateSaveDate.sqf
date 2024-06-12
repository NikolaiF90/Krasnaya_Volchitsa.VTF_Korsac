/*
	Author: PrinceF90

	Description:
		This function generates a string representing the current date and time in the format [hh:mm dd/mm/yy].

	Parameter(s):
		None

	Returns:
		STRING - String representing the current date and time in the specified format.
*/

private _returnData = "";
private _time = systemTime;
private _hour = _time # 3;
private _minute = _time # 4;
private _day = _time # 2;
private _month = _time # 1;
private _year = _time # 0;

private _string = format ["%1:%2 %3/%4/%5",_hour,_minute,_day,_month,_year];

AWSP_Savetime = _string;
_returnData = _string;

_returnData;
