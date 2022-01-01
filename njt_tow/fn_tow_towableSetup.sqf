// Called by tow_init.sqf, or manually by [_towableVehicle] remoteExec ["njt_fnc_tow_towableSetup",0,_towableVehicle];

params ["_towableVehicle"];

if (_towableVehicle getVariable ["tow_hasTowableSetup",false]) exitWith {diag_log "Tow: tried to run towable setup on a vehicle that already has it"};

_towableVehicleType = toLower (typeOf _towableVehicle);

// Check lock overrides and configure accordingly
_lockOverride = ((tow_vehicleConfigs getOrDefault [_towableVehicleType,(tow_vehicleConfigs get "default")]) getOrDefault ["typeLockOverride",false]);
if (_lockOverride) then {
	_towableVehicle lock true;
};

if (isServer) then {
	// Save the vehicle's original mass to reference later
	_originalMass = getMass _towableVehicle;
	_towableVehicle setVariable ["tow_originalMass",_originalMass,true];
	_towableVehicle setVariable ["tow_lockOverride",_lockOverride,true];
};

// Add EH to sort everything out if there's an accident
_towableVehicle addEventHandler ["RopeBreak", {
	params ["_towedVehicle", "_rope", "_towingVehicle"];
	[_towedVehicle,_towingVehicle] spawn njt_fnc_tow_clearTow;
}];

// Servers don't need addactions
if (!isDedicated) then {
	// Action: release all tows and cables
	_towableVehicle addAction [
		"Release tow cables", // Title
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target,(_target getVariable ["tow_vehicleTowingThis",objNull])] spawn njt_fnc_tow_clearTow;
		}, // Code
		"", // Arguments
		10, // Priority
		false, // Show window
		true, // Hide on use
		"", // Shortcut
		"((_target distance _this) < 5) && !(isNull (_target getVariable [""tow_vehicleTowingThis"",objNull]))" // Condition
	];

	// Action: connect another vehicle's cable to this vehicle, to tow it
	[
		_towableVehicle, // Target
		"Attach current tow cable to this vehicle (front)", // Title
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Idle icon
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Progress icon
		"(_this getVariable [""tow_hasTowCable"",false]) && {!(_this in _target) && ((count (ropes _target)) < 1) && (isNull (_target getVariable [""tow_vehicleTowingThis"",objNull])) && ((_target distance _this) < 5) && ([_target,_this,0] call njt_fnc_tow_positionCheck) && (_target getVariable [""tow_isTowReady"",false])};", // Condition to show
		"(_this getVariable [""tow_hasTowCable"",false]) && {!(_this in _target) && ((count (ropes _target)) < 1) && (isNull (_target getVariable [""tow_vehicleTowingThis"",objNull])) && ((_target distance _this) < 5) && ([_target,_this,0] call njt_fnc_tow_positionCheck) && (_target getVariable [""tow_isTowReady"",false])};", // Condition to progress
		{}, // Code on start
		{}, // Code on tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_caller,_target,(_caller getVariable ["tow_prepTowingVehicle",objNull]),0] call njt_fnc_tow_attach;
			
		}, // Code on completed
		{}, // Code on interrupt
		[], // Arguments to pass
		5, // Duration
		1, // Priority
		false, // Remove on completion
		false, // Show when unconscious
		true // Show on screen
	] call BIS_fnc_holdActionAdd;

	// Action: connect cable (rear connection)
	[
		_towableVehicle, // Target
		"Attach current tow cable to this vehicle (rear)", // Title
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Idle icon
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Progress icon
		"(_this getVariable [""tow_hasTowCable"",false]) && {!(_this in _target) && ((count (ropes _target)) < 1) && (isNull (_target getVariable [""tow_vehicleTowingThis"",objNull])) && ((_target distance _this) < 5) && ([_target,_this,1] call njt_fnc_tow_positionCheck) && (_target getVariable [""tow_isTowReady"",false])};", // Condition to show
		"(_this getVariable [""tow_hasTowCable"",false]) && {!(_this in _target) && ((count (ropes _target)) < 1) && (isNull (_target getVariable [""tow_vehicleTowingThis"",objNull])) && ((_target distance _this) < 5) && ([_target,_this,1] call njt_fnc_tow_positionCheck) && (_target getVariable [""tow_isTowReady"",false])};", // Condition to progress
		{}, // Code on start
		{}, // Code on tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_caller,_target,(_caller getVariable ["tow_prepTowingVehicle",objNull]),1] call njt_fnc_tow_attach;
		}, // Code on completed
		{}, // Code on interrupt
		[], // Arguments to pass
		5, // Duration
		1, // Priority
		false, // Remove on completion
		false, // Show when unconscious
		true // Show on screen
	] call BIS_fnc_holdActionAdd;

	// Action: prepare vehicle for towing
	[
		_towableVehicle, // Target
		"Prepare vehicle to be towed", // Title
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Idle icon
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Progress icon
		"((count (ropes _target)) < 1) && ((_target distance _this) < 5) && !(_target getVariable [""tow_isTowReady"",false]);", // Condition to show
		"((count (ropes _target)) < 1) && ((_target distance _this) < 5) && !(_target getVariable [""tow_isTowReady"",false]);", // Condition to progress
		{}, // Code on start
		{}, // Code on tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target,true] call njt_fnc_tow_prepareForTow;
		}, // Code on completed
		{}, // Code on interrupt
		[], // Arguments to pass
		4, // Duration
		1, // Priority
		false, // Remove on completion
		false, // Show when unconscious
		false // Show on screen
	] call BIS_fnc_holdActionAdd;

	// Action: unprepare vehicle for towing
	[
		_towableVehicle, // Target
		"Restore vehicle from tow-ready state", // Title
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Idle icon
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Progress icon
		"(isNull (_target getVariable [""tow_vehicleTowingThis"",objNull])) && ((_target distance _this) < 5) && (_target getVariable [""tow_isTowReady"",false]);", // Condition to show
		"(isNull (_target getVariable [""tow_vehicleTowingThis"",objNull])) && ((_target distance _this) < 5) && (_target getVariable [""tow_isTowReady"",false]);", // Condition to progress
		{}, // Code on start
		{}, // Code on tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target,false] call njt_fnc_tow_prepareForTow;
		}, // Code on completed
		{}, // Code on interrupt
		[], // Arguments to pass
		4, // Duration
		1, // Priority
		false, // Remove on completion
		false, // Show when unconscious
		false // Show on screen
	] call BIS_fnc_holdActionAdd;
};

	// Mark this vehicle as set up
_towableVehicle setVariable ["tow_hasTowableSetup",true];
