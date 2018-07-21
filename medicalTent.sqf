ase_medicalTentActionPack = "<t color='#F8FF24'>Packa ner tältet</a>";
ase_medicalTentActionUnpack = "<t color='#F8FF24'>Sätt upp sjukvårdstältet</a>";
ase_medicalTentObject = "CampEmpty";

ase_fnc_medicalTentPack = {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_arguments params ["_box", "_cutter"];

	// Remove built camp
	_target removeAction _actionId;
	deleteVehicle _target;
	deleteVehicle _cutter;

	// Re-add tent to box
	_box addAction [ase_medicalTentActionUnpack, ase_fnc_medicalTentUnpack,[],1,false,false,"","_this distance _target < 3"];
};

ase_fnc_medicalTentUnpack = {
	params ["_target", "_caller", "_actionId", "_arguments"];

	// Remove unpack action from box
	_target removeAction _actionId;

	// Get direction of box
	private _dir = direction _target;

	// Get box location
	private _pos =  _target modelToWorld [0,0,0];

	// Create ground clutter cutter to remove grass etc
	private _cutter = createVehicle [ "Land_ClutterCutter_Medium_F", _pos, [], 0, "NONE" ];

	// Create camp
	private _obj = ase_medicalTentObject createVehicle [0,0,0];
	_obj setVariable ["ace_medical_isMedicalFacility", true];
	_obj setDir (_dir - 180);
	_obj attachTo [_cutter, [0,0,0.5]];

	// Add pack action to camp
	_obj addAction [ase_medicalTentActionPack, ase_fnc_medicalTentPack, [_target, _cutter],1,false,false,"","_this distance _target < 3"];
};

ase_fnc_medicalTentInit = {
	params ["_box"];

	// Create initial unpack action
	_box addAction [ase_medicalTentActionUnpack, ase_fnc_medicalTentUnpack,[],1,false,false,"","_this distance _target < 3"];
};