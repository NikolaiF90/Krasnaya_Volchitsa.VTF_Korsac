/*
    Author: PrinceF90

    Description:
        Retrieve the recoil value for a specified weapon.

    Parameter(s):
        _recoil - The recoil parameter for the weapon. [STRING]

    Returns:
        _recoilValue - The numerical value of the recoil for the specified weapon.
*/
params ["_recoil"];

private _config = configFile >> "CfgRecoils" >> _recoil;
private _recoilValue = getNumber (_config >> "temporary");
_recoilValue