// This function removes all the tow-related actions from a vehicle once it dies. EH set up in towable/canTow setups

params ["_unit","_mode"];

switch (_mode) do {
	// Remove towable actions
	case 0 : {
		_unit removeAction (_unit getVariable ["tow_towedReleaseActionID",0]);
		{
			_actionVariable = _unit getVariable [_x,0];
			[_unit,_actionVariable] call BIS_fnc_holdActionRemove;
		} forEach ["tow_connectFrontActionID","tow_connectRearActionID","tow_prepareTowedActionID","tow_unprepareTowedActionID"];
	};
	// Remove canTow actions
	case 1 : {
		{
			_actionVariable = _unit getVariable [_x,0];
			[_unit,_actionVariable] call BIS_fnc_holdActionRemove;
		} forEach ["tow_towReleaseActionID","tow_towBrakesOffActionID","tow_towBrakesOnActionID"];

		_actionVariable = _unit getVariable ["tow_towPrepareActionID",0];
		[_unit,_actionVariable] call BIS_fnc_holdActionRemove;
	};
};