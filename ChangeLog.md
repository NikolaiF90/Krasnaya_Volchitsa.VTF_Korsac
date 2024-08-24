# Krasnaya Volchitsa

## Known Issues
* Error with _dropOff key after changing transport helicopter.
* Vehicle spawned too close to repairX.

## ToDO
* More tasks
* More perks
* Skill Tree - More Skills
* Mission guide
* Open Guide
* FOB
* Improve Patrol Script
* Insert custom vehicles
* Land transport support

## Version History

### Version 1.27.3a
* Increased AO marker size.
* Fixed an issue where multiplayer clients unable to join the game.
* Fixed some bugs related to persistent system. 
* Fixed some task related bugs. 
* Minor optimization.

### Version 1.27.2a
* Optimized officer spawning process.
* Optimized faction obtaining process.
* Fixed helicopters unavailable for some factions.
* Fixed trucks unavailable for some factions.

### Version 1.27.1a
* Fixed player can't report mission after completing mission.
* Fixed an issue where "Request Drop-Off" action not appearing on the second transport heli.

### Version 1.27.0a
* Players now should purchase their own equipments and weapons from Logistic Officer.
* Price for every equipment will be dynamically changed based on supplies.
* Weapons will appear on shop based on their rarity. 
* Added the ability for players to interrogate prisoners, to gain intels. 
* Added SharpEye to skill tree. Unlocking SharpEye will make players automatically mark dead units.
* Added IFoundCash to skill tree. Unlocking this skill will increase player's reward when completing task.
* Optimized Task System. The system seems like demanding too much memory.
* Optimized script initialization process. This ensure less data leaks and possible issues.
* Minor bugfix.

### Version 1.26.1a
* Fixed OP not being recorded into player's statistic. 

### Version 1.26.0a
* Enhanced the base's infirmary functionality to allow players to fully heal themselves.
* High priority locations within the base are now marked on the player's map.
* Reworked Support task.
* Factions without vehicles will now receive vehicles from the FIA faction.
* Introduced Support Officer. The officer will handle things such as providing temporary support units, and changing transport helicopters.
* Added the ability to request a temporary team to assist the player during missions. Points will now be deducted accordingly upon mission completion, and the team is available on a temporary basis for each mission.
* Resolved an issue where pressing 'T' would respawn the player even when not in a bleeding state.
* Corrected the absence of markers for transport pickup locations.
* Addressed persistent data loading issues causing unit disappearance or duplication.
* Ensured proper display of notifications for civilian ID requests, confirming kills, and arresting HVTs.
* Fixed initialization problem with the 'op' function.
* Updated dropped intel to reflect changes in the wanted list.
* Resolved excessive ambush occurrences during Patrol Tasks.
* Fixed all issues related to High-Value Targets (HVTs).
* Major optimizations.

### Version 1.25.0a
* Added support vehicles. Players can now spawn vehicles for use in missions or routine tasks.
* Points will be affected by every spawned vehicle upon completing a mission.
* Player can request support from Support Menu which accessible through Tactical Tab.
* Added transportation support. Player can request pickup, drop off and return to base (RTB) services.

### Version 1.24.0a
* Updated the looks of duty report menu.
* Player can now unlock and upgrade their skills, thanks to the newly introduced game mechanic, Skill Tree.
* Optimizations and bugfixes on tasks and VCR scripts.
* Major bugfixes and optimizations.

### Version 1.23.0a
* Added Perks and Ranking System (PRS).
* All players now possess ranks (distinct from ARMA 3 base ranks). 
* Capability to request a rank promotion.
* Numerous perks available for unlocking, with each rank granting access to different perks.
* Enhanced existing game mechanics to incorporate PRS.
* Redesigned the appearance of the Hire Menu, Tactical Tab, and the splash screen.
* Adjusted player initialization process by optimizing certain codes to prevent data leaks and errors.
* Updated the Persistent Menu with a new look, optimized codes, and bug fixes. 
* Players can now assign names to their saves.  
* Made minor adjustments to the Allied Base.
* Major optimization and bugfixes.

### Version 1.22.0a
* Introduced a server setup menu for server hosts, allowing them to adjust server settings before initiating the server. 
* Implemented the Dynamic Side Change System, enabling server hosts to switch teams and sides. 
* Hosts can now set the starting time on the server setup screen. 
* Restructured SHARS to incorporate DSCS, with recruit-able units based on player factions.
* Spawned units and player initial loadouts are now determined by selected factions.
* The Persistent Tab is now accessible through the Tactical Tab. 
* Added the ability for server host to perform a time skip.
* Automated unit spawning for base defense, eliminating the need for manual placement by mission designers. 
* Killed enemy units will now drop intels. For now, only intels related to HVT will be dropped.
* Access to the Tactical Tab is now available by pressing the Y key instead of the action menu.
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
