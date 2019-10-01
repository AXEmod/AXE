/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_play3dGlobal.sqf
 *	by Ojemineh
 *
 *	play global sound at object position
 *
 *	Arguments:
 *	0: object		- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: hearDistance	- <NUMBER>	(in meter)
 *	3: playDistance	- <NUMBER>	(in meter)
 *	4: duration		- <NUMBER>	(in seconds)
 *	5: pitch		- <NUMBER>
 *	6: isSpeech		- <BOOLEAN>
 *	7: attach		- <ARRAY>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "BattlefieldFirefight1_3D", 300] call AXE_fnc_play3dGlobal;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_hearDistance", "_playDistance", "_duration", "_pitch", "_isSpeech", "_attach"];

_object       	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_hearDistance 	= [_this, 2, 100, [0]] call BIS_fnc_param;
_playDistance 	= [_this, 3, 1000, [0]] call BIS_fnc_param;
_duration     	= [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch        	= [_this, 5, 1, [0]] call BIS_fnc_param;
_isSpeech     	= [_this, 6, false, [true]] call BIS_fnc_param;
_attach       	= [_this, 7, [0,0,0], [[]]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass, _hearDistance, _playDistance, _duration, _pitch, _isSpeech, _attach] remoteExecCall ["AXE_fnc_play3d", 0];
