params ["_caller","_towedVehicle","_towingVehicle","_towEnd"];

if ((count (ropes _towedVehicle)) > 0) exitWith {hint "The vehicle you're trying to tow is already connected to something."};
if ((count (ropes _towingVehicle)) > 0) exitWith {hint "The vehicle you're trying to tow with is already connected to something."};
if (_towedVehicle == _towingVehicle) exitWith {hint "A vehicle cannot be used to tow itself."};

_towedVehicleType = toLower (typeOf _towedVehicle);
_towingVehicleType = toLower (typeOf _towingVehicle);

// Define variables based on preset configs
_towingVehicleConfig = tow_vehicleConfigs getOrDefault [_towingVehicleType,(tow_vehicleConfigs get "default")];
_towingVehicleEffectiveTowMass = _towingVehicleConfig get "effectiveTowMass";
_towingVehicleMassLimit = _towingVehicleConfig get "limitTowMass";
_towingVehicleOffset = _towingVehicleConfig get "towHook";

// Define variables so they don't get eaten by the switch case
_towedVehicleOffset1 = [0,0,0];
_towedVehicleOffset2 = [0,0,0];

_towedVehicleConfig = tow_vehicleConfigs getOrDefault [_towedVehicleType,(tow_vehicleConfigs get "default")];

if ((getMass _towedVehicle) > _towingVehicleMassLimit) exitWith {hint "This vehicle can't tow something that heavy."};

// Choose the tow points at the right end of the towed vehicle
switch (_towEnd) do {
	case 0 : {
		_towedVehicleOffset1 = _towedVehicleConfig get "towPointFront1";
		_towedVehicleOffset2 = _towedVehicleConfig get "towPointFront2";
	};
	case 1 : {
		_towedVehicleOffset1 = _towedVehicleConfig get "towPointRear1";
		_towedVehicleOffset2 = _towedVehicleConfig get "towPointRear2";
	};
};

// Force the towed vehicle to change locality
[_towedVehicle,(owner _towingVehicle)] remoteExec ["setOwner",2];

waitUntil {(owner _towedVehicle) == (owner _towingVehicle)};

// Tie me up, tie me down
_rope1 = ropeCreate [_towingVehicle, _towingVehicleOffset, _towedVehicle, _towedVehicleOffset1, 4];
_rope2 = ropeCreate [_towingVehicle, _towingVehicleOffset, _towedVehicle, _towedVehicleOffset2, 4];
[_towedVehicle,_towingVehicle] remoteExec ["setTowParent",0,_towedVehicle];

// Wait for locality reasons
sleep 0.5;
// Make the towed vehicle a sensible weight
if ((getMass _towedVehicle) > _towingVehicleEffectiveTowMass) then {
	[_towedVehicle,_towingVehicleEffectiveTowMass] remoteExec ["setMass",_towedVehicle];
	sleep 0.1;
	[_towedVehicle,_towingVehicleEffectiveTowMass] remoteExec ["setMass",_towedVehicle];
};

// Set script memories
_towingVehicle setVariable ["tow_vehicleTowedByThis",_towedVehicle,true];
_towedVehicle setVariable ["tow_vehicleTowingThis",_towingVehicle,true];

hint format ["Tow cable attached from %1 to %2.",getText (configFile >> "CfgVehicles" >> (typeOf _towingVehicle) >> "displayName"),getText (configFile >> "CfgVehicles" >> (typeOf _towedVehicle) >> "displayName")];

// Clean up other stuff since tow was successful
_caller setVariable ["tow_hasTowCable",false,true];
_caller setVariable ["tow_prepTowingVehicle",objNull,true];