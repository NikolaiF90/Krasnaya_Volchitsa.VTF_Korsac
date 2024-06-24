params ["_unit"];

if (dialog) then
{
    closeDialog 2;
};

createDialog "squadManagementMenu";

["ALL"] call F90_fnc_refreshSquadMenu;