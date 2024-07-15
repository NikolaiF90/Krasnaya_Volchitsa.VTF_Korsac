/*
    Author: PrinceF90

    Description:
        Function to check the eligibility of a provided unit to command a squad or high command (HC) based on the number of subordinates and certain perks unlocked. Returns true if current subordinates count hasn't reached max perks limit

    Parameter(s):
        _leader - The leader unit to check the commanding egibility. [OBJECT]
        _commandingLevel - Indicates the commanding level to check. Possible values are: "SQUAD" and "HC". [STRING]

    Returns: 
        _unlocked - returns true if current subordinates count hasn't reached max perks limit
*/
params ["_leader", "_commandingLevel"];

private _fn_checkEligibility = 
{
    params ["_unlocked", "_leader", "_subordinatesCount", "_unitCaps", "_perkKey"];

    if !(_unlocked) then 
    {
        if (_subordinatesCount < _unitCaps) then 
        {
            _unlocked = [_leader, _perkKey] call F90_fnc_getPerkKeyState;
        } else 
        {
            _unlocked = false;
        };
    };

    _unlocked
};

private _defaultState = false;

if (_commandingLevel isEqualTo "SQUAD") then 
{
    private _subordinatesCount = count (units group _leader);
    // Do not include the leader 
    _subordinatesCount = _subordinatesCount -1;

    _defaultState = [_defaultState, _leader, _subordinatesCount, PERK_TL1MaxUnits, "PERK_TeamLeader1"] call _fn_checkEligibility;
    _defaultState = [_defaultState, _leader, _subordinatesCount, PERK_TL2MaxUnits, "PERK_TeamLeader2"] call _fn_checkEligibility;
    _defaultState = [_defaultState, _leader, _subordinatesCount, PERK_TL3MaxUnits, "PERK_TeamLeader3"] call _fn_checkEligibility;
};

if (_commandingLevel isEqualTo "HC") then 
{
    private _allHCSquadsCount = count (hcAllGroups _leader);

    _defaultState = [_defaultState, _leader, _allHCSquadsCount, PERK_SL1MaxUnits, "PERK_SquadLeader1"] call _fn_checkEligibility;
};

_defaultState