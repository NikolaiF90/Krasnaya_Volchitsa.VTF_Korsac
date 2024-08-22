// Initialize arrays to store faction names and display names by side
Mission_WestFactions = [];
Mission_EastFactions = [];
Mission_IndependentFactions = [];

private _config = configFile >> "CfgGroups";
private _allSides = _config call BIS_fnc_getCfgSubClasses;

{
    private _side = _x;
    
    // Skip if side is "EMPTY";
    if (_side isEqualTo "Empty") then 
    {
        continue;
    };
    
    // Determine which array to fill the acquired faction
    private _factionList = nil;
    switch (_side) do 
    {
        case "East": 
        {
            _factionList = Mission_EastFactions;
        };
        case "West": 
        {
            _factionList = Mission_WestFactions;
        };
        case "Indep": 
        {
            _factionList = Mission_IndependentFactions;
        };
    };

    // Get all factions on current side
    private _allFactions = (_config >> _side) call BIS_fnc_getCfgSubClasses;

    // Populate _factionList 
    {
        private _displayName = getText (_config >> _side >> _x >> "name");
        _factionList pushBack [_x, _displayName];
    } forEach _allFactions;
} forEach _allSides;