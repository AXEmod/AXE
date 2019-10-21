/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_getSoundVolume.sqf
 *	by Ojemineh
 *
 *	get volume of a sound-class
 *
 *	Arguments:
 *	0: soundClass - <STRING>
 *
 *	Return:
 *	<NUMBER>
 *
 *	Example:
 *	["AlarmBell"] call AXE_fnc_getSoundVolume;
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

if (count _soundArray > 1) then {
	if ((_soundArray select 1) isEqualType "") then {
		if (([(_soundArray select 1), "db"] call CBA_fnc_find) > -1) then {
			_return = [(_soundArray select 1)] call AXE_fnc_decibelToGain;
		} else {
			_return = parseNumber (_soundArray select 1);
		};
	} else {
		_return = (_soundArray select 1);
	};
};

_return;