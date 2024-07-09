/*
    Author: PrinceF90

    Description:
        This function iterates over an array, checks for subarrays, adds an item to the subarrays, and returns the modified array.

    Parameter(s):
        _originalArray - The original array to be processed. [ARRAY]
        _item - The item to be added to subarrays. [ANY]

    Returns:
        _arrayOfDatas - An array with items added to subarrays.
*/
params ["_originalArray", "_item"];

private _arrayOfDatas = [];
private _originalArrayLength = count _originalArray -1;

for "_i" from 0 to _originalArrayLength do 
{
    private _data = _originalArray select _i;
    if (_data isEqualType []) then 
    {
        private _newData = +_data;
        _newData pushBack _item;
        _arrayOfDatas set [_i, _newData];
    };
};

_arrayOfDatas