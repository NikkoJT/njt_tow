// Called by tow_init.sqf, or manually by [_canTowVehicle] remoteExec ["njt_fnc_tow_canTowSetup",0,_towableVehicle];
params ["_canTowVehicle"];

if (_canTowVehicle getVariable ["tow_hasCanTowSetup",false]) exitWith {diag_log "Tow: tried to run towing setup on a vehicle that already has it"};

// Add EH to sort everything out if there's an accident
_canTowVehicle addEventHandler ["RopeBreak", {
	params ["_towingVehicle", "_rope", "_towedVehicle"];
	[_towedVehicle,_towingVehicle] spawn njt_fnc_tow_clearTow;
}];

// Servers don't need addactions
if (!isDedicated) then {
	// Action: The cable...I'm going to cut it.
	_towReleaseActionID = _canTowVehicle addAction [
		"Release tow cables", // Title
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[(_target getVariable ["tow_vehicleTowedByThis",objNull]),_target] spawn njt_fnc_tow_clearTow;
		}, // Code
		"", // Arguments
		10, // Priority
		false, // Show window
		true, // Hide on use
		"", // Shortcut
		"((_target distance _this) < 5) && ((count ropes _target) > 0)" // Condition
	];

	// Action: Get a cable from this vehicle to tow another
	_towPrepareActionID = [
		_canTowVehicle, // Target
		"Prepare to tow another vehicle", // Title
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Idle icon
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", // Progress icon
		"!(_this getVariable [""tow_hasTowCable"",false]) && {!(_this in _target) && ((count (ropes _target)) < 1) && ((_target distance _this) < 5) && !(_target getVariable [""tow_isTowReady"",false])};", // Condition to show
		"!(_this getVariable [""tow_hasTowCable"",false]) && {!(_this in _target) && ((count (ropes _target)) < 1) && ((_target distance _this) < 5) && !(_target getVariable [""tow_isTowReady"",false])};", // Condition to progress
		{}, // Code on start
		{}, // Code on tick
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
			_caller setVariable ["tow_hasTowCable",true,true];
			_caller setVariable ["tow_prepTowingVehicle",_target,true];
			hint format ["You are now carrying a cable attached to a %1.",getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayNameShort")];
		}, // Code on completed
		{}, // Code on interrupt
		[], // Arguments to pass
		3, // Duration
		1, // Priority
		false, // Remove on completion
		false, // Show when unconscious
		true // Show on screen
	] call BIS_fnc_holdActionAdd;
};

__canTowVehicle addEventHandler ["Killed",{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit,1] remoteExec ["njt_tow_fnc_removeActions",0];
}];

	// Mark this vehicle as set up
_canTowVehicle setVariable ["tow_hasCanTowSetup",true];