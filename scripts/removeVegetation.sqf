private _radius = 20;

private _removeVegetation = {
    params ["_obj", "_radius"];
    private _nearbyVegetation = nearestTerrainObjects [_obj, ["TREE", "SMALL TREE", "BUSH"], _radius];
    {
        deleteVehicle _x;
    } forEach _nearbyVegetation;
};

{
    [_x, _radius] call _removeVegetation;
} forEach allMissionObjects "All";
private _radius = 20;

private _removeVegetation = {
    params ["_obj", "_radius"];
    private _nearbyVegetation = nearestTerrainObjects [_obj, ["TREE", "SMALL TREE", "BUSH"], _radius];
    {
        deleteVehicle _x;
    } forEach _nearbyVegetation;
};

{
    [_x, _radius] call _removeVegetation;
} forEach allMissionObjects "All";
