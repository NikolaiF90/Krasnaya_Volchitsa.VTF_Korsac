/*
    Author: PrinceF90

    Description:
        This function processes an array of unit classnames to create a list of display names and classnames for each unit.

    Parameter(s):
        _array - Array of unit classnames to process. [ARRAY]
        _config - Config entry for the units. [CONFIG]

    Returns:
        _unitDataList - List of display names and classnames for each unit.
*/
params ["_array", "_config"];

private _unitDataList = [];
{
    private _unitClassname = _x;
    private _unitConfig = _config >> _unitClassname;

    private _displayName = getText (_unitConfig >> "displayName");
    private _unitData = [_displayName, _unitClassname];
    _unitDataList pushBack _unitData;
} forEach _array;

_unitDataList