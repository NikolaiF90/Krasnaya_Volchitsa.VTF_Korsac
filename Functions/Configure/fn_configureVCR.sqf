/*
	Author: PrinceF90 
 
	Description: 
		Configuration for Veteran Combat Record
	
	Parameters: 
		Does not accept any parameters
	
	Returns: 
		0

	Example: 
		[] call F90_fnc_configureVCR;
*/
VCRDebug = true; // true to turn on debug
[VCRDebug, "configureVCR", "Configuring VCR system...", true] call F90_fnc_debug;



configureVCRDone = true;// do not change this
[VCRDebug, "configureVCR", "Done configuring VCR system.", true] call F90_fnc_debug;