params ["_skillName"];

private _unit = player;

if (isNil {_skillName}) then {_skillName = ""};
private _skillSelection = [];
private _selectionIndex = -1;
// Get unit's skill
private _unitSkills = _unit getVariable "Skill_Tree";

// If skill name not provided, get from lb selection instead
if (_skillName isEqualTo "") then 
{
    _selectionIndex = lbCurSel SkillMenu_SkillsListBoxIDC;
    _skillSelection = _unitSkills select _selectionIndex;
    _skillName = _skillSelection select 0;
} else
{
    {
        private _xName = _x select 0;
        if (_xName isEqualTo _skillName) exitWith 
        {
            _skillSelection = _x;
            _selectionIndex = _forEachIndex;
        };
    } forEach _unitSkills;
};

// Get the skill level 
private _skillLevel = _skillSelection select 3;
// Get the upgrade cost 
private _upgradeCost = _skillSelection select 5;

// Apply upgrade 
private _sp = _unit getVariable Economy_SPName;
if (_sp >= _upgradeCost) then 
{
    // Deduct SP
    [_unit, _upgradeCost] call F90_fnc_deductSP;

    // Upgrade unit's skill
    [_unit, _skillName] call F90_fnc_upgradeSkill;

    // Increase level
    _skillLevel = _skillLevel + 1;

    // Update skill data
    private _newSkillData = [_skillName, _skillSelection select 1, _skillSelection select 2, _skillLevel, _skillSelection select 4, _skillSelection select 5];
    _unitSkills set [_selectionIndex, _newSkillData];
    _unit setVariable ["Skill_Tree", _unitSkills, true];
    
    // Notify player
    private _text = if (_skillLevel != 0) then 
    {
        format ["You have upgraded %1 to level %2", _skillName, _skillLevel]
    } else 
    {
        format ["You have unlocked %1", _skillName]
    };
    [_text, "DEFAULT"] call F90_fnc_textNotification;
    // Refresh the menu
    [_selectionIndex] call F90_fnc_openSkillMenu;
} else 
{
    ["You do not have enough SP", "ERROR"] call F90_fnc_textNotification;
};

