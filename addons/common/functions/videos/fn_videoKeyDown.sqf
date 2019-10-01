/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\videos\fn_videoKeyDown.sqf
 *	by Ojemineh
 *	
 *	video key handler
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	_kh = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call AXE_fnc_videoKeyDown"];
 *	
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_ctrl", "_code", "_shift", "_ctrlKey", "_alt", "_handled"];

_ctrl 		= _this select 0;
_code 		= _this select 1;
_shift 		= _this select 2;
_ctrlKey	= _this select 3;
_alt 		= _this select 4;

// -------------------------------------------------------------------------------------------------

if (missionNamespace getVariable ["BIS_fnc_playVideo_canSkip", false]) then {
	
	switch (_code) do {
		
		// ESC
		case  1: { 
			missionNamespace setVariable ["BIS_fnc_playVideo_skipVideo", true];
			_handled = true;
		};
		
		// SPACE
		case 57: {
			missionNamespace setVariable ["BIS_fnc_playVideo_skipVideo", true];
			_handled = true;
		};
		
		// OTHER
		default {
			_handled = true;
		};
		
	};
	
} else {
	
	_handled = true;
	
};

_handled;
