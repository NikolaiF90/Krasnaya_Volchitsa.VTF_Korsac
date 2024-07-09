params ["_array", "_keywords"];

private _suitableClasses = [];
private _suitableClass = nil;

if (count _keywords == 0) then  
{
    _suitableClass = selectRandom _array;
} else 
{
    {
        private _key = _x;
        {
            private _class = _x;
            private _nameArray = _class splitString "-_, ";
            {_nameArray set [_forEachIndex, toLower _x]} forEach _nameArray;

            if (_key in _nameArray && !(_class in _suitableClasses)) then
            {
                _suitableClasses pushBack _class;
            };
        } forEach _array;
    } forEach _keywords;

    if (count _suitableClasses >= 1) then 
    {
        _suitableClass = _suitableClasses select 0;
    } else 
    {
        _suitableClass = selectRandom _array;
    };
};

_suitableClass