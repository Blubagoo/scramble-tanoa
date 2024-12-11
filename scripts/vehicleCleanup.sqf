while {true} do {
    {
        if (damage _x >= 1 && !(_x getVariable ["fireSpawned", false])) then {
            _x setVariable ["fireSpawned", true];
            _x spawn {
                sleep 12;
                if (damage _this >= 1) then {
                    private _wreck = objNull;
                    if ((typeOf _this) isKindOf "Plane") then {
                        _wreck = createVehicle ["Land_Wreck_Plane_CAS_01_F", position _this, [], 0, "NONE"];
                    } else {
                        if ((typeOf _this) isKindOf "Helicopter") then {
                            _wreck = createVehicle ["Land_Wreck_Heli_Attack_01_F", position _this, [], 0, "NONE"];
                        } else {
                            if ((typeOf _this) isKindOf "Tank") then {
                                _wreck = createVehicle ["Land_Wreck_Tank_01_F", position _this, [], 0, "NONE"];
                            } else {
                                if ((typeOf _this) isKindOf "APC") then {
                                    _wreck = createVehicle ["Land_Wreck_APC_Tracked_01_F", position _this, [], 0, "NONE"];
                                } else {
                                    _wreck = createVehicle ["Land_Wreck_Van_F", position _this, [], 0, "NONE"];
                                };
                            };
                        };
                    };
                    if (!isNull _wreck) then {
                        _wreck setPos position _this;
                        deleteVehicle _this;

                        private _fire = "test_EmptyObjectForFireBig" createVehicle position _wreck;
                        _fire setPos position _wreck;

                        sleep 120;

                        deleteVehicle _fire;

                        sleep 180;

                        deleteVehicle _wreck;
                    };
                };
            };
        };
    } forEach vehicles;
    sleep 10;
};
