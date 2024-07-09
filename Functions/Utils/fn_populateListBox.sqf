/*
    Author: PrinceF90

    Description:
        Add content to a listbox and set the current selection to the first item.

    Parameter(s):
        _idc - ID of the listbox [SCALAR]
        _content - Array of items to add to the listbox [ARRAY]

    Returns:
        None
*/
params ["_idc", "_content"];

lbClear _idc;
{
    lbAdd [_idc, _x];
} forEach _content;

lbSetCurSel [_idc, 0];