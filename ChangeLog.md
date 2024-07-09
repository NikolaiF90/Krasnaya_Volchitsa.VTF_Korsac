# Krasnaya Volchitsa

## Known Issues
    None currently
## ToDO
    * More tasks
    * Skill Tree
    * Ranking system
    * Mission guide
    * FOB
    * Improve Patrol Script

## Version History

### Version 1.22.0a
    * Show server setup menu to server host. This adds the ability for the server host to make a few changes to the server setting before starting the server.
    * Dynamic Side Change System. Ability for server host to change teams and sides. 
    * Starting time can be set by the host at server setup screen.
    * Reworked SHARS to integrate DSCS. Units available for recruit will be based on player faction.
    * Spawned units will be based on player factions. Player initial loadout will also be based on selected faction.
    * Persistent Tab will now accessible through Tactical Tab.
    * Added the ability for server host to perform a time skip.
    * Mission designers no longer need to manually place units to defend base as the mission will automatically spawns units based on base markers and turrets placed inside base.
    * Killed enemy units will now drop intels. For now, only intels related to HVT will be dropped.
    * Tactical Tab is now accessible by pressing Y key instead of action menu.
    * Major optimizations and code improvements.

### Version 1.21.0a
    * Updated the looks of Tactical Tab.
    * All recent notification including debug messages will now appear on Tactical Tab.
    * Updated some codes and functions to better integrate Tactical Notification.
    * Unique ID for each joined players.
    * All task will provide grid position.
    * Player can now transfer milcash to another player.
    * Added infirmary. 
    * Arma 3 respawn system and AIS respawn system has been replaced with Krasnaya Volchitsa Spawn System which integrate with the mission better.
    * Player will turn into crow while waiting respawn countdown.

### Version 1.20.0a
    * Task Update.
    * Mission designers no longer need to specify hideout locations using hideout markers. The mission will automatically do the job.
    * Adjusted when to spawn enemy QRF groups.
    * Instead of spawning inside task location, enemy QRF groups now spawns between 200m-300m from task location.
    * Enemy QRF groups now moves to the task location more faster. 
    * Remaining patrol time will now be shown to all players.
    * Assets may appear in some mission and player will be rewarded for seizing assets.
    * Removed debug messages when starting mission.
    * Major bugfixes and optimization.

### Version 1.19.0a
    * Hire System overhaul. Renamed to SHARS (Subordinate Hiring And Reserve System).
    * Reserve system where players can reserve subordinates instead of dimissing them completely and players can call them back to combat whenever needed.
    * Disband your high command subordinate.
    * Train individual skills on individual units.
    * Reserve pools persistent across saves.
    * Create your own high command squads.
    * Rename squads under your command.
    * Wage system where every units in your group demands players to pay for their wage for every mission.
    * Total wages to be paid will be shown in report menu.
    * Major bugfixes and optimizations.

### Version 1.18.0a
    * New notification system.
    * Added splash screen.
    * Furnished allied base.
    * Recruit units individually or squads. 
    * Controls hired squads through High Command.
    * Dismiss hired squads or units.
    * Porting mission no longer require creator to manually add patrol markers. The mission will do the job.
    * Fixed an error on text being displayed on tactical tab when no HVT available.
    * Fixed a bug persistent action and Open Tactical Tab action missing after player injured or upon switching unit.
    * Minor optimization.

### Version 1.17.0a
    * Multiplayer update.
    * Task system is fully updated and optimized for multiplayer environment.
    * Optimized civilian and bounty system to better fit multiplayer.
    * Changed how the code initialization works.
    * Minor tweak to the Persistent system.
    * VETCOMREC will also works perfectly with multiplayer environment.
    * Major optimizations and bugfixes.

### Version 1.16.0a
    * Enemy surrendering after being revived.
    * Arrest every enemy. But they should drop their weapons first.
    * Captured enemy now grant players points after completing mission. HVT grants more points.
    * Dead HVT can now be identified by any players no matter who pulls the trigger.
    * Major optimization and bugfixes.

### Version 1.15.0a
    * Ambush mission is fully playable.
    * Major optimization and bugfixes.

### Version 1.14.0a
    * Identity. Civilian identity overhaul.
    * Minor optimization and bugfix.

### Version 1.13.0a
    * Civilian Presence major overhaul.
    * Civilian will now react to surrounding. 
    * Tactical Tab updated. Wanted list will be shown on tactical tab.
    * Rewards for capturing HVT will be shown on Tactical Tab.
    * Arrest civilian.
    * Player will be rewarded for every arrested/killed HVT.
    * Player will get less reward for killing HVT.
    * Optimization and bugfix.

### Version 1.12.0a
    * Civilian presence. Now the map will be populated with civilians.
    * Bounty and HVT. There is a chance that one of civilians is on the wanted list. Be sure to check each one of them. 
    * Minor optimization.

### Version 1.11.0a
    * Added total conducted and successful missions into VETCOMREC.
    * Updated the looks of Tactical Menu.
    * Minor optimization and bugfixes.

### Version 1.10.0a
    * Points system. Points will be given for each kills, and will be deducted for each casualties and asset used. 
    * Added artillery support used in the duty report.
    * Now with less luck, enemy might ambush players while on patrol. So watch out.

### Version 1.9.0a
    * Added duty report menu. The menu will be shown to player after every end of duty.
    * Added new records into VETCOMREC like killed hvt, casualties, and total used assets.

### Version 1.8.0a
    * Added ambush, support, and kill hvt mission.
    * Report to officer after completing mission.
    * Reward for completing mission.
    * Major optimization.
    * Bug fixes.

### Version 1.7.2a
    * Tactical menu now include information about any active task.
    * Minor code changes.

### Version 1.7.1a
    * Code optimization. 
    * Notification after patrol completed.

### Version 1.7.0a
    * New task: Patrol town. 

### Version 1.6.0a
    * Added task system.
    * Play as another units. But VETCOMREC only available for mission host.
    * Reworked persistence system to better integrate for the task system. 

### Version 1.5.0a
    * Added confirmed kills count to VETCOMREC.
    * Approach killed unit to confirm kills.
    * Updated persistence system to better adapt to new features. 
    * Updated Tactical Tab interfaces.
    * Minor optimization.

### Version 1.4.0a
    * Added a new revive system - Alternative Injury System by Psychobastard. 

### Version 1.3.0a
    * Added Tactical Tab. This is where player can access their Milcash(in-game currency).

### Version 1.2.0a
    * Added Economy System
    * Added VETCOMREC - Veteran Combat Record System
    * Updated persistence system to better adapt to the new economy system and VETCOMREC

### Version 1.1.0a
    * Added ARMAPERSCORE as the persistence system

### Version 1.0.0a
    * Initial release
