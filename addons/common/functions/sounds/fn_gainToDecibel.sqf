/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_gainToDecibel.sqf
 *	by Ojemineh
 *	
 *	convert gain to decibel
 *	
 *	Arguments:
 *	0: gain - <NUMBER>
 *	
 *	Return:
 *	<NUMBER>
 *	
 *	Example:
 *	[1] call AXE_fnc_gainToDecibel;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_gain"];

_gain = [_this, 0, 1, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_gain <= 0) exitWith {0};

// -------------------------------------------------------------------------------------------------

private _return = 20 * (log _gain);

_return;