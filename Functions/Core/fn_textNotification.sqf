/*
    Author: PrinceF90

    Description:
        Function to show a text notification with colors based on the specified type and displays it on the screen.

    Parameter(s):
        0: STRING - _text: The text content of the notification
        1: STRING - _type: (Optional, default "DEFAULT") The type of notification. Can be one of: "DEFAULT", "WARNING", "ERROR".
        2: FLOAT - _duration: (Optional, default 4) The duration until the text starts fading.
        3: NUMBER - _layer: (Optional default 101) The resource layer.
    Returns:
        None
*/

params ["_text", "_type", "_duration", "_layer"];

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

private _unit = player;
if !(isNull _unit) then 
{
    [_text, _unit] call F90_fnc_addToRecentNotification;
};