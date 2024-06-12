createDialog "persistentMenu";

//  Update Scenario Name 
ctrlSetText [PersistentMenu_ScenarioNameText, Scenario_Name];

//  Update List Box
[PersistentMenu_ListBox] call F90_fnc_updatePersistentList;

//  Tab Variables
PersistentMenu_SelectedList = [PersistentMenu_ListBox] call F90_fnc_getSelectedList;