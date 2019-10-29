/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_screenshot.sqf
 *	by Ojemineh
 *	
 *	take a screenshot without hud/gui
 *	
 *	Arguments:
 *	0: Filename - <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_fnc_screenshot;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_filename"];

_filename = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

[_filename] spawn {
	
	params ["_filename"];
	
	/*
	private _ppE = ppEffectCreate ["colorCorrections", 1800];
	_ppE ppEffectEnable true;
	_ppE ppEffectAdjust [1.0, 1.0, 0, [0, 0, 0, 0], [1, 1, 1, 0.6], [0, 0, 0, 0]];
	_ppE ppEffectCommit 0;
	*/
	
	screenshot _filename;
	
	playSound ["AXE_Common_Snapshot_1", false];
	
	0 cutText ["", "BLACK FADED", 9999];
	uiSleep 0.2;
	0 cutText ["", "BLACK IN", 0.01];
	
	/*
	_ppE ppEffectEnable false;
	ppEffectDestroy _ppE;
	*/
	
};
