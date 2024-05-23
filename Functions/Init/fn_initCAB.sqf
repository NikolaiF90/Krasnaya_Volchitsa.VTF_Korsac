

CAB_WantedList = [];
CAB_PotentialHVT = 
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

for "_i" from 0 to 2 do 
{
    private _wantedIndex = floor random (count CAB_PotentialHVT);
    private _wantedName = CAB_PotentialHVT # _wantedIndex;
    CAB_WantedList pushBack _wantedName;
    CAB_WantedList deleteAt _wantedIndex;
};