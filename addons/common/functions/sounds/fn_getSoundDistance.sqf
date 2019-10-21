/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_getSoundDistance.sqf
 *	by Ojemineh
 *
 *	get distance of a sound-class
 *
 *	Arguments:
 *	0: soundClass - <STRING>
 *
 *	Return:
 *	<NUMBER>
 *
 *	Example:
 *	["AlarmBell"] call AXE_fnc_getSoundDistance;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_soundClass"];

_soundClass = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

private _soundArray	= [];
private _return		= 0;

if (isClass (missionConfigFile >> "CfgSounds" >> _soundClass)) then {
	_soundArray = getArray (missionConfigFile >> "CfgSounds" >> _soundClass >> "sound");
} else {
	if (isClass (configFile >> "CfgSounds" >> _soundClass)) then {
		_soundArray = getArray (configFile >> "CfgSounds" >> _soundClass >> "sound");
	};
};

if (count _soundArray > 3) then {
	_return = _soundArray select 3;
};

_return;