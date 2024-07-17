params ["_defaultSelection"];

if (isNil {_defaultSelection}) then {_defaultSelection = 0};

private _unit = player;

if (dialog) then {closeDialog 1};

createDialog "skillTreeMenu";

private _currentSP = _unit getVariable "Skill_Points";
private _spText = format ["SP: %1", _currentSP];
ctrlSetText [SkillMenu_SPTextIDC, _spText];

private _allSkills = _unit getVariable ["Skill_AllSkills", []];

if (count _allSkills < 1) then 
{
    _allSkills = Skill_DefaultSkills;
};
_unit setVariable ["Skill_AllSkills", _allSkills, true];

private _allSkillsDisplay = [];
{
    private _skill = _x;
    private _skillName = _skill select 0;
    private _skillDescription = _skill select 1;
    private _skillLevel = _skill select 2;

    private _levelText = "";
    if (_skillLevel == -1) then 
    {
        _levelText = "Locked";
    } else 
    {
        _levelText = format ["Level %1", _skillLevel];
    };

    private _text = format ["%1 - %2 (%3)", _skillName, _skillDescription, _levelText];
    _allSkillsDisplay set [_forEachIndex, _text];
} forEach _allSkills;

[SkillMenu_SkillsListBoxIDC, _allSkillsDisplay, _defaultSelection] call F90_fnc_populateListBox;

// Sets default (Before EH takes place)
private _selectedSkill = (_allSkills select (lbCurSel SkillMenu_SkillsListBoxIDC));
private _skillLevel = _selectedSkill select 2;
private _maxLevel = _selectedSkill select 3;
private _upgradePrice = _selectedSkill select 4;

if (_skillLevel < _maxLevel) then 
{
    private _buttonText = "";
    if (_skillLevel == -1) then 
    {
        _buttonText = format ["Unlock (%1 SP)", _upgradePrice];
    } else
    {
        _buttonText = format ["Upgrade (%1 SP)", _upgradePrice];
    };

    ctrlEnable [SkillMenu_UpgradeButtonIDC, true];
    ctrlSetText [SkillMenu_UpgradeButtonIDC, _buttonText];
} else 
{
    ctrlEnable [SkillMenu_UpgradeButtonIDC, false];
};

(findDisplay SkillMenu_MenuIDD) displayCtrl SkillMenu_SkillsListBoxIDC ctrlAddEventHandler ["LBSelChanged", 
{
    params ["_control", "_lbCurSel", "_lbSelection"];

    private _unit = player;
    
    private _allSkills = _unit getVariable ["Skill_AllSkills", []];
    private _selectedSkill = (_allSkills select _lbCurSel);
    private _skillLevel = _selectedSkill select 2;
    private _maxLevel = _selectedSkill select 3;
    private _upgradePrice = _selectedSkill select 4;

    if (_skillLevel < _maxLevel) then 
    {
        private _buttonText = "";
        if (_skillLevel == -1) then 
        {
            _buttonText = format ["Unlock (%1 SP)", _upgradePrice];
        } else
        {
            _buttonText = format ["Upgrade (%1 SP)", _upgradePrice];
        };
        
        ctrlEnable [SkillMenu_UpgradeButtonIDC, true];
        ctrlSetText [SkillMenu_UpgradeButtonIDC, _buttonText];
    } else
    {
        ctrlEnable [SkillMenu_UpgradeButtonIDC, false];
    };
}];