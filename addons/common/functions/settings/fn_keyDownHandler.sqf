#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\settings\fn_keyDownHandler.sqf
 *	by Ojemineh
 *	
 *	controls the use of the tactical view
 *	
 *	Arguments:
 *	0: Control		- <DISPLAY>
 *	1: DikCode		- <NUMBER>
 *	2: shiftState	- <BOOLEAN>
 *	3: ctrlState	- <BOOLEAN>
 *	4: altState		- <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_fnc_keyDownHandler;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_Control", "_DikCode", "_shiftState", "_ctrlState", "_altState"];

// -------------------------------------------------------------------------------------------------

private _handled = false;

// TACTICAL VIEW
if (_DikCode in (actionKeys "tacticalView")) then {
	if !(missionNamespace getVariable ["axe_tactical_view_enabled", false]) then {
		_handled = true;
	};
};

_handled;