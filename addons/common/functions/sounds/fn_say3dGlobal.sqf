/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_say3dGlobal.sqf
 *	by Ojemineh
 *
 *	play global sound at object position
 *
 *	Arguments:
 *	0: object 		- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: hearDistance	- <NUMBER>	(default 100m)
 *	3: playDistance	- <NUMBER>	(default 1000m)
 *	4: pitch		- <NUMBER>
 *	5: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[speaker1, "c_in1_20_broadcast_SPE_0", 300, 1000, 1, false] call AXE_fnc_say3dGlobal;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_hearDistance", "_playDistance", "_pitch", "_isSpeech"];

_object       	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_hearDistance 	= [_this, 2, 100, [0]] call BIS_fnc_param;
_playDistance	= [_this, 3, 1000, [0]] call BIS_fnc_param;
_pitch        	= [_this, 4, 1, [0]] call BIS_fnc_param;
_isSpeech     	= [_this, 5, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass, _hearDistance, _playDistance, _pitch, _isSpeech] remoteExecCall ["AXE_fnc_say3d", 0];
