/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_play3dSound.sqf
 *	by Ojemineh
 *
 *	play global sound at attached position
 *
 *	Arguments:
 *	0: object		- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: position		- <ARRAY>
 *	3: distance		- <NUMBER>	(default: 100m)
 *	4: maxDistance	- <NUMBER>	(default: no limitation)
 *	5: duration		- <NUMBER>	(seconds)
 *	6: pitch		- <NUMBER>
 *	7: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "AlarmBell", [], -1, -1, 6] call AXE_fnc_play3dSound;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_position", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];

_object			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass		= [_this, 1, "", [""]] call BIS_fnc_param;
_position		= [_this, 2, [], [[]]] call BIS_fnc_param;
_distance		= [_this, 3, -1, [0]] call BIS_fnc_param;
_maxDistance	= [_this, 4, -1, [0]] call BIS_fnc_param;
_duration		= [_this, 5, -1, [0]] call BIS_fnc_param;
_pitch			= [_this, 6, -1, [0]] call BIS_fnc_param;
_isSpeech		= [_this, 7, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass, _position, _distance, _maxDistance, _duration, _pitch, _isSpeech] remoteExecCall ["AXE_fnc_play3dSoundLocal", 0, true];
