params ["_defaultSelection"];

if (isNil {_defaultSelection}) then {_defaultSelection = 0};

private _unit = player;

if (dialog) then {closeDialog 1};

createDialog "skillTreeMenu";

// Get unit's SP balance
private _currentSP = _unit getVariable Economy_SPName;
// Show it in the menu
private _spText = format ["SP: %1", _currentSP];
ctrlSetText [SkillMenu_SPTextIDC, _spText];

// Get unit's skill
private _unitSkills = _unit getVariable "Skill_Tree";

// Display skill in the menu
private _allSkillsDisplay = [];
{
    private _skillData = _x;
    private _skillName = _skillData select 0;
    private _skillDescription = _skillData select 1;
    private _skillUpgradeText = _skillData select 2;
    private _skillLevel = _skillData select 3;

    private _levelText = "";
    if (_skillLevel == 0) then 
    {
        _levelText = "Locked";
    } else 
    {
        _levelText = format ["Level %1", _skillLevel];
    };

    private _text = format ["%1 - %2. Each upgrade %3. (%4)", _skillName, _skillDescription, _skillUpgradeText, _levelText];
    _allSkillsDisplay set [_forEachIndex, _text];
} forEach _unitSkills;
[SkillMenu_SkillsListBoxIDC, _allSkillsDisplay, _defaultSelection] call F90_fnc_populateListBox;

// Sets default (Before EH takes place)
private _selectedSkill = (_unitSkills select (lbCurSel SkillMenu_SkillsListBoxIDC));
private _skillLevel = _selectedSkill select 3;
private _maxLevel = _selectedSkill select 4;
private _upgradePrice = _selectedSkill select 5;

if (_skillLevel < _maxLevel) then 
{
    private _buttonText = "";
    if (_skillLevel == 0) then 
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

// Change button appearance based on selected item
(findDisplay SkillMenu_MenuIDD) displayCtrl SkillMenu_SkillsListBoxIDC ctrlAddEventHandler ["LBSelChanged", 
{
    params ["_control", "_lbCurSel", "_lbSelection"];

    private _unit = player;
    
    private _unitSkills = _unit getVariable "Skill_Tree";
    private _selectedSkill = (_unitSkills select _lbCurSel);
    private _skillLevel = _selectedSkill select 3;
    private _maxLevel = _selectedSkill select 4;
    private _upgradePrice = _selectedSkill select 5;

    if (_skillLevel < _maxLevel) then 
    {
        private _buttonText = "";
        if (_skillLevel == 0) then 
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