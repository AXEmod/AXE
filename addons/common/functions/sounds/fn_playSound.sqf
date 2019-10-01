/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_playSound.sqf
 *	by Ojemineh
 *
 *	play local sound
 *
 *	Arguments:
 *	0: soundClass - <STRING>
 *	1: isSpeech   - <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	["Earthquake_01", false] call AXE_fnc_playSound;
 *
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_soundClass", "_isSpeech"];

_soundClass	= [_this, 0, "", [""]] call BIS_fnc_param;
_isSpeech   = [_this, 1, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

playSound [_soundClass, _isSpeech];
