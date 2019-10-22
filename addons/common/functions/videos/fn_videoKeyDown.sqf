/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\videos\fn_videoKeyDown.sqf
 *	by Ojemineh
 *	
 *	video key handler
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
 *	_kh = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call AXE_fnc_videoKeyDown"];
 *	
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_Control", "_DikCode", "_shiftState", "_ctrlState", "_altState"];

_Control	= _this select 0;
_DikCode	= _this select 1;
_shiftState	= _this select 2;
_ctrlState	= _this select 3;
_altState	= _this select 4;

// -------------------------------------------------------------------------------------------------

private _handled = false;

if (missionNamespace getVariable ["BIS_fnc_playVideo_canSkip", false]) then {
	
	switch (_DikCode) do {
		
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