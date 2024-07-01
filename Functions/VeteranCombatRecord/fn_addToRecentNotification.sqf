/*
    Author: PrinceF90

    Description:
        This function records recent notifications for the specified unit.

    Parameter(s):
        0: STRING - _text: The text of the notification
        1: OBJECT - _unit: (Optional, default player) The unit for which the notification is being recorded

    Returns:
        None
*/
params ["_text", "_unit"];

if (isNull _unit) then 
{
    _unit = player;
};

private _notificationList = _unit getVariable ["Record_RecentNotification", []];
private _dateTimeString = [false] call F90_fnc_getSystemDate;
private _formattedText = format ["[%1] %2", _dateTimeString, _text];

if (count _notificationList >= VETCOMREC_NotificationCount) then 
{
    _notificationList deleteAt 0;
};

_notificationList pushBack _formattedText;
_unit setVariable ["Record_RecentNotification", _notificationList, true];