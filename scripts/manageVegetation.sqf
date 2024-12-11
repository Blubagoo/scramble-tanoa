private _radius = 20;
private _checkInterval = 1;

private _manageObject = {
    params ["_obj", "_props", "_radius"];
    while {true} do {
        private _inRange = false;
        {
            if ((_obj distance _x) <= _radius) exitWith {
                _inRange = true;
            };
        } forEach _props;
        if (!_inRange) then {
            _obj hideObject false;
            break;
        };
        sleep _checkInterval;
    };
};

while {true} do {
    private _props = allMissionObjects "All";
    {
        private _nearbyObjects = nearestTerrainObjects [_x, ["TREE", "SMALL TREE", "BUSH"], _radius];
        {
            if (!isObjectHidden _x) then {
                _x hideObject true;
                [_x, _props, _radius] spawn _manageObject;
            };
        } forEach _nearbyObjects;
    } forEach _props;
    sleep _checkInterval;
};