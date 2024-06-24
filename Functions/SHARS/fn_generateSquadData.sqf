private _listArray = [SHARS_TierOneSoldiers, SHARS_TierTwoSoldiers, SHARS_TierThreeSoldiers];

{
    private _squadData = _x;
    private _squadIndex = _forEachIndex;
    private _squadMembers = _squadData select 1;
    private _squadCost = 0;

    {
        private _member = _x;
        private _className = _member select 0;
        private _memberIndex = _forEachIndex;
        {
            private _soldierList = _x;
            private _listIndex = _forEachIndex;

            {
                private _unitData = _x;
                if (_unitData select 1 == _className) exitWith 
                {
                    _squadMembers set [_memberIndex, _unitData];
                };
            } forEach _soldierList;
        } forEach _listArray;
        
        private _memberCost = (_squadMembers select _memberIndex) select 3;
        _squadCost = _squadCost + _memberCost;
    } forEach _squadMembers;
    
    private _reductionAmount = _squadCost * SHARS_SquadReductionMultiplier;
    private _finalSquadCost = _squadCost - _reductionAmount;
    _squadData set [2, floor _finalSquadCost];
} forEach SHARS_Squad;