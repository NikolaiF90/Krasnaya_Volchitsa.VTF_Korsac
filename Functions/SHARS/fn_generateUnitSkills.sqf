/*
    Author: PrinceF90

    Description:
        This function assigns skill levels to different classes based on predefined arrays of soldiers. The function then updates the unit data with the assigned skills.

    Parameter(s):
        None

    Returns:
        None
*/
private _allSoldiersArray = [SHARS_TierOneSoldiers, SHARS_TierTwoSoldiers, SHARS_TierThreeSoldiers];
private _skillArrays = [SHARS_TierOneSkill, SHARS_TierTwoSkill, SHARS_TierThreeSkill];

{
    private _soldierList = _x;
    private _listIndex = _forEachIndex;
    {
        private _unitData = _x;
        private _dataIndex = _forEachIndex;
        private _className = _unitData select 1;
        private _skill = -1;
        {
            private _array = _x;
            private _arrayIndex = _forEachIndex;

            if (_skill == -1) then
            {
                {
                    if (_x select 1 == _className) exitWith 
                    {
                        _skill = _skillArrays select _arrayIndex;
                    };
                } forEach _array;
            };
        } forEach _allSoldiersArray;

        // Sets default to Tier One Skills if can't find one
        if (_skill == -1) then 
        {
            _skill = SHARS_TierOneSkill;
        };

        private _unitSkills = [];
        for "_i" from 0 to 7 do 
        {
            _unitSkills pushBack _skill;
        };

        _unitData set [2, _unitSkills];
        _soldierList set [_dataIndex, _unitData];
    } forEach _soldierList;
} forEach _allSoldiersArray;