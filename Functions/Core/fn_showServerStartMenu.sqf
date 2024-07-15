while {true} do
{
    // Terminate loops once server started
    if (Server_Started) exitWith {};

    // If somehow the dialog got closed by player, force recreate the dialog
    if !(dialog) then 
    {
        createDialog "serverStartMenu";

        // Title
        ctrlSetText [ServerMenu_TitleIDC, format ["Server Setup: %1", Scenario_Name]];

        // Side                         
        Mission_AllSidesLabel = ["--Select Side--", "West", "East", "Independent"];

        [ServerMenu_AlliedSideComboIDC, Mission_AllSidesLabel] call F90_fnc_populateListBox;
        [ServerMenu_EnemySideComboIDC, Mission_AllSidesLabel] call F90_fnc_populateListBox;

        // Factions 
        Mission_AlliedFactionList = [];
        Mission_EnemyFactionList = [];

        Mission_EastFactions = [];
        Mission_EastFactionsLabels = [];
        Mission_WestFactions = [];
        Mission_WestFactionsLabels = [];
        Mission_IndependentFactions = [];
        Mission_IndependentFactionsLabels = [];
        
        // Find Factions Addon 
        [] call F90_fnc_findFactionAddons;

        // Populate the labels 
        private _labelList = [Mission_EastFactionsLabels, Mission_WestFactionsLabels, Mission_IndependentFactionsLabels];
        private _factionArrayList = [Mission_EastFactions, Mission_WestFactions, Mission_IndependentFactions];
        
        // Iterate through all factions
        {
            // Store current faction into _selectedFactionList
            private _selectedFactionList = _x;
            private _selectedLabelList = _labelList select _forEachIndex;

            // Iterate through all datas stored in current selected faction list
            {
                // Store the data into _factionData
                _factionData = _x;
                // Get the displayName 
                _factionDisplayName = _factionData select 1;

                // Transfer the displayName into related labelList 
                _selectedLabelList pushBack _factionDisplayName;
            } forEach _selectedFactionList;
        } forEach _factionArrayList;

        // Populate Faction's combobox
        [ServerMenu_AlliedFactionComboIDC, ["--Select Faction--"]] call F90_fnc_populateListBox;
        [ServerMenu_EnemyFactionComboIDC, ["--Select Faction--"]] call F90_fnc_populateListBox;

        // EH
        (findDisplay ServerMenu_ServerStartMenuIDC) displayCtrl ServerMenu_AlliedSideComboIDC ctrlAddEventHandler
        [
            "LBSelChanged",
            {
                private _thisComboIDC = ServerMenu_AlliedSideComboIDC;
                private _thisFactionComboIDC = ServerMenu_AlliedFactionComboIDC;
                private _opposingComboIDC = ServerMenu_EnemySideComboIDC;
                private _selectedIndex = lbCurSel _thisComboIDC;
                
                Mission_AlliedFactionList = [];

                if (_selectedIndex == 0 || _selectedIndex == -1) then 
                {
                    Mission_AlliedSide = nil;
                    [_thisFactionComboIDC, ["--Select Faction--"]] call F90_fnc_populateListBox;
                    DSC_AlliedFaction = nil;
                } else 
                {
                    switch (_selectedIndex) do 
                    {
                        case 1: 
                        {
                            Mission_AlliedSide = west;
                            [_thisFactionComboIDC, Mission_WestFactionsLabels] call F90_fnc_populateListBox;
                            Mission_AlliedFactionList append Mission_WestFactions;
                        };
                        case 2:
                        {
                            Mission_AlliedSide = east;
                            [_thisFactionComboIDC, Mission_EastFactionsLabels] call F90_fnc_populateListBox;
                            Mission_AlliedFactionList append Mission_EastFactions;
                        };
                        case 3:
                        {
                            Mission_AlliedSide = independent;
                            [_thisFactionComboIDC, Mission_IndependentFactionsLabels] call F90_fnc_populateListBox;
                            Mission_AlliedFactionList append Mission_IndependentFactions;
                        };
                    };
                    DSC_AlliedFaction = ((Mission_AlliedFactionList select 0) select 0);
                };
            }
        ];

        (findDisplay ServerMenu_ServerStartMenuIDC) displayCtrl ServerMenu_EnemySideComboIDC ctrlAddEventHandler
        [
            "LBSelChanged",
            {
                private _thisComboIDC = ServerMenu_EnemySideComboIDC;
                private _thisFactionComboIDC = ServerMenu_EnemyFactionComboIDC;
                private _opposingComboIDC = ServerMenu_AlliedSideComboIDC;
                private _selectedIndex = lbCurSel _thisComboIDC;

                Mission_EnemyFactionList = [];

                if (_selectedIndex == 0 || _selectedIndex == -1) then 
                {
                    Mission_EnemySide = nil;
                    [_thisFactionComboIDC, ["--Select Faction--"]] call F90_fnc_populateListBox;
                    DSC_EnemyFaction = nil;
                } else 
                {
                    switch (_selectedIndex) do 
                    {
                        case 1: 
                        {
                            Mission_EnemySide = west;
                            [_thisFactionComboIDC, Mission_WestFactionsLabels] call F90_fnc_populateListBox;
                            Mission_EnemyFactionList append Mission_WestFactions;
                        };
                        case 2:
                        {
                            Mission_EnemySide = east;
                            [_thisFactionComboIDC, Mission_EastFactionsLabels] call F90_fnc_populateListBox;
                            Mission_EnemyFactionList append Mission_EastFactions;
                        };
                        case 3:
                        {
                            Mission_EnemySide = independent;
                            [_thisFactionComboIDC, Mission_IndependentFactionsLabels] call F90_fnc_populateListBox;
                            Mission_EnemyFactionList append Mission_IndependentFactions;
                        };
                    };
                    DSC_EnemyFaction = ((Mission_EnemyFactionList select 0) select 0); 
                };
            }
        ];

        (findDisplay ServerMenu_ServerStartMenuIDC) displayCtrl ServerMenu_AlliedFactionComboIDC ctrlAddEventHandler
        [
            "LBSelChanged",
            {
                private _thisComboIDC = ServerMenu_AlliedFactionComboIDC;
                private _factionSelection = lbCurSel _thisComboIDC;

                DSC_AlliedFaction = ((Mission_AlliedFactionList select _factionSelection) select 0);
            }
        ];

        (findDisplay ServerMenu_ServerStartMenuIDC) displayCtrl ServerMenu_EnemyFactionComboIDC ctrlAddEventHandler
        [
            "LBSelChanged",
            {
                private _thisComboIDC = ServerMenu_EnemyFactionComboIDC;
                private _factionSelection = lbCurSel _thisComboIDC;

                DSC_EnemyFaction = ((Mission_EnemyFactionList select _factionSelection) select 0);
            }
        ];

        // Time Slider 
        Mission_Time = 12.5;
        private _timeString = [Mission_Time] call F90_fnc_convertToTime;
        
        ctrlSetText [ServerMenu_TimeTextIDC, _timeString];
        
        sliderSetRange [ServerMenu_TimeSliderIDC, 0, 23.90];
        sliderSetSpeed [ServerMenu_TimeSliderIDC, 1, 0.5, 0.5];
        
        (findDisplay ServerMenu_ServerStartMenuIDC) displayCtrl ServerMenu_TimeSliderIDC ctrlAddEventHandler
        [
            "SliderPosChanged",
            {
                params ["_control", "_newValue"];
                
                Mission_Time = _newValue;
                private _timeString = [Mission_Time] call F90_fnc_convertToTime;

                ctrlSetText [ServerMenu_TimeTextIDC, _timeString];
            }
        ];

        // Skill Slider

        ctrlSetText [ServerMenu_AlliedSkillTextIDC, str Mission_DefaultAlliedSkill];
        ctrlSetText [ServerMenu_EnemySkillTextIDC, str Mission_DefaultEnemySkill];

        sliderSetRange [ServerMenu_AlliedSkillSliderIDC, 0.05, 1];
        sliderSetRange [ServerMenu_EnemySkillSliderIDC, 0.05, 1];

        sliderSetSpeed [ServerMenu_AlliedSkillSliderIDC, 0.1, 0.05, 0.05];
        sliderSetSpeed [ServerMenu_EnemySkillSliderIDC, 0.1, 0.05, 0.05];

        (findDisplay ServerMenu_ServerStartMenuIDC) displayCtrl ServerMenu_AlliedSkillSliderIDC ctrlAddEventHandler
        [
            "SliderPosChanged",
            {
                params ["_control", "_newValue"];
                
                Mission_DefaultAlliedSkill = _newValue;
                ctrlSetText [ServerMenu_AlliedSkillTextIDC, str Mission_DefaultAlliedSkill];
            }
        ];

        (findDisplay ServerMenu_ServerStartMenuIDC) displayCtrl ServerMenu_EnemySkillSliderIDC ctrlAddEventHandler
        [
            "SliderPosChanged",
            {
                params ["_control", "_newValue"];
                
                Mission_DefaultEnemySkill = _newValue;
                ctrlSetText [ServerMenu_EnemySkillTextIDC, str Mission_DefaultEnemySkill];
            }
        ];
    };
    sleep 5;
};