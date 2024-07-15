if (dialog) then
{
    closeDialog 1;
};

createDialog "persistentMenu";

//  Update Scenario Name 
ctrlSetText [PersistentMenu_ScenarioNameText, Scenario_Name];

//  Update List Box
private _persistentSaves = profileNameSpace getVariable Persistent_PersistentListKey;
if (count _persistentSaves < 1) then 
{
    _persistentSaves = ["Empty Slot"];
};

[PersistentMenu_SavesListBox, _persistentSaves, 0] call F90_fnc_populateListBox;