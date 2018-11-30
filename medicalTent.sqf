ase_medicalTentActionPack = "<t color='#F8FF24'>Packa ner tältet</a>";
ase_medicalTentActionUnpack = "<t color='#F8FF24'>Sätt upp sjukvårdstältet</a>";
ase_medicalTentDefaultObject = "Land_MedicalTent_01_MTP_closed_F";

ase_fnc_MedicalTentAddAction = {
	params ["_target", "_title", "_script", ["_arguments", [], []]];

	_target addAction [_title, _script, _arguments, 1, false, true, "", "alive _target", 5];
};

ase_fnc_medicalTentPack = {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_arguments params ["_box", "_cutter"];

	// Remove built camp
	_target removeAction _actionId;
	deleteVehicle _target;
	deleteVehicle _cutter;

	// Re-add tent to box
	[_box, ase_medicalTentActionUnpack, ase_fnc_medicalTentUnpack] call ase_fnc_MedicalTentAddAction;
};

ase_fnc_medicalTentUnpack = {
	params ["_target", "_caller", "_actionId", "_arguments"];

	// Remove unpack action from box
	_target removeAction _actionId;

	// Get object to unpack
	_objectClassName = _target getVariable ["ase_medicalTentObject", ase_medicalTentDefaultObject];

	// Get direction of box
	private _dir = direction _target;

	// Get box location
	private _pos =  _target modelToWorld [0,0,0];

	// Create ground clutter cutter to remove grass etc
	private _cutter = createVehicle [ "Land_ClutterCutter_Medium_F", _pos, [], 0, "NONE" ];

	// Create camp
	private _obj = _objectClassName createVehicle [0,0,0];
	_obj setVariable ["ace_medical_isMedicalFacility", true];
	_obj setDir (_dir - 180);
	_obj attachTo [_cutter, [0,0,0.5]];
	_obj animateSource ["Door_Hide", 1, true];
	_obj animateSource ["SolarPanel2_Hide", 1, true];
	_obj animateSource ["SolarPanel1_Hide", 1, true];

	// Add pack action to camp
	[_obj, ase_medicalTentActionPack, ase_fnc_medicalTentPack, [_target, _cutter]] call ase_fnc_MedicalTentAddAction;
};

ase_fnc_medicalTentInit = {
	params ["_box", ["_objectClassName", ase_medicalTentDefaultObject, [""]]];

	_box setVariable ["ase_medicalTentObject", _objectClassName];

	// Create initial unpack action
	[_box, ase_medicalTentActionUnpack, ase_fnc_medicalTentUnpack] call ase_fnc_MedicalTentAddAction;
};
