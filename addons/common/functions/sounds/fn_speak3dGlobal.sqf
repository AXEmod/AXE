/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_speak3dGlobal.sqf
 *	by Ojemineh
 *
 *	play global sound with random lip sync
 *
 *	Arguments:
 *	0: unit			- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: hearDistance	- <NUMBER>	(default 30m)
 *	3: playDistance	- <NUMBER>	(default 1000m)
 *	4: duration		- <NUMBER>	(in seconds)
 *	5: pitch		- <NUMBER>
 *	6: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[soldier1, "cp_mission_accomplished_1", 300] call AXE_fnc_speak3dGlobal;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_soundClass", "_hearDistance", "_playDistance", "_duration", "_pitch", "_isSpeech"];

_unit         	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_hearDistance 	= [_this, 2, 30, [0]] call BIS_fnc_param;
_playDistance	= [_this, 3, 1000, [0]] call BIS_fnc_param;
_duration     	= [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch        	= [_this, 5, 1, [0]] call BIS_fnc_param;
_isSpeech		= [_this, 6, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass, _hearDistance, _playDistance, _duration, _pitch, _isSpeech] remoteExecCall ["AXE_fnc_speak3d", 0];
