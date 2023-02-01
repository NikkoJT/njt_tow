// NikkoJT's Terrible Towing System: initial setup
// init.sqf
// [] execVM "njt_tow\tow_init.sqf"
// Specify classes of vehicles to run on, and their tow configuration, in njt_tow\tow_vehicleConfigs.sqf
// Make sure functions are defined in description.ext: class njt > class tow > file = "njt_tow"

// Set up configs
#include "tow_vehicleConfigs.sqf"

// Do setup on vehicles that can be towed
{	
	[_x] call njt_fnc_tow_towableSetup;
} forEach towableVehicles;

// Do setup on vehicles that can tow
{
	[_x] call njt_fnc_tow_canTowSetup;
} forEach canTowVehicles;

// Setup an action on players to drop their current cable
if (!isDedicated) then {
	player addAction [
		"Drop current tow cable", // Title
		{
			player setVariable ["tow_hasTowCable",false,true];
			player setVariable ["tow_prepTowingVehicle",objNull,true];
			hint format ["You have dropped a tow cable. It was attached to a %1.",getText (configFile >> "CfgVehicles" >> (typeOf (player getVariable ["tow_prepTowingVehicle",objNull])) >> "displayNameShort")]
		}, // Code
		"", // Arguments
		10, // Priority
		false, // Show window
		true, // Hide on use
		"", // Shortcut
		"player getVariable [""tow_hasTowCable"",false]" // Condition
	];
};