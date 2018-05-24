obj1 = _this select 0;
_unit = _this select 1;
_action = _this select 2;
tentbox removeAction _action;
deleteVehicle obj1;
tentbox addAction ["<t color=""#F8FF24"">" +format["Sätt upp sjukvårdstältet."],"unpack.sqf"];
