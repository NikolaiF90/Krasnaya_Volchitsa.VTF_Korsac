HIRE_TierOneSkill = 0.4;
HIRE_TierTwoSkill = 0.6;
HIRE_TierThreeSkill = 0.8;

HIRE_TierOneName = "Regular";
HIRE_TierTwoName = "Recon Units";
HIRE_TierThreeName = "Special Forces";

HIRE_TierOneSoldiers = 
[
    ["Rifleman", "min_rf_soldier", 8],
    ["Rifleman AT", "min_rf_soldier_LAT", 10],
    ["Rifleman Light", "min_rf_soldier_lite", 10],
    ["Ammo Bearer", "min_rf_soldier_A", 10],
    ["Combat Life Saver", "min_rf_medic", 10],
    ["Grenadier", "min_rf_soldier_GL", 10],
    ["Autorifleman", "min_rf_soldier_AR", 10],
    ["Gunner AGS-30", "min_rf_support_AGS", 10],
    ["Engineer", "min_rf_engineer", 12],
    ["Explosive Specialist", "min_rf_soldier_exp", 12],
    ["Marksman", "min_rf_soldier_M", 12],
    ["Asst. Missile AA", "min_rf_soldier_AAA", 12],
    ["Asst. Missile AT", "min_rf_soldier_AAT", 12],
    ["Missile Specialist AA", "min_rf_soldier_AA", 14],
    ["Missile Specialist AT", "min_rf_soldier_AT", 14],
    ["Para Trooper", "min_rf_soldier_PG", 14]
];

HIRE_TierTwoSoldiers = 
[
    ["Recon Demo Specialist", "min_rf_recon_exp", 16],
    ["Recon JTAC", "min_rf_recon_JTAC", 16],
    ["Recon Marksman", "min_rf_recon_M", 16],
    ["Recon Paramedic", "min_rf_recon_medic", 16],
    ["Recon Saboteur", "min_rf_recon_saboteur", 16],
    ["Recon Scout", "min_rf_recon", 16],
    ["Recon Scout AT", "min_rf_recon_LAT", 20],
    ["Sniper", "min_rf_sniper", 20],
    ["Spotter", "min_rf_spotter", 20]
];

HIRE_TierThreeSoldiers = 
[
    ["Spetsnaz Rifleman", "min_rf_spetsnaz", 20],
    ["Spetsnaz Autorifleman", "min_rf_spetsnaz_AR", 22],
    ["Spetsnaz Grenadier", "min_rf_spetsnaz_GL", 22],
    ["Spetsnaz Operator", "min_rf_spetsnaz_O", 22],
    ["Spetsnaz Sniper", "min_rf_spetsnaz_M", 24],
    ["Spetsnaz Team Leader", "min_rf_spetsnaz_TL", 24]
];

HIRE_Squad = 
[
    [
        "Fire Team", 
        [
            "min_rf_soldier_TL", 
            "min_rf_soldier_AR", 
            "min_rf_soldier_GL", 
            "min_rf_soldier_LAT"
        ],
        40,
        HIRE_TierOneSkill
    ],
    [
        "Assault Squad",
        [
            "min_rf_soldier_SL", 
            "min_rf_soldier_AR", 
            "min_rf_soldier_AAR", 
            "min_rf_soldier_M", 
            "min_rf_soldier_LAT", 
            "min_rf_medic"
        ],
        62,
        HIRE_TierOneSkill
    ],
    [
        "Recon Team",
        [
            "min_rf_recon_TL", 
            "min_rf_recon_M", 
            "min_rf_recon_medic", 
            "min_rf_recon"
        ],
        62,
        HIRE_TierTwoSkill
    ],
    [
        "Recon Squad",
        [
            "min_rf_recon_TL", 
            "min_rf_recon_M", 
            "min_rf_recon_medic", 
            "min_rf_recon", 
            "min_rf_recon_LAT", 
            "min_rf_recon_JTAC", 
            "min_rf_recon_exp"
        ],
        113,
        HIRE_TierTwoSkill
    ],
    [
        "Sniper Team",
        [
            "min_rf_sniper", 
            "min_rf_spotter"
        ],
        38,
        HIRE_TierTwoSkill
    ],
    [
        "Spetsnaz Snipers",
        [
            "min_rf_spetsnaz_M", 
            "min_rf_spetsnaz_O"
        ],
        44,
        HIRE_TierThreeSkill
    ],
    [
        "Spetsnaz Team",
        [
            "min_rf_spetsnaz_TL", 
            "min_rf_spetsnaz_AR", 
            "min_rf_spetsnaz_GL", 
            "min_rf_spetsnaz"
        ],
        84,
        HIRE_TierThreeSkill
    ]
];

