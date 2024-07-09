if (TimeSkip_TotalTimeSkip == 0) exitWith {};

if (dialog) then 
{
    closeDialog 0;
};

skipTime TimeSkip_TotalTimeSkip;
TimeSkip_TotalTimeSkip = 0;