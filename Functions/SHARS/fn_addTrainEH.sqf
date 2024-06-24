params ["_sliderIDC"];

findDisplay TrainMenu_MainIDD displayCtrl _sliderIDC ctrlAddEventHandler ["SliderPosChanged",
{
    params ["_control", "_newValue"]; 

    // Get the idc of the affected slider
    private _sliderIDC = ctrlIDC _control;

    // Find the slider index 
    private _allSliderIDC = player getVariable "TrainMenu_AllSliderIDC";
    private _index = _allSliderIDC find _sliderIDC;

    // Find the text related to the slider
    private _allTextIDC = player getVariable "TrainMenu_AllTextIDC";
    private _textIDC = _allTextIDC select _index;

    // Find the default text 
    private _allDefaultText = player getVariable "TrainMenu_AllDefaultText";
    private _defaultText = _allDefaultText select _index;

    if (_newValue > 0) then 
    {
        private _text = format ["%1 +%2", _defaultText, _newValue];
        ctrlSetText [_textIDC, _text];
    } else 
    {
        ctrlSetText [_textIDC, _defaultText];
    };

    private _trainArray = player getVariable "SHARS_TrainArray"; 
    _trainArray set [_index, _newValue];
    player setVariable ["SHARS_TrainArray", _trainArray, true];
    
    // Get total added points 
    private _totalAddedPoints = 0;
    {
        _totalAddedPoints = _totalAddedPoints + _x;
    } forEach _trainArray;
    player setVariable ["SHARS_TotalAddedPoints", _totalAddedPoints];

    // Find cost text 
    private _costPriceIDC = player getVariable "TrainMenu_CostTextIDC";
    // Calculate total cost 
    private _trainCost = (_totalAddedPoints * 100) * SHARS_TrainingCost;
    // Save to player namespace so the Train Unit action can access it
    player setVariable ["SHARS_TrainUnitCost", _trainCost]; 
    // Update cost text
    private _costText = format ["Cost: %1 milcash (%2)", _trainCost, _totalAddedPoints];
    ctrlSetText [_costPriceIDC, _costText];
}];