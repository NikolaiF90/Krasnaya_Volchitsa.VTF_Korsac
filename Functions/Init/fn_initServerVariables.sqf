
// Contains server-only variables

// Debug 
EconomyDebug = true;
Mission_InitDone = false;

Mission_TaskOfficerStartPos = getPos mapX;
Mission_EnemySide = west;

CAB_AllCivilianClassnames = [];

REC_PotentialHVT = 
[
    ["James Smith", "James", "Smith"], 
    ["Michael Johnson", "Michael", "Johnson"], 
    ["Christopher Brown", "Christopher", "Brown"], 
    ["Daniel Williams", "Daniel", "Williams"], 
    ["David Jones", "David", "Jones"], 
    ["Matthew Davis", "Matthew", "Davis"], 
    ["Andrew Wilson", "Andrew", "Wilson"], 
    ["Joseph Taylor", "Joseph", "Taylor"], 
    ["William Anderson", "William", "Anderson"], 
    ["John Martinez", "John", "Martinez"], 
    ["Robert Thomas", "Robert", "Thomas"], 
    ["Steven Garcia", "Steven", "Garcia"], 
    ["Brian Hernandez", "Brian", "Hernandez"], 
    ["Kevin Young", "Kevin", "Young"], 
    ["Jason Scott", "Jason", "Scott"], 
    ["Mark King", "Mark", "King"], 
    ["Thomas Lee", "Thomas", "Lee"], 
    ["Richard White", "Richard", "White"], 
    ["Paul Harris", "Paul", "Harris"], 
    ["Ryan Nelson", "Ryan", "Nelson"], 
    ["Eric Carter", "Eric", "Carter"], 
    ["Charles Mitchell", "Charles", "Mitchell"], 
    ["Anthony Perez", "Anthony", "Perez"], 
    ["Jeffrey Baker", "Jeffrey", "Baker"], 
    ["Scott Thompson", "Scott", "Thompson"], 
    ["Benjamin Ramirez", "Benjamin", "Ramirez"], 
    ["Samuel Evans", "Samuel", "Evans"], 
    ["Nicholas Collins", "Nicholas", "Collins"], 
    ["Jonathan Murphy", "Jonathan", "Murphy"], 
    ["Adam Rivera", "Adam", "Rivera"] 
];

// For deleting created units on map reset
Mission_CreatedUnits = [];

Mission_WestFIAUnits = 
[
    "B_G_Soldier_A_F",
    "B_G_Soldier_AR_F",
    "B_G_medic_F",
    "B_G_engineer_F",
    "B_G_Soldier_exp_F",
    "B_G_Soldier_GL_F",
    "B_G_Soldier_M_F",
    "B_G_officer_F",
    "B_G_Soldier_F",
    "B_G_Soldier_LAT_F",
    "B_G_Soldier_LAT2_F",
    "B_G_Soldier_lite_F",
    "B_G_Sharpshooter_F",
    "B_G_Soldier_SL_F",
    "B_G_Soldier_TL_F"
];

Mission_HVTUnits = 
[
    "B_officer_F",
    "B_Captain_Pettka_F"
];