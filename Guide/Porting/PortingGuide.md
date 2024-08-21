**Last Revision: v1.27.1a (21 Aug 2024)**
## Introduction

This is the guide to porting Krasnaya Volchitsa to your own map

## Steps

1. **Adding player unit**

   a. Firstly is to add of course your player.
   
   b. It is recommended to pick BLUFOR or OPFOR Team Leader as the unit instead of civilian unit.
   
   ![NATO Team Leader](/Guide/Images/pickSL.png)
   
   c. Change the unit's side to civilian. This is to ensure the system doesn't pick the default side as the unit side when the game started. 

   **Tips: Put one civilian unit the synchronize your unit to the civilian unit. Then delete the civilian unit.** 

   ![Player unit synced to civilian](/Guide/Images/syncToCiv.png)
   
    d. Create 1 High Command - Commander module and sync it to your unit.
   
    ![High Command Module](/Guide/Images/highCommandModule.png)  
    
2. **Adding playable units**

    a. Repeat step 1a to 1d for each of playable slots.
   
    b. Don't forget to check the playable tickbox.
   
    ![Tick Playables](/Guide/Images/tickPlayable.png)  

3. **Mission essential objects**

    a. Pick any object (desk is recommended) and give it a variable name (refers the list below).
   
    b. Create one object for each of the list below.
   
    c. Object list is as follows: 

    >i. mapX  
    ii. supportDesk 
    iii. recruitX 
    iv. rankDesk 
    v. infirmaryX 
    vi. reserveX 
    vii. repairX 
    viii. weaponDesk 
    ix. skillDesk 
    x. helipadX_0 
    xi. helipadX_1 

    d. Of course you need to choose helipad for `helipadX_0` and `helipadX_1`.
   
    ![Helipad variable name](/Guide/Images/variableHelipad.png)

4. Base

    a. Create an area marker and name it Base_0. Then resize it to cover your whole base.
   
    ![Base Marker](/Guide/Images/baseMarker.png)
   
    b. Put any objects you want, and furnish your base.
   
    ![Furnished base](/Guide/Images/baseDesign.png)

    c. You can put empty turret inside your base and the game will automatically assign a gunner for the turret as long as you put ``this setVariable ["DSC_IsBaseTurret", true, true];`` into it's init field.  


6. Scripts

    a. Copy everything from Krasnaya_Volchitsa.Altis (except for mission.sqm) and paste it to your mission folder.

7. Configurations

    a. Inside your mission folder, go to `Krasnaya_Volchitsa.Altis\Functions\Init`, you will see some configuration and init files. You don't need to edit all of those as the default configuration was configured to suit best for the game.  

> [!NOTE]
> This page only provide the basic configuration in order for the game to start properly. For the full guide on configuration files, you can have a look at [Configuration Guide](/Guide/Configuration/configurationGuide.md).  

    b. Open fn_initGlobalVariables.sqf.  

    c. Edit `Mission_StartingPosition` to your preferred location. You can get the value by right-clicking on your desired location in 3den Editor, then hover to `Log` and click `Log Position to Clipboard`.  

8. End

    a. Of course the last step is to start your game. Yes, that's all.
