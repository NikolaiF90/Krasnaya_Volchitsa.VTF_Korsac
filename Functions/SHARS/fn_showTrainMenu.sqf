private _caller = player; 

if (lbSize SquadMenu_ReservePoolListBoxIDC > 0) then 
{
    private _selectedIndex = lbCurSel SquadMenu_ReservePoolListBoxIDC;

    if (_selectedIndex == -1 || _selectedIndex >= lbSize SquadMenu_ReservePoolListBoxIDC) then 
    {
        lbSetCurSel [SquadMenu_ReservePoolListBoxIDC, 0];
        _selectedIndex = 0;
    };

    // Close Squad Management Menu
    if (dialog) then 
    {
        closeDialog 2;
    };

    createDialog "trainMenu";

    private _allSliderIDC = 
    [
        TrainMenu_AimingAccuracySliderIDC, 
        TrainMenu_AimingShakeSliderIDC, 
        TrainMenu_AimingSpeedSliderIDC, 
        TrainMenu_SpotDistanceSliderIDC, 
        TrainMenu_SpotTimeSliderIDC, 
        TrainMenu_CourageSliderIDC, 
        TrainMenu_ReloadSpeedSliderIDC, 
        TrainMenu_CommandingSliderIDC
    ];

    private _allTextIDC = 
    [
        TrainMenu_AimingAccuracyTextIDC,
        TrainMenu_AimingShakeTextIDC,
        TrainMenu_AimingSpeedTextIDC,
        TrainMenu_SpotDistanceTextIDC,
        TrainMenu_SpotTimeTextIDC,
        TrainMenu_CourageTextIDC,
        TrainMenu_ReloadSpeedTextIDC,
        TrainMenu_CommandingTextIDC
    ];

    private _allDefaultText = [];

    private _reservePools = _caller getVariable "SHARS_ReservePool";
    private _unitData = _reservePools select _selectedIndex;
    private _skill = _unitData select 2;

    // Save the unit index so Train Unit Action can access it
    _caller setVariable ["SHARS_UnitIndex", _selectedIndex, true];

    _caller setVariable ["SHARS_TrainArray", [0,0,0,0,0,0,0,0], true];
    _caller setVariable ["TrainMenu_AllTextIDC", _allTextIDC, true];
    _caller setVariable ["TrainMenu_AllSliderIDC", _allSliderIDC, true];

    private _totalAddedPoints = 0;
    _caller setVariable ["SHARS_TotalAddedPoints", _totalAddedPoints];
    _caller setVariable ["TrainMenu_CostTextIDC", TrainMenu_CostTextIDC];

    ctrlSetText [TrainMenu_CostTextIDC, "Cost: 0 milcash (0)"];
    {
        private _index = _forEachIndex;
        private _subSkill = _skill select _index;
        private _subSkillMax = 1.00 - _subSkill;

        // Set slider range
        sliderSetRange [_x, 0, _subSkillMax];
        // Set slider speed 
        sliderSetSpeed [_x, 0.05, 0.01, 0.01];
        
        // Get the text IDC related to the slider 
        private _textIDC = _allTextIDC select _index;
        // Get the default text 
        private _defaultText = ctrlText _textIDC;
        // Put the default text into array
        _allDefaultText pushBack _defaultText;

        // Make array global 
        _caller setVariable ["TrainMenu_AllDefaultText", _allDefaultText, true];
        // Add EH to all sliders
        [_x] call F90_fnc_addTrainEH;
    } forEach _allSliderIDC;

    // Update unit name
    private _unitName = _unitData select 1;
    ctrlSetText [TrainMenu_SoldierNameTextIDC, _unitName];
};