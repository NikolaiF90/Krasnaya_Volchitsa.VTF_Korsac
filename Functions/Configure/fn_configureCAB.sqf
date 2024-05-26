/*
    Author: PrinceF90  

    Description: 
        Configuration file for Civilian And Bounty System
*/
// Turns debug on and off
CABDebug = true;
// Turns the mod on and off       
CAB_CivilianSpawningEnabled = true;

// Time interval (in seconds) to check for civilian activity
CAB_CivilianCheckInterval = 3;
// Time interval (in seconds) to checks for civilian spawning
CAB_SpawnCheckInterval = 8;
// Time until civilian starts spawning in
CAB_CivilianSpawnDelay = 5;
// Radius (in meters) to spawn civilians. Civs won't spawn outside this radius
CAB_CivilianSpawnRadius = 300;
// House count to spawn 1 civilian  
CAB_CivilianDensity = 1;
// Max spawned civs count. WARNING: This variable can override CAB_CivilianDensity if the value is lower
CAB_MaxSpawnedCivilians = 20;
// This will generate names based on nationality. Can be "English", "Russian"
CAB_CivilianNationality = "Russian";

// Time before civilian continue moving after being stopped by player
CAB_CivilianWaitingTime = 8;
// How long until the civilian gets despawned
CAB_CivilianLifetime = 60;
// Chance(in percentage) of spawned civilian being in the wanted list 
CAB_HVTChance = 60;
// Reward range for arresting or killing HVT
CAB_HVTReward = [250, 1000];
// Reward deduction (in percentage) if the HVT killed instead of captured
CAB_HVTKilledDeduction = 40;

// All houses classnames
CAB_HouseClassnames =                   
[
    // Altis & Stratis
    "Land_i_House_Small_01_V1_F",
    "Land_i_House_Small_01_V2_F",
    "Land_i_House_Small_01_V3_F",
    "Land_i_House_Small_02_V1_F",
    "Land_i_House_Small_02_V2_F",
    "Land_i_House_Small_02_V3_F",
    "Land_i_House_Small_03_V1_F",
    "Land_i_House_Big_01_V1_F",
    "Land_i_House_Big_01_V2_F",
    "Land_i_House_Big_01_V3_F",
    "Land_i_House_Big_02_V1_F",
    "Land_i_House_Big_02_V2_F",
    "Land_i_House_Big_02_V3_F",
    "Land_i_Shop_01_V1_F",
    "Land_i_Shop_01_V2_F",
    "Land_i_Shop_01_V3_F",
    "Land_i_Shop_02_V1_F",
    "Land_i_Shop_02_V2_F",
    "Land_i_Shop_02_V3_F",
    "Land_i_Addon_01_V1_F",
    "Land_i_Addon_01_V2_F",
    "Land_i_Addon_01_V3_F",
    "Land_i_Addon_02_V1_F",
    "Land_i_Addon_02_V2_F",
    "Land_i_Addon_02_V3_F",
    "Land_i_Addon_03_V1_F",
    "Land_i_Addon_03_V2_F",
    "Land_i_Addon_03_V3_F",

    // Tanoa
    "Land_house_small_01_F", 
    "Land_house_small_02_F",
    "Land_house_small_03_F",
    "Land_house_small_04_F",
    "Land_house_small_05_F",
    "Land_house_small_06_F",
    "Land_house_big_01_F",
    "Land_house_big_02_F",
    "Land_house_big_03_F",
    "Land_house_big_04_F",
    "Land_house_big_05_F",
    "Land_slum_01_F",
    "Land_slum_02_F",
    "Land_slum_03_F",
    "Land_slum_04_F",
    "Land_slum_05_F",
    "Land_slum_house_01_F",
    "Land_slum_house_02_F",
    "Land_slum_house_03_F",
    "Land_slum_house_04_F",
    "Land_slum_house_05_F",
    "Land_house_native_01_F",
    "Land_house_native_02_F",
    "Land_hotel_01_F",
    "Land_hotel_02_F",
    "Land_shop_city_01_F",
    "Land_shop_city_02_F",
    "Land_shop_city_03_F",
    "Land_shop_city_04_F",
    "Land_shop_city_05_F",
    "Land_shop_city_06_F",
    "Land_shop_city_07_F",
    "Land_shop_town_01_F",
    "Land_shop_town_02_F",
    "Land_shop_town_03_F",
    "Land_shop_town_04_F",
    "Land_shop_town_05_F",
    "Land_Warehouse_01_F",
    "Land_Warehouse_02_F",
    "Land_Warehouse_03_F",
    "Land_Temple_Native_01_F",
    "Land_Temple_Native_02_F",
    "Land_GarageShelter_01_F",
    "Land_School_01_F",
    "Land_FuelStation_02_workshop_F",
    "Land_FuelStation_01_shop_F",
    "Land_Multistoreybuilding_01_F",
    "Land_Multistoreybuilding_03_F",
    "Land_Multistoreybuilding_04_F",

    // Malden
    "Land_i_House_Small_01_b_blue_F",
    "Land_i_House_Small_01_b_pink_F",
    "Land_i_House_Small_01_b_yellow_F",
    "Land_i_House_Small_01_b_brown_F",
    "Land_i_House_Small_01_b_white_F",
    "Land_i_House_Small_01_b_whiteblue_F",
    "Land_i_House_Small_02_b_blue_F",
    "Land_i_House_Small_02_b_pink_F",
    "Land_i_House_Small_02_b_yellow_F",
    "Land_i_House_Small_02_b_brown_F",
    "Land_i_House_Small_02_b_white_F",
    "Land_i_House_Small_02_b_whiteblue_F",
    "Land_i_House_Small_02_c_blue_F",
    "Land_i_House_Small_02_c_pink_F",
    "Land_i_House_Small_02_c_yellow_F",
    "Land_i_House_Small_02_c_brown_F",
    "Land_i_House_Small_02_c_white_F",
    "Land_i_House_Small_02_c_whiteblue_F",
    "Land_i_House_Big_01_b_blue_F",
    "Land_i_House_Big_01_b_pink_F",
    "Land_i_House_Big_01_b_yellow_F",
    "Land_i_House_Big_01_b_brown_F",
    "Land_i_House_Big_01_b_white_F",
    "Land_i_House_Big_01_b_whiteblue_F",
    "Land_i_House_Big_02_b_blue_F",
    "Land_i_House_Big_02_b_pink_F",
    "Land_i_House_Big_02_b_yellow_F",
    "Land_i_House_Big_02_b_brown_F",
    "Land_i_House_Big_02_b_white_F",
    "Land_i_House_Big_02_b_whiteblue_F",
    "Land_i_Shop_01_b_blue_F",
    "Land_i_Shop_01_b_pink_F",
    "Land_i_Shop_01_b_yellow_F",
    "Land_i_Shop_01_b_brown_F",
    "Land_i_Shop_01_b_white_F",
    "Land_i_Shop_01_b_whiteblue_F",
    "Land_i_Shop_02_b_blue_F",
    "Land_i_Shop_02_b_pink_F",
    "Land_i_Shop_02_b_yellow_F",
    "Land_i_Shop_02_b_brown_F",
    "Land_i_Shop_02_b_white_F",
    "Land_i_Shop_02_b_whiteblue_F",

    // Livonia
    "Land_House_1B01_F",
    "Land_House_1W01_F",
    "Land_House_1W02_F",
    "Land_House_1W03_F",
    "Land_House_1W04_F",
    "Land_House_1W05_F",
    "Land_House_1W06_F",
    "Land_House_1W07_F",
    "Land_House_1W08_F",
    "Land_House_1W09_F",
    "Land_House_1W10_F",
    "Land_House_1W11_F",
    "Land_House_1W12_F",
    "Land_House_2B01_F",
    "Land_House_2B02_F",
    "Land_House_2B03_F",
    "Land_House_2B04_F",
    "Land_House_2W01_F",
    "Land_House_2W02_F",
    "Land_House_2W03_F",
    "Land_House_2W04_F",
    "Land_House_2W05_F",
    "Land_workshop_01_f",
    "Land_workshop_02_f",
    "Land_workshop_03_f",
    "Land_barn_01_f",
    "Land_barn_02_f",
    "Land_barn_03_f",	
    "Land_barn_01_large_f",
    "Land_barn_02_large_f",
    "Land_barn_03_large_f",
    "Land_Camp_House_01_brown_F",
    "Land_VillageStore_01_f",
    "Land_policestation_01_f",
    "Land_caravan_01_rust_f",
    "Land_Caravan_01_green_F",
    "Land_Rail_Warehouse_Small_F",
    "Land_Rail_Station_Big_F",
    "Land_FuelStation_03_shop_F",
    "Land_BusStop_02_shelter_F",
    "Land_VillageStore_01_F",
    "Land_Greenhouse_01_F",
    "Land_HealthCenter_01_F",
    "Land_Shed_11_F",
    "Land_Shed_13_F",
    "Land_Shed_12_F",
    "Land_PoliceStation_01_F",

    // Korsac
    "Land_VTF_Building_1",
    "Land_VTF_Building_1_Brick",
    "Land_VTF_Building_2",
    "Land_VTF_Building_2_Brick",

    "land_housev_1l1",
    "land_housev_1l2",
    "land_housev_1t",
    "land_housev_2i",
    "land_housev_2l",
    "land_housev_2t1",
    "land_housev_2t2",
    "land_housev_3i1",
    "land_housev_3i2",
    "land_housev_3i3",
    "land_housev_3i4",
    "land_housev_01a",
    "land_housev_01b",
    "Land_ds_houseV_1L2",
    "Land_ds_houseV_1t",
    "Land_ds_houseV_2l",
    "Land_ds_houseV_2L",
    "Land_ds_houseV_2T1",
    "Land_ds_houseV_2T2",
    "Land_ds_houseV_3l1",
    "Land_ds_houseV_3l2",
    "Land_ds_houseV_3l3",
    "Land_ds_houseV_3l4",

    "Land_vtf_airport"
];