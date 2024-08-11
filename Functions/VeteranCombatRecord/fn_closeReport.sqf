if (dialog) then 
{
    closeDialog 1;
};

if (isServer && hasInterface) then 
{
    [] remoteExec ["F90_fnc_debriefingTimeSkip", 0, true];
};