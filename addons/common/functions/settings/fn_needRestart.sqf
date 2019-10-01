/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\settings\fn_needRestart.sqf
 *	by Ojemineh
 *	
 *	settings restart notification
 *	
 *	Arguments:
 *	0: setting		- <STRING>
 *	1: mission		- <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	["axe_debug_enabled", false] call AXE_fnc_needRestart;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_setting", "_mission"];

_setting	= [_this, 0, "", [""]] call BIS_fnc_param;
_mission	= [_this, 1, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_setting isEqualTo "") exitWith {};
if (time < 1) exitWith {};

// -------------------------------------------------------------------------------------------------

if (_mission) then {
	[_setting, _mission] remoteExec ["AXE_fnc_needRestartLocal", 0];
} else {
	[_setting, _mission] remoteExec ["AXE_fnc_needRestartLocal", player];
};
