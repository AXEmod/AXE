/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_speak3d.sqf
 *	by Ojemineh
 *
 *	play global sound with random lip sync
 *
 *	Arguments:
 *	0: unit			- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: distance		- <NUMBER>	(default: 30m)
 *	3: maxDistance	- <NUMBER>	(default: no limitation)
 *	4: duration		- <NUMBER>	(seconds)
 *	5: pitch		- <NUMBER>
 *	6: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "cp_mission_accomplished_1", -1, -1, 4.5] call AXE_fnc_speak3d;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_soundClass", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];

_unit         	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_distance 		= [_this, 2, -1, [0]] call BIS_fnc_param;
_maxDistance	= [_this, 3, -1, [0]] call BIS_fnc_param;
_duration     	= [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch        	= [_this, 5, -1, [0]] call BIS_fnc_param;
_isSpeech     	= [_this, 6, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit, _soundClass, _distance, _maxDistance, _duration, _pitch, _isSpeech] remoteExecCall ["AXE_fnc_speak3dLocal", 0, false];
