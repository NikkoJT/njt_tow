// This function removes all the tow-related actions from a vehicle once it dies. EH set up in towable/canTow setups

params ["_unit","_mode"];

switch (_mode) do {
	// Remove towable actions
	case 0 : {
		_unit removeAction (_unit getVariable ["njt_tow_towedReleaseActionID",0]);
		{
			_actionVariable = _unit getVariable [_x,0];
			[_unit,_actionVariable] call BIS_fnc_holdActionRemove;
		} forEach ["njt_tow_connectFrontActionID","njt_tow_connectRearActionID","njt_tow_prepareTowedActionID","njt_tow_unprepareTowedActionID"];
	};
	// Remove canTow actions
	case 1 : {
		{
			_actionVariable = _unit getVariable [_x,0];
			[_unit,_actionVariable] call BIS_fnc_holdActionRemove;
		} forEach ["njt_tow_towReleaseActionID","njt_tow_towBrakesOffActionID","njt_tow_towBrakesOnActionID"];

		_actionVariable = _unit getVariable ["njt_tow_towPrepareActionID",0];
		[_unit,_actionVariable] call BIS_fnc_holdActionRemove;
	};
};