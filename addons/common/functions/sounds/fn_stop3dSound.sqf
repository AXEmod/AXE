/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_stop3dSound.sqf
 *	by Ojemineh
 *
 *	stop 3d sound
 *
 *	Arguments:
 *	0: object     - <OBJECT>
 *	1: soundClass - <STRING>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "AlarmBell"] call AXE_fnc_stop3dSound;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass"];

_object     = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass	= [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass] remoteExecCall ["AXE_fnc_stop3dSoundLocal", 0, true];
