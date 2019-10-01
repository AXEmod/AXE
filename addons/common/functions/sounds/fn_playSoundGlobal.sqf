/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_playSoundGlobal.sqf
 *	by Ojemineh
 *
 *	play global sound
 *
 *	Arguments:
 *	0: soundClass - <STRING>
 *	1: isSpeech   - <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *
 *	Example:
 *	["Earthquake_01", false] call AXE_fnc_playSoundGlobal;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_soundClass", "_isSpeech"];

_soundClass	= [_this, 0, "", [""]] call BIS_fnc_param;
_isSpeech	= [_this, 1, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

[_soundClass, _isSpeech] remoteExecCall ["AXE_fnc_playSound", 0];
