params ["_target","_caller","_towEnd"];

private _prepTowingVehicle = _caller getVariable ["njt_tow_prepTowingVehicle",objNull];
private _isInPosition = true;

// Check how apart the vehicles are
if ((_prepTowingVehicle distance _target) > 15) exitWith {false};

// Check whether the vehicles are aligned properly depending on which end to use
switch (_towEnd) do {
	case 0 : {
		if (((_target getRelDir _prepTowingVehicle) > 45) && ((_target getRelDir _prepTowingVehicle) < 315)) then {
			_isInPosition = false;
		};
	};
	case 1 : {
		if (((_target getRelDir _prepTowingVehicle) > 225) or ((_target getRelDir _prepTowingVehicle) < 135)) then {
			_isInPosition = false;
		};
	};
};

// Make sure the towing vehicle has the right end facing the towed vehicle
if (((_prepTowingVehicle getRelDir _target) > 225) or ((_prepTowingVehicle getRelDir _target) < 135)) then {
			_isInPosition = false;
};

// All this being acceptable, pass true. Amen.
_isInPosition