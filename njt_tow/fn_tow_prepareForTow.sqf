params ["_towedVehicle","_state"];

// If we're making it tow-ready, eject the crew and lock it
if (_state) then {
	{
		moveOut _x;
	} forEach (crew _towedVehicle);
	[_towedVehicle,false] remoteExec ["engineOn",_towedVehicle];
	[_towedVehicle,true] remoteExec ["lock"];
	_towedVehicle setVariable ["njt_tow_isTowReady",true,true];
	hint format ["%1 is locked and ready to tow.",getText (configFile >> "CfgVehicles" >> (typeOf _towedVehicle) >> "displayName")];
} else {
	
	// If we're restoring it after a tow, check whether it should be unlocked...
	if (_towedVehicle getVariable ["njt_tow_lockOverride",false]) then {
		// ...if not, don't unlock it
		hint format ["%1 is no longer tow-ready.",getText (configFile >> "CfgVehicles" >> (typeOf _towedVehicle) >> "displayName")];
	} else {
		// ...if yes, unlock it
		[_towedVehicle,false] remoteExec ["lock"];
		hint format ["%1 is unlocked and ready to use.",getText (configFile >> "CfgVehicles" >> (typeOf _towedVehicle) >> "displayName")];
	};
	// Reset readiness indicator
	_towedVehicle setVariable ["njt_tow_isTowReady",false,true];
};