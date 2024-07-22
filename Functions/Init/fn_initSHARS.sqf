
// Format [DisplayName, ClassName];
SHARS_SoldiersData = [DSC_AlliedUnitList, configFile >> "CfgVehicles"] call F90_fnc_generateDisplayName;
SHARS_SquadsData = [DSC_AlliedFaction] call F90_fnc_generateSquadData;

// Generate unit data like skills and hire cost
//[] remoteExec ["F90_fnc_generateShopData", 0, true];
[] call F90_fnc_generateShopData;

// Init action 
[
    recruitX, 
    "Hire Recruits", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [] call F90_fnc_showHireMenu;
    },
    "alive _this",
    "SHARS_RecruitActionID"
] remoteExec ["F90_fnc_addAction", 0, true];

[
    reserveX,
    "Manage Squads",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] call F90_fnc_showSquadManagementMenu;
    },
    "alive _this",
    "SHARS_SquadManagementActionID"
] remoteExec ["F90_fnc_addAction", 0, true];