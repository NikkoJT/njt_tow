params ["_towedVehicle","_towingVehicle"];

// Disconnect cables from both vehicles
{
	_towedVehicle ropeDetach _x;
	_towingVehicle ropeDetach _x;
} forEach (ropes _towingVehicle);

// Reset mass
[_towedVehicle,(_towedVehicle getVariable ["njt_tow_originalMass",getMass _towedVehicle])] remoteExec ["setMass"];
// Clear tow parent (probably)
[_towedVehicle,objNull] remoteExec ["setTowParent",0,_towedVehicle];
// Clear script memories
_towedVehicle setVariable ["njt_tow_vehicleTowingThis",objNull,true];
_towingVehicle setVariable ["njt_tow_vehicleTowedByThis",objNull,true];
_towedVehicle setVariable ["njt_tow_towEnd",nil];
// Wait a little for effect then get rid of the ropes
sleep 3;
{
	ropeDestroy _x;
} forEach (ropes _towingVehicle);