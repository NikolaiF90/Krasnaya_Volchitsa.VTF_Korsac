/*
	Author: PrinceF90 
 
	Description: 
		Configuration for Veteran Combat Record
	
	Parameters: 
		Does not accept any parameters
	
	Returns: 
		None
*/
VCRDebug = true; // true to turn on debug
[VCRDebug, "configureVCR", "Configuring VCR system...", true] call F90_fnc_debug;

Points_ConfirmedKill = 2;
Points_CapturedPrisoners = 4;
Points_HVTKill = 6;
Points_HVTCapture = 8;
Points_AirSupport = 0;
Points_Artillery = 0;
Points_Vehicles = 0;
Points_CivilianCasualty = 0;
Points_TeamCasualty = 0;
Points_TransportDestroyed = 0;

Points_Seized = 10;
Points_HeliUsedDeduction = 5;
Points_LightArmedHeliLoss = 12;
Points_LightUnarmedHeliLoss = 10;
Points_AttackHeliLoss = 16;

Points_MissionCompleted = 50;

configureVCRDone = true;// do not change this
[VCRDebug, "configureVCR", "Done configuring VCR system.", true] call F90_fnc_debug;