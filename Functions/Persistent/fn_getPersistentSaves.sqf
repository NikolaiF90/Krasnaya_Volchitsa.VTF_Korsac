private _persistentSaves = profileNameSpace getVariable [Persistent_PersistentListKey, ["Empty Slot"]];
if (count _persistentSaves < 1) then 
{
    _persistentSaves = ["Empty Slot"];
};
_persistentSaves