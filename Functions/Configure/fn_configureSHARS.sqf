// Cost per 0.01 skill increase
SHARS_TrainingCost = 200;
// Value unit's per 0.01 skill. Used for generating unit's wage.
SHARS_SkillWageValue = 0.1;
// Value unit's per 0.01 skill. Used for generating unit's hire price.
SHARS_SkillHireValue = 1;
// The base multplier that will be applied to the initial hire cost to get the base wage.
SHARS_WageBaseMultiplier = 0.1; // 0.1 = 10% of the initial hire cost
// Base price for each unit
SHARS_BaseUnitCost = 180;
// Price multiplier for each tiers
SHARS_TierMultipliers = 
[
    ["Tier One", 1.0],
    ["Tier Two", 1.5],
    ["Tier Three", 2.0]
];
// Multiplier that affects squad cost
SHARS_SquadReductionMultiplier = 0.08;

SHARS_ClassToTier = 
[
    ["min_rf_soldier", "Tier One"],
    ["min_rf_soldier_LAT", "Tier One"],
    ["min_rf_soldier_lite", "Tier One"],
    ["min_rf_soldier_A", "Tier One"],
    ["min_rf_medic", "Tier One"],
    ["min_rf_soldier_GL", "Tier One"],
    ["min_rf_soldier_AR", "Tier One"],
    ["min_rf_soldier_AAR", "Tier One"],
    ["min_rf_support_AGS", "Tier One"],
    ["min_rf_engineer", "Tier One"],
    ["min_rf_soldier_exp", "Tier One"],
    ["min_rf_soldier_M", "Tier One"],
    ["min_rf_soldier_AAA", "Tier One"],
    ["min_rf_soldier_AAT", "Tier One"],
    ["min_rf_soldier_AA", "Tier One"],
    ["min_rf_soldier_AT", "Tier One"],
    ["min_rf_soldier_PG", "Tier One"],

    ["min_rf_soldier_TL", "Tier Two"],
    ["min_rf_soldier_SL", "Tier Two"],
    ["min_rf_recon_exp", "Tier Two"],
    ["min_rf_recon_JTAC", "Tier Two"],
    ["min_rf_recon_M", "Tier Two"],
    ["min_rf_recon_medic", "Tier Two"],
    ["min_rf_recon_saboteur", "Tier Two"],
    ["min_rf_recon", "Tier Two"],
    ["min_rf_recon_LAT", "Tier Two"],
    ["min_rf_sniper", "Tier Two"],
    ["min_rf_spotter", "Tier Two"],

    ["min_rf_recon_TL", "Tier Three"], 
    ["min_rf_spetsnaz", "Tier Three"],
    ["min_rf_spetsnaz_AR", "Tier Three"],
    ["min_rf_spetsnaz_GL", "Tier Three"],
    ["min_rf_spetsnaz_O", "Tier Three"],
    ["min_rf_spetsnaz_M", "Tier Three"],
    ["min_rf_spetsnaz_TL", "Tier Three"]
];
SHARS_TierOneSkill = 0.4;
SHARS_TierTwoSkill = 0.6;
SHARS_TierThreeSkill = 0.8;

SHARS_TierOneName = "Tier I";
SHARS_TierTwoName = "Tier II";
SHARS_TierThreeName = "Tier III";

// Format [DisplayName, ClassName];
SHARS_TierOneSoldiers = 
[
    ["Rifleman", "min_rf_soldier"],
    ["Rifleman AT", "min_rf_soldier_LAT"],
    ["Rifleman Light", "min_rf_soldier_lite"],
    ["Ammo Bearer", "min_rf_soldier_A"],
    ["Combat Life Saver", "min_rf_medic"],
    ["Grenadier", "min_rf_soldier_GL"],
    ["Autorifleman", "min_rf_soldier_AR"],
    ["Asst. Autorifleman", "min_rf_soldier_AAR"],
    ["Gunner AGS-30", "min_rf_support_AGS"],
    ["Engineer", "min_rf_engineer"],
    ["Explosive Specialist", "min_rf_soldier_exp"],
    ["Marksman", "min_rf_soldier_M"],
    ["Asst. Missile AA", "min_rf_soldier_AAA"],
    ["Asst. Missile AT", "min_rf_soldier_AAT"],
    ["Missile Specialist AA", "min_rf_soldier_AA"],
    ["Missile Specialist AT", "min_rf_soldier_AT"],
    ["Para Trooper", "min_rf_soldier_PG"]
];

SHARS_TierTwoSoldiers = 
[
    ["Team Leader", "min_rf_soldier_TL"],
    ["Squad Leader", "min_rf_soldier_SL"],
    ["Recon Demo Specialist", "min_rf_recon_exp"],
    ["Recon JTAC", "min_rf_recon_JTAC"],
    ["Recon Marksman", "min_rf_recon_M"],
    ["Recon Paramedic", "min_rf_recon_medic"],
    ["Recon Saboteur", "min_rf_recon_saboteur"],
    ["Recon Scout", "min_rf_recon"],
    ["Recon Scout AT", "min_rf_recon_LAT"],
    ["Sniper", "min_rf_sniper"],
    ["Spotter", "min_rf_spotter"]
];

SHARS_TierThreeSoldiers = 
[
    ["Recon Team Leader", "min_rf_recon_TL"],
    ["Spetsnaz Rifleman", "min_rf_spetsnaz"],
    ["Spetsnaz Autorifleman", "min_rf_spetsnaz_AR"],
    ["Spetsnaz Grenadier", "min_rf_spetsnaz_GL"],
    ["Spetsnaz Operator", "min_rf_spetsnaz_O"],
    ["Spetsnaz Sniper", "min_rf_spetsnaz_M"],
    ["Spetsnaz Team Leader", "min_rf_spetsnaz_TL"]
];

SHARS_Squad = 
[
    [
        "Fire Team", 
        [
            ["min_rf_soldier_TL"], 
            ["min_rf_soldier_AR"], 
            ["min_rf_soldier_GL"], 
            ["min_rf_soldier_LAT"]
        ]
    ],
    [
        "Assault Squad",
        [
            ["min_rf_soldier_SL"], 
            ["min_rf_soldier_AR"], 
            ["min_rf_soldier_AAR"], 
            ["min_rf_soldier_M"], 
            ["min_rf_soldier_LAT"], 
            ["min_rf_medic"]
        ]
    ],
    [
        "Recon Team",
        [
            ["min_rf_recon_TL"], 
            ["min_rf_recon_M"], 
            ["min_rf_recon_medic"], 
            ["min_rf_recon"]
        ]
    ],
    [
        "Recon Squad",
        [
            ["min_rf_recon_TL"], 
            ["min_rf_recon_M"], 
            ["min_rf_recon_medic"], 
            ["min_rf_recon"], 
            ["min_rf_recon_LAT"], 
            ["min_rf_recon_JTAC"], 
            ["min_rf_recon_exp"]
        ]
    ],
    [
        "Sniper Team",
        [
            ["min_rf_sniper"], 
            ["min_rf_spotter"]
        ]
    ],
    [
        "Spetsnaz Snipers",
        [
            ["min_rf_spetsnaz_M"], 
            ["min_rf_spetsnaz_O"]
        ]
    ],
    [
        "Spetsnaz Team",
        [
            ["min_rf_spetsnaz_TL"], 
            ["min_rf_spetsnaz_AR"], 
            ["min_rf_spetsnaz_GL"], 
            ["min_rf_spetsnaz"]
        ]
    ]
];

