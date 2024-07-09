SHARS_TierOneSoldiers = [];
SHARS_TierTwoSoldiers = [];
SHARS_TierThreeSoldiers = [];

SHARS_TierOneSoldiers = [SHARS_SoldiersData, "TierOne"] call F90_fnc_generateUnitTiers;
SHARS_TierTwoSoldiers = [SHARS_SoldiersData, "TierTwo"] call F90_fnc_generateUnitTiers;
SHARS_TierThreeSoldiers = [SHARS_SoldiersData, "TierThree"] call F90_fnc_generateUnitTiers;

[SHARS_TierOneSoldiers] call F90_fnc_generateHireCost;
[SHARS_TierTwoSoldiers] call F90_fnc_generateHireCost;
[SHARS_TierThreeSoldiers] call F90_fnc_generateHireCost;

[] call F90_fnc_generateSquadShopData;