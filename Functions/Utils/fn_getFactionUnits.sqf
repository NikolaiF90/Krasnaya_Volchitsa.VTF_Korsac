params ["_faction"];

private _unitClasses = [];
private _allUnits = [];
private _cfgGroups = configFile >> "CfgGroups";
private _allSides = ["West", "East", "Indep"];

private _fn_getOfficers = 
{
    params ["_faction"];

    private _officerClasses = [];
    private _config = configFile >> "CfgVehicles";

    private _unitList = _config call BIS_fnc_getCfgSubClasses;

    {
        private _unitConfig = _config >> _x;
        private _unitClass = configName _unitConfig;
        private _unitFaction = getText (_unitConfig >> "faction");

        if (_unitFaction == _faction) then 
        {
            private _classArray = _unitClass splitString "_-";
            
            {
                private _splittedName = toLower _x;
                if (_splittedName == "officer" && !(_unitClass in _officerClasses)) exitWith 
                {
                    _officerClasses pushBack _unitClass;
                };
            } forEach _classArray;
        };

    } forEach _unitList;

    _officerClasses
};

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
                    private _unitList = _groupConfig call BIS_fnc_getCfgSubClasses;
    
                    {
                        private _unitConfig = _groupConfig >> _x;

                        if (isClass _unitConfig) then 
                        {
                            private _unitClass = getText (_unitConfig >> "vehicle");

                            if !(_unitClass in _allUnits) then 
                            {
                                _allUnits pushBack _unitClass;
                            };
                        };
                    } forEach _unitList;
                };
            } forEach _categoryGroups;
        } forEach _filteredCategories;
    };
} forEach _allSides;

_unitClasses = [_allUnits, DSC_VehicleKeywords] call F90_fnc_filterArray;

private _officerClasses = [_faction] call _fn_getOfficers;
_unitClasses append _officerClasses;

// Remove duplicates 
_unitClasses = _unitClasses arrayIntersect _unitClasses;

_unitClasses