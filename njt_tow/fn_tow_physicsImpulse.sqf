params ["_vehicle",["_isDisableBrakes",false]];

if !(local _vehicle) exitWith{};
if (_vehicle == player) exitWith{};
private _towed = _vehicle getVariable ["njt_tow_vehicleTowedByThis",objNull];
if (isNull _towed) exitWith{};

if ((abs speed _towed) > 1) exitWith{};
if (_towed getVariable ["njt_tow_isForcing",false]) exitWith{};

_towed setVariable ["njt_tow_isForcing",true,true];

private _velocity = (vectorDir _towed) vectorMultiply getMass _towed;
_towed addForce [_velocity, [0,0,0], false];

if !_isDisableBrakes then {
	while {(inputAction "CarForward" > 0) && (abs speed _towed < 2)} do {
		sleep 0.1;
		private _velocity = (vectorDir _towed) vectorMultiply getMass _towed;
		_towed addForce [_velocity, [0,0,0], false];
	};
};

_towed setVariable ["njt_tow_isForcing",false,true];