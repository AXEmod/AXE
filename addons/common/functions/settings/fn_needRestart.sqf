/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\settings\fn_needRestart.sqf
 *	by Ojemineh
 *	
 *	settings restart notification
 *	
 *	Arguments:
 *	0: setting		- <STRING>
 *	1: restartID	- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	["axe_debug_enabled", 2] call AXE_fnc_needRestart;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_setting", "_restartID"];

_setting	= [_this, 0, "", [""]] call BIS_fnc_param;
_restartID	= [_this, 1, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_setting isEqualTo "") exitWith {};
if (time < 1) exitWith {};

// -------------------------------------------------------------------------------------------------

switch (_restartID) do {
	
	// RESTART MISSION
	case 1: {
		[_setting, _restartID] remoteExec ["AXE_fnc_needRestartLocal", 0];
	};
	
	// RESTART SESSION (GLOBAL)
	case 2: {
		[_setting, _restartID] remoteExec ["AXE_fnc_needRestartLocal", 0];
	};
	
	// RESTART SESSION (PLAYER)
	case 3: {
		[_setting, _restartID] remoteExec ["AXE_fnc_needRestartLocal", player];
	};
	
	// RESTART ENGINE
	default {
		[_setting, _restartID] remoteExec ["AXE_fnc_needRestartLocal", 0];
	};
	
};
