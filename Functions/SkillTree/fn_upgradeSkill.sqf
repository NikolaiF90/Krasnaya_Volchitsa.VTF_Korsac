params ["_skillName"];

private _unit = player;

if (isNil {_skillName}) then {_skillName = ""};
private _skillSelection = [];
private _selectionIndex = -1;
private _allSkills = _unit getVariable "Skill_AllSkills";

// If skill name not provided, get from lb selection instead
if (_skillName isEqualTo "") then 
{
    _skillSelection = _allSkills select (lbCurSel SkillMenu_SkillsListBoxIDC);
    _skillName = _skillSelection select 0;
    _selectionIndex = lbCurSel SkillMenu_SkillsListBoxIDC;
} else
{
    {
        private _xName = _x select 0;
        if (_xName isEqualTo _skillName) then 
        {
            _skillSelection = _x;
            _selectionIndex = _forEachIndex;
        };
    } forEach _allSkills;
};

// Get the skill level 
private _skillLevel = _skillSelection select 2;
// Get the skill price 
private _skillPrice = _skillSelection select 4;

// Apply upgrade 
private _sp = _unit getVariable "Skill_Points";
if (_sp >= _skillPrice) then 
{
    // Deduct SP
    [_unit, _skillPrice] call F90_fnc_deductSP;

    private _text = "";
    // Apply new data 
    if (_skillLevel != -1) then 
    {
        _skillLevel = _skillLevel + 1;
        _text = format ["You have upgraded %1 to level %2", _skillName, _skillLevel];
    } else 
    {
        _skillLevel = 1;
        _text = format ["You have unlocked %1", _skillName];
    };

    _skillPrice = _skillPrice * Skill_UpgradeMultiplier;

    private _newSkillData = [_skillName, _skillSelection select 1, _skillLevel, _skillSelection select 3, _skillPrice];
    _allSkills set [_selectionIndex, _newSkillData];
    _unit setVariable ["Skill_AllSkills", _allSkills, true];

    [_text, "DEFAULT"] call F90_fnc_textNotification;
    [_selectionIndex] call F90_fnc_openSkillMenu;
} else 
{
    ["You do not have enough SP", "ERROR"] call F90_fnc_textNotification;
};

