/*
    Author: PrinceF90
 
    Description: 
        This function generates a random name based on the selected nationality (English or Russian). 
    
    Parameter(s): 
        0: STRING - _nationality: The nationality of the generated names. Can be "English", "Russian"
    
    Returns: 
        _nameArray - An array containing the generated name, first name, and surname
*/
params ["_nationality"];

private _name = "";
private _firstName = "";
private _surname = "";

private _firstNameList = [];
private _surnameList = [];

switch (_nationality) do 
{
    case "English": 
    {
        _firstNameList = Identity_EnglishNames # 0;
        _surnameList = Identity_EnglishNames # 1;
    };
    case "Russian": 
    {
        _firstNameList = Identity_RussianNames # 0;
        _surnameList = Identity_RussianNames # 1;
    };
};

_firstName = selectRandom _firstNameList;
_surname = selectRandom _surnameList;
_name = [format ["%1 %2", _firstName, _surname], _firstName, _surname];

_name;