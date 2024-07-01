/*
	Author: Psychobastard, PrinceF90 (Revisited)
	Description:
		AIS REVIVE and Respawn setup file
	Parameters:
		None
	Return:
		None
*/

//__________________________________________________________________________________________________________________________________________________________________
// v v v v v v v v v v v v  --- Main Settings --- v v v v v v v v v v v v
// Auto-Init a group of units: "allPlayers" , "allPlayables" , "allUnits", "allUnitsBLUFOR", "allUnitsOPFOR", "allUnitsINDFOR", "allUnitsCIVILIAN". Warning: It's not recomment to use "allUnits" if you play with a lot of AI units! AIS is mainly created for players and/or their AI group.
AIS_REVIVE_INIT_UNITS 		= 	"allPlayables";
// Who can revive an unconscious unit? 0 == Everybody, 1 == Everybody with a First Aid Kit or Medkit, 2 == Only Medics (this affects both, AI and players!).
AIS_MEDICAL_EDUCATION 		= 	1;
// If true you will fall in uncoscious mode everytime, regardless how strong the impact of damage was.
AIS_REVIVE_GUARANTY 		= 	false;
// Add one or more objects and a radius to activate the medevac feature. If enabled revive is only at this place(s) possible. Empty array means feature is disabled. Syntax: [ [myMedevacVehicle, 15], [myMedicTent, 10] ]	--> make sure the variable name is avalible at gamestart. Otherwise call it later in a function.
AIS_MEDEVAC_STATIONS		=	[];
// Time in seconds for player unit to respawn.
RESPAWN_Timer = 30;

//__________________________________________________________________________________________________________________________________________________________________
//	v v v v v v v v v v v v  --- Optional Settings --- v v v v v v v v v v v v 

// A higher value means more damage tolerance. 1 is Vanilla. 0.8 mean all damage will reduce to 80% of Vanilla.
AIS_DAMAGE_TOLLERANCE_FACTOR = 	1;
// Basic life time in seconds until the unit bleed out and die.. The real life time depends on the real damage of the unit. (can be less or more time from the basic value)
AIS_BLEEDOUT_TIME 			= 	300;
// Basic revive time in seconds. The real revive time depends on the real damage of the unit. (can be less or more time from the basic value)
AIS_REVIVETIME 				= 	30;
// Basic stabilize time in seconds to stop the bleeding of a unconscious unit. The real revive time depends on the real damage of the unit. (can be less or more time from the basic value)
AIS_STABILIZETIME 			= 	20;
// If set to true the injured unit get completely healed after the revive. (casual gameplay without a medic)
AIS_REVIVE_HEAL 			= 	false;
// If set to true, unconscious players cannot use his TFAR or ACRE radios.
AIS_TOGGLE_RADIO 			= 	true; 			
// If set to true, a injured player cannot use text chat during he is uncoscious.
AIS_NO_CHAT 				= 	true; 			
// Number, Radius in metres. Units in this radius will help to revive if no group member is able to revive. Max value is 200 metres.
AIS_AI_HELP_RADIUS 			= 	50; 			
// Time in seconds while the respawn button is disabled (Esc Menu). Set to 0 to enable the respawn button everytime.
AIS_DISABLE_RESPAWN_BUTTON_TIMER	=	30;
// If set to true, respawn button will be disabled. Will override AIS_DISABLE_RESPAWN_BUTTON_TIMER.			
AIS_DISABLE_RESPAWN_BUTTON	= 	true;
// If set to true, an unconcious unit wont become further damage til death. If set to false, an unconcious unit can also die before bleedout timer is over. (f.e. trough near explosions)
AIS_DISABLE_FURTHER_DAMAGE	=	false;

//__________________________________________________________________________________________________________________________________________________________________
//	v v v v v v v v v v v v  --- Visual Settings --- v v v v v v v v v v v v 

// If set to true, a marker will show injured units on the map.
AIS_SHOW_UNC_MARKERS	 	=	true;
// "None", "Side", "Group" --> who read the message about wounded units.
AIS_SHOW_UNC_MESSAGE_TO 	= 	"Side"; 		
// If set to true, an in-game visible 3D-icon shows you the position of injured units (within a range of 20 metres and 35 metres for medics).
AIS_SHOW_UNC_3D_MARKERS 	=	true; 			
// Set to true to enable impact effects. (simple simluation of supressing effects)
AIS_IMPACT_EFFECTS 			= 	true; 			
// If set to true, an unconscious unit will be able to see the bleed out timer.
AIS_SHOW_COUNTDOWN 			= 	true; 			
// If set to true, a diary entry with some informations about the AIS (Credits, features, How to) is added.
AIS_SHOW_DIARYINFO 			= 	true; 			