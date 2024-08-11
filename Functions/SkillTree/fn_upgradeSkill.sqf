params ["_unit", "_skillName"];

switch (_skillName) do 
{
    case "SharpEye": 
    {
        // Get current opacity
        private _opacity = _unit getVariable ["Skill_SharpEye", nil];
        // Set default if not found
        if (isNil {_opacity}) then 
        {
            _opacity = 0;
        };
        // Set increment per level
        private _opacityIncrement = 0.2;
        // Calculate the new value
        _opacity = _opacity + _opacityIncrement;
        // Save the value to unit
        _unit setVariable ["Skill_SharpEye", _opacity, true];
    };
    case "IFoundCash": 
    {
        // Get current bonus 
        private _bonus = _unit getVariable ["Skill_IFoundCash", 0];
        // Set default if not found 
        if (isNil {_bonus}) then 
        {
            _bonus = 0;
        };
        // Set increment per level 
        private _bonusIncrement = 2;
        // Calculate the new value
        _bonus = _bonus + _bonusIncrement;
        // Save the value to unit
        _unit setVariable ["Skill_IFoundCash", _bonus, true];
    };
};