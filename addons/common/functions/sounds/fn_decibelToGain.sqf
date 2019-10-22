/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_decibelToGain.sqf
 *	by Ojemineh
 *	
 *	convert decibel to gain
 *	
 *	Arguments:
 *	0: decibel	- <NUMBER/STRING>
 *	
 *	Return:
 *	<NUMBER>
 *	
 *	Example:
 *	["db-20"] call AXE_fnc_decibelToGain;
 *	[0] call AXE_fnc_decibelToGain;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_decibel"];

_decibel = [_this, 0, 0, [0,""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = 0;

if (_decibel isEqualType "") then {
	
	if (([_decibel, "db"] call CBA_fnc_find) > -1) then {
		private _dbX = parseNumber ([_decibel, "db", ""] call CBA_fnc_replace);
		_return = 10 ^ (_dbX / 20);
	} else {
		private _dbX = parseNumber _decibel;
		_return = 10 ^ (_dbX / 20);
	};
	
} else {
	
	_return = 10 ^ (_decibel / 20);
	
};

_return;