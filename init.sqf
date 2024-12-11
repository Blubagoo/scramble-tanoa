"Apply to all units currently present";
{
    _x enableStamina false;
} forEach allUnits;

"Apply to units that spawn later";
addMissionEventHandler ["EntityCreated", {
    params ["_entity"];
    if (_entity isKindOf "Man") then {
        _entity enableStamina false;
    };
}];

[] execVM "scripts\vehicleCleanup.sqf";
[] execVM "scripts\highlightUnits.sqf";
[] execVM "scripts\removeDeadUnits.sqf";