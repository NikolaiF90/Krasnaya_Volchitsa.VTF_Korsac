/*
    Author: PrinceF90

    Description:
        This function allows the player to hire soldiers or squads based on the specified tier or squad type and deducting the required Milcash from the player's balance.

    Parameter(s):
        0: STRING - The type of soldiers or squad to hire. Can be one of: "TierOne", "TierTwo", "TierThree", "Squad"

    Returns:
        None
*/
params ["_type"];

private _caller = player;
private _spawnPos = [getPos recruitX, 0, 10] call BIS_fnc_findSafePos;

switch (_type) do {
    case "TierOne": 
    {
        private _selectedItem = lbCurSel HireMenu_TierOneListBoxIDC;
        if (_selectedItem == -1) then 
        {
            lbSetCurSel [HireMenu_TierOneListBoxIDC, 0];
            _selectedItem = 0;
        };

        private _item = SHARS_TierOneSoldiers select _selectedItem;
        private _className = _item select 1;
        private _skill = _item select 2;
        private _price = _item select 3;

        private _balance = ["GETMONEY", _caller] call F90_fnc_economyHandler;
        if (_balance >= _price) then 
        {
            ["DEDUCTMONEY", [_caller, _price]] call F90_fnc_economyHandler;

            private _group = createGroup [east, true];
            private _unit = [_group, _className, _spawnPos, _skill, "", [true, _price]] call F90_fnc_createUnit;
            [_unit] join _caller; 

        } else 
        {
            ["You do not have enough Milcash", "ERROR"] call F90_fnc_textNotification;
        };
    };
    
    case "TierTwo":
    {
        private _selectedItem = lbCurSel HireMenu_TierTwoListBoxIDC;
        if (_selectedItem == -1) then 
        {
            lbSetCurSel [HireMenu_TierTwoListBoxIDC, 0];
            _selectedItem = 0;
        };

        private _item = SHARS_TierTwoSoldiers select _selectedItem;
        private _className = _item select 1;
        private _skill = _item select 2;
        private _price = _item select 3;

        private _balance = ["GETMONEY", _caller] call F90_fnc_economyHandler;
        if (_balance >= _price) then 
        {
            ["DEDUCTMONEY", [_caller, _price]] call F90_fnc_economyHandler;

            private _group = createGroup [east, true];
            private _unit = [_group, _className, _spawnPos, _skill, "", [true, _price]] call F90_fnc_createUnit;
            [_unit] join _caller;
        } else 
        {
            ["You do not have enough Milcash", "ERROR"] call F90_fnc_textNotification;
        };
    };
    
    case "TierThree":
    {
        private _selectedItem = lbCurSel HireMenu_TierThreeListBoxIDC;
        if (_selectedItem == -1) then 
        {
            lbSetCurSel [HireMenu_TierThreeListBoxIDC, 0];
            _selectedItem = 0;
        };

        private _item = SHARS_TierThreeSoldiers select _selectedItem;
        private _className = _item select 1;
        private _skill = _item select 2;
        private _price = _item select 3;

        private _balance = ["GETMONEY", _caller] call F90_fnc_economyHandler;
        if (_balance >= _price) then 
        {
            ["DEDUCTMONEY", [_caller, _price]] call F90_fnc_economyHandler;

            private _group = createGroup [east, true];
            private _unit = [_group, _className, _spawnPos, _skill, "", [true, _price]] call F90_fnc_createUnit;
            [_unit] join _caller;
        } else 
        {
            ["You do not have enough Milcash", "ERROR"] call F90_fnc_textNotification;
        };
    };

    case "Squad":
    {
        private _selectedItem = lbCurSel HireMenu_SquadListBoxIDC;
        if (_selectedItem == -1) then 
        {
            lbSetCurSel [HireMenu_SquadListBoxIDC, 0];
            _selectedItem = 0;
        };

        private _selectedSquad = SHARS_Squad select _selectedItem;
        private _members = _selectedSquad select 1;
        private _squadPrice = _selectedSquad select 2;

        private _balance = ["GETMONEY", _caller] call F90_fnc_economyHandler;
        if (_balance >= _squadPrice) then 
        {
            ["DEDUCTMONEY", [_caller, _squadPrice]] call F90_fnc_economyHandler;

            private _group = createGroup [east, true];
            for "_i" from 0 to (count _members)-1 do 
            {
                private _unitData = _members select _i;
                private _className = _unitData select 1;
                private _skill = _unitData select 2;
                private _price = _unitData select 3;
                private _unit = [_group, _className, _spawnPos, _skill, "", [true, _price]] call F90_fnc_createUnit;
            };

            [_caller, _group] call F90_fnc_addToHighCommand;
        } else 
        {
            ["You do not have enough Milcash", "ERROR"] call F90_fnc_textNotification;
        };
    };
};