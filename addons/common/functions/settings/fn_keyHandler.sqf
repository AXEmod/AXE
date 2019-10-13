#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\settings\fn_keyHandler.sqf
 *	by Ojemineh
 *	
 *	controls the use of the tactical view
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_fnc_keyHandler;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_Control", "_DikCode", "_shiftState", "_ctrlState", "_altState"];

// -------------------------------------------------------------------------------------------------

private _handled = false;

//systemChat format ["%1 | %2 | %3 | %4 | %5", _Control, _DikCode, _shiftState, _ctrlState, _altState];

// TACTICAL VIEW
if (_DikCode in (actionKeys "tacticalView")) then {
	if !(missionNamespace getVariable ["axe_tactical_view_enabled", false]) then {
		_handled = true;
	};
};

_handled