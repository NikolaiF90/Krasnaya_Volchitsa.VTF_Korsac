// Initialize arrays to store faction names and display names by side
Mission_WestFactions = [];
Mission_EastFactions = [];
Mission_IndependentFactions = [];
Mission_CivilianFactions = [];

// Function to add factions to the respective array
private _fn_addToSideArray = 
{
    params ["_sideArray", "_factionClass", "_displayName"];

    _sideArray pushBack [configName _factionClass, _displayName];
};

// Get the config path to CfgFactionClasses
private _cfgFactionClasses = configFile >> "CfgFactionClasses";

// Count the number of factions 
private _factionCounts = count _cfgFactionClasses;

// Iterate over all factions 
for "_i" from 0 to _factionCounts -1 do 
{
    // Get the faction class
    private _factionClass = _cfgFactionClasses select _i;

    // Skip any invalid entries like 'access'
    if (configName _factionClass == "access") then 
    {
        [MissionDebug, "findFactionAddons", format ["Skipping invalid entry: %1", configName _factionClass], false, false] call F90_fnc_debug;
        continue;
    };

    // Check if the faction class has a displayName and side
    if (isClass _factionClass && isText (_factionClass >> "displayName") && isNumber (_factionClass >> "side")) then 
    {
        // Get the faction's display name 
        private _displayName = getText (_factionClass >> "displayName");

        // Get the faction's side 
        private _side = getNumber (_factionClass >> "side");

        // Add the faction to the appropriate array 
        switch (_side) do 
        {
            case 0: 
            {
                [Mission_EastFactions, _factionClass, _displayName] call _fn_addToSideArray;
            };
            case 1: 
            {
                [Mission_WestFactions, _factionClass, _displayName] call _fn_addToSideArray;
            };
            case 2: 
            {
                [Mission_IndependentFactions, _factionClass, _displayName] call _fn_addToSideArray;
            };
            case 3: 
            {
                [Mission_CivilianFactions, _factionClass, _displayName] call _fn_addToSideArray;
            };
        };
    } else 
    {
        [MissionDebug, "findFaction", format ["Invalid faction entry: %1, has displayName: %2, has side: %3", configName _factionClass, isText (_factionClass >> "displayName"), isNumber (_factionClass >> "side")], false, false] call F90_fnc_debug;
    };
};