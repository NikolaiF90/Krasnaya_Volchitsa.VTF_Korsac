private _allSoldiersArray = [SHARS_TierOneSoldiers, SHARS_TierTwoSoldiers, SHARS_TierThreeSoldiers];

{
    private _soldierList = _x;
    private _listIndex = _foreachIndex;

    {
        private _unitData = _x;
        private _dataIndex = _forEachIndex;
        private _className = _unitData select 1;
        private _skillsArray = _unitData select 2;
        private _skills = 
        [
            "aimingAccuracy",
            "aimingShake",
            "aimingSpeed",
            "spotDistance",
            "spotTime",
            "courage",
            "reloadSpeed",
            "commanding"
        ];
        private _totalSkillCost = 0;

        for "_i" from 0 to (count _skillsArray)-1 do 
        {
            private _skill = _skillsArray select _i;
            private _skillCost = (_skill / 0.01) * SHARS_SkillHireValue;
            _totalSkillCost = _totalSkillCost + _skillCost;
        };

        private _tierMultiplier = [_className] call F90_fnc_getTierMultiplier;

        private _hireCost = (SHARS_BaseUnitCost + _totalSkillCost) * _tierMultiplier;
        _unitData set [3, _hireCost];
        _soldierList set [_dataIndex, _unitData];
    } forEach _soldierList;
} forEach _allSoldiersArray;