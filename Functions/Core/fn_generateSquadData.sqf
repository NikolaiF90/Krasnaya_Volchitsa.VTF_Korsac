/*
    Author: PrinceF90

    Description:
        This function retrieves information about squads belonging to different factions, excluding vehicles.

    Parameter(s):
        _faction - The faction for which squad information is retrieved. [STRING]

    Returns:
        _allSquads - An array containing information about squads for each faction.
*/

params ["_faction"];

private _allSquads = [];
private _groupNameList = [];
private _cfgGroups = configFile >> "CfgGroups";
private _allSides = ["West", "East", "Indep"];

{
    private _sideConfig = _cfgGroups >> _x;
    private _factionConfig = _sideConfig >> _faction;

    if (isClass _factionConfig) then 
    {
        private _categories = _factionConfig call BIS_fnc_getCfgSubClasses;

        // All faction categories exclude vehicles
        private _filteredCategories = [_categories, DSC_VehicleKeywords] call F90_fnc_filterArray;
        
        {
            private _categoryConfig = _factionConfig >> _x;
            private _categoryGroups = _categoryConfig call BIS_fnc_getCfgSubClasses;

            {
                private _groupConfig = _categoryConfig >> _x;

                if (isClass _groupConfig) then 
                {
                    private _groupName = getText (_groupConfig >> "name");

                    if !(_groupName in _groupNameList) then 
                    {
                        _groupNameList pushBack _groupName;

                        private _squadMembers = [];
                        private _unitList = _groupConfig call BIS_fnc_getCfgSubClasses;
        
                        {
                            private _unitConfig = _groupConfig >> _x;

                            if (isClass _unitConfig) then 
                            {
                                private _unitClass = getText (_unitConfig >> "vehicle");

                                if !(_unitClass in _squadMembers) then 
                                {
                                    _squadMembers pushBack _unitClass;
                                };
                            };
                        } forEach _unitList;

                        private _filteredSquadMembers = [_squadMembers, DSC_VehicleKeywords] call F90_fnc_filterArray;
                        private _newData = [];

                        for "_i" from 0 to count _filteredSquadMembers -1 do 
                        {
                            private _item = _filteredSquadMembers select _i;
                            _newData set [_i, [_item]];
                        };
                        private _squadData = [_groupName, _newData];
                        
                        _allSquads pushBack _squadData;
                    };
                };
            } forEach _categoryGroups;
        } forEach _filteredCategories;
    };
} forEach _allSides;

_allSquads