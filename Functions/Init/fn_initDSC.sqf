DSC_AlliedUnitList = [];
DSC_EnemyUnitList = [];

DSC_VehicleKeywords = ["Motorized", "Mechanized", "Armored", "Boat", "SDV", "UAV", "UGV"];

DSC_AlliedUnitList = [DSC_AlliedFaction] call F90_fnc_getFactionUnits;
publicVariable "DSC_AlliedUnitList";
DSC_EnemyUnitList = [DSC_EnemyFaction] call F90_fnc_getFactionUnits;

DSC_OfficerClass = [DSC_AlliedUnitList, ["officer", "sl", "tl", "commander", "squadleader"]] call F90_fnc_getSuitableClass;