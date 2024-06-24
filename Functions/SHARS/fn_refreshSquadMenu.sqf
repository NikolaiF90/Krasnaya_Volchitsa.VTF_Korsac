/*
    Author: PrinceF90

    Description:
        This function refreshes different squad menus based on the selected listbox option.

    Parameter(s):
        0: STRING - The listbox option selected by the player. Can be one of, "ALL", "SQUAD", "HIGHCOMMAND", "RESERVE".

    Returns:
        None
*/

params ["_listbox"];

private _unit = player;

if (isNil {_listbox} || _listbox == "") then 
{
    _listbox = "ALL";
};

switch (_listbox) do 
{
    case "ALL": 
    {
        ["SQUAD"] call F90_fnc_refreshSquadMenu;
        ["HIGHCOMMAND"] call F90_fnc_refreshSquadMenu;
        ["RESERVE"] call F90_fnc_refreshSquadMenu;
    };

    case "SQUAD":
    {
        lbClear SquadMenu_PlayerSquadListBoxIDC;
        {
            private _unitName = name _x;
            private _wage = _x getVariable ["SHARS_Wage", 0];
            private _text = "";
            if (_wage > 0) then 
            {
                _text = format ["%1 (%2milcash)", _unitName, _wage];
            } else 
            {
                _text = _unitName;
            };
            lbAdd [SquadMenu_PlayerSquadListBoxIDC, _text];
        } forEach units (group _unit);
    };

    case "HIGHCOMMAND":
    {
        lbClear SquadMenu_HighCommandListBoxIDC;
        {
            private _groupName = groupId _x;
            private _counts = count (units _x);
            private _text = format ["(%1) %2", _counts, _groupName];
            lbAdd [SquadMenu_HighCommandListBoxIDC, _text];
        } forEach hcAllGroups _unit;
    };

    case "RESERVE":
    {
        private _reservePools = _unit getVariable "SHARS_ReservePool";
        lbClear SquadMenu_ReservePoolListBoxIDC;
        {
            private _unitData = _x;
            private _unitName = _unitData select 1;
            lbAdd [SquadMenu_ReservePoolListBoxIDC, _unitName];
        } forEach _reservePools;
    };
};