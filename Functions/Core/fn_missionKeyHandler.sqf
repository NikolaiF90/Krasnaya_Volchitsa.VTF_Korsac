/*
Author: PrinceF90

    Description:
        This function checks if a specific key is pressed and then perform certain actions depending on pressed keys.

    Parameter(s):
        _displayOrControl - The display or control that triggered the event [INT]
        _key - The key to check [INT]
        _shift - Indicates if the Shift key is pressed [BOOL]
        _ctrl - Indicates if the Ctrl key is pressed [BOOL]
        _alt - Indicates if the Alt key is pressed [BOOL]

    Returns:
        None
*/
params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
#include "\a3\ui_f\hpp\definedikcodes.inc"

private _unit = player;
// Allow default key behavior
private _override = false;

if (_key isEqualTo DIK_Y && _ctrl isEqualTo false) then 
{
    [_unit] call F90_fnc_openTacticalTab;
    // Override to prevent default Y behavior
    _override = true;
};

_override 