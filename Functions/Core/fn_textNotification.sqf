/*
    Author: PrinceF90

    Description:
        This function generates a formatted text notification based on the type provided and displays it on the screen for a specified duration. It also has an option to store the notification to a unit if specified.

    Parameter(s):
        _text - The text content of the notification. [STRING]
        _type - (Optional, default "DEFAULT") The type of notification ("DEFAULT", "WARNING", "ERROR"). [STRING]
        _duration - (Optional, default 4) The duration the notification is displayed on the screen. [SCALAR]
        _layer - (Optional, default 101) The layer of the notification on the screen. [SCALAR]
        _storeToUnit - (Optional, default true) A flag to determine if the notification should be stored to a unit. [BOOL]

    Returns: 
        None
*/

params ["_text", "_type", "_duration", "_layer", "_storeToUnit"];

if (isNil {_type}) then 
{
    _type = "DEFAULT";
};

if (isNil {_duration}) then
{
    _duration = 4;
};

if (isNil {_layer}) then 
{
    _layer = 101;
};

if (isNil {_storeToUnit}) then 
{
    _storeToUnit = true;
};

private _formattedText = "";

switch (_type) do {
    case "DEFAULT": 
    {
        _formattedText = format ["<t font='PuristaSemibold' size='0.5' color='#00ff00'>NEW NOTIFICATION <br />%1</t>", _text];
    };
    case "WARNING":
    {
        _formattedText = format ["<t font='PuristaSemibold' size='0.5' color='#ffb200'>WARNING <br />%1</t>", _text];
    };
    case "ERROR":
    {
        _formattedText = format ["<t font='PuristaSemibold' size='0.5' color='#ff0000'>ERROR <br />%1</t>", _text];
    };
};

[_formattedText, 0, safeZoneY + 0.2, _duration, 1, 0, _layer] spawn BIS_fnc_dynamicText;

if (_storeToUnit) then 
{
    private _unit = player;
    if !(isNull _unit) then 
    {
        [_text, _unit] call F90_fnc_addToRecentNotification;
    };
};