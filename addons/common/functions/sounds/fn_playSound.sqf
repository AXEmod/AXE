/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_playSound.sqf
 *	by Ojemineh
 *
 *	play sound for all players
 *
 *	Arguments:
 *	0: soundClass - <STRING>
 *	1: isSpeech   - <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *
 *	Example:
 *	["Earthquake_01"] call AXE_fnc_playSound;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_soundClass", "_isSpeech"];

_soundClass	= [_this, 0, "", [""]] call BIS_fnc_param;
_isSpeech	= [_this, 1, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_soundClass, _isSpeech] remoteExecCall ["AXE_fnc_playSoundLocal", 0, false];
