waitUntil { !isNull A_10_Vehicle };

private _pylons = [
    "PylonRack_1Rnd_AAA_missiles",
    "PylonRack_19Rnd_PG_missiles_gray_RF",
    "PylonRack_3Rnd_Missile_AGM_02_F",
    "FIR_GBU38_P_3rnd_M",
    "PylonRack_24Rnd_ACE_DAGR",
    "PylonRack_24Rnd_ACE_DAGR",
    "FIR_GBU38_P_3rnd_M",
    "PylonRack_3Rnd_Missile_AGM_02_F",
    "PylonRack_1Rnd_AAA_missiles",
    "PylonRack_1Rnd_AAA_missiles"
];

{
    A_10_Vehicle setPylonLoadout [_forEachIndex, _x, true];
} forEach _pylons;
highlightUnits = {
    params ["_centerPos", "_radius"];
    {
        private _unit = _x;
        private _unitSide = side _unit;
        private _unitPos = getPos _unit;
        private _unitMarkerName = format ["unitMarker_%1", _unit];
        private _isOperational = alive _unit;

        if ((_unitSide in [west, east]) && (_unit distance _centerPos <= _radius) && _isOperational) then {
            private _markerColor = switch (_unitSide) do {
                case west: { "ColorBlue" };
                case east: { "ColorRed" };
                default { "ColorWhite" };
            };
            if (isNil {missionNamespace getVariable _unitMarkerName}) then {
                private _marker = createMarker [_unitMarkerName, _unitPos];
                _marker setMarkerType "mil_dot";
                _marker setMarkerColor _markerColor;
                missionNamespace setVariable [_unitMarkerName, _marker];
            } else {
                private _marker = missionNamespace getVariable _unitMarkerName;
                _marker setMarkerPos _unitPos;
                _marker setMarkerColor _markerColor;
            };
        };
    } forEach allUnits;
};
deselectDeadUnits = {
    {
        private _unit = _x;
        private _unitMarkerName = format ["unitMarker_%1", _unit];
        if (!alive _unit) then {
            if (!isNil {missionNamespace getVariable _unitMarkerName}) then {
                deleteMarker _unitMarkerName;
                missionNamespace setVariable [_unitMarkerName, nil];
            };
        };
    } forEach allUnits;
};


[] spawn {
    while {true} do {
        private _centerPos = getPos player;
        [_centerPos, 3000] call highlightUnits;
        call deselectDeadUnits;
        sleep 5;
    };
};




waitUntil { !isNil "F22_Raptor" && {alive F22_Raptor} };


waitUntil { !isNil "F22_Raptor" && {alive F22_Raptor} };

private _pylonLoadouts = [
    "FIR_AIM9M_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_GBU38_P_1rnd_M",
    "FIR_GBU38_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM9M_P_1rnd_M",
    "FIR_AIM120_P_F22_Type2_2rnd_M",
    "FIR_AIM120_P_EWP_2rnd_M",
    "FIR_AIM120_P_EWP_2rnd_M",
    "FIR_AIM120_P_F22_Type2_2rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M",
    "FIR_AIM120_P_1rnd_M"
];

{
    F22_Raptor setPylonLoadout [_forEachIndex + 1, _x, true];
} forEach _pylonLoadouts;


