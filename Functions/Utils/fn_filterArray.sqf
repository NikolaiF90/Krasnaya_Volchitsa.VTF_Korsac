/*
    Author: PrinceF90

    Description:
        This function filters an array by removing items that contain any of the specified keywords.

    Parameter(s):
        _array - The array to be filtered. [ARRAY]
        _keywords - Array of keywords to filter out items from _array. [ARRAY]

    Returns:
        _filteredArray - The filtered array after removing items that contain any of the keywords. [ARRAY]
*/

params ["_array", "_keywords"];

private _filteredArray = +_array;

private _blacklisted = [];

{
    private _itemName = _x;
    private _nameArray = _itemName splitString "-_, ";

    {
        private _keyword = _x;

        // if keyword match, then blacklist the category
        if (_keyword in _nameArray) exitWith 
        {
            if !(_itemName in _blacklisted) then 
            {
                _blacklisted pushBack _itemName;
            };
        };
    } forEach _keywords;
} forEach _array;

_filteredArray = _filteredArray - _blacklisted;

_filteredArray