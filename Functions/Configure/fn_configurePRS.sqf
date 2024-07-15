PRS_AllRanks = 
// Array format [STRING:Rank, INT:OperationPoints, INT:OperationCountForPromotion, ARRAY:[STRING:PerkKey1,STRING:PerkKey2AndSoOn]]
[
    ["Trainee", 10, 2, []],
    ["Private", 20, 5, []],
    ["Private First Class", 25, 5, []],
    ["Corporal", 30, 10, ["PERK_SeizeAsset"]], 
    ["Sergeant", 50, 10, ["PERK_PurchaseUnit", "PERK_TeamLeader1"]],
    ["Staff Sergeant", 60, 5, ["PERK_CommandTeams", "PERK_TeamLeader2", "PERK_SquadLeader1"]],
    ["Sergeant First Class", 65, 10 ,["PERK_TrainUnit"]],
    ["Master Sergeant", 80, 5, ["PERK_TeamLeader3"]],
    ["First Sergeant", 85, 5, []],
    ["Sergeant Major", 100, 5, []],
    ["Command Sergeant Major", 110, 10, []],
    ["Sergeant Major of the Army", 150, 15, []], 
    ["Second Lieutenant", 200, 5, ["PERK_CommandSquad"]], 
    ["First Lieutenant", 250, 10, ["PERK_PlatoonCommander"]],
    ["Captain", 300, 5, 5, []],
    ["Major", 500, 15, []],
    ["Lieutenant Colonel", 700, 20, []],
    ["Colonel", 1000, 20, []]
];

