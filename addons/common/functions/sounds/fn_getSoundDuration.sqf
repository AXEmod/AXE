/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_getSoundDuration.sqf
 *	by Ojemineh
 *	
 *	get duration of a sound-class
 *	(needs an adjusted CfgSounds)
 *	
 *	Arguments:
 *	0: soundClass - <STRING>
 *	
 *	Return:
 *	<NUMBER>
 *	
 *	Example:
 *	["AlarmBell"] call AXE_fnc_getSoundDuration;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_soundClass"];

_soundClass = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {-1};

// -------------------------------------------------------------------------------------------------

private _return = -1;

if (getNumber (missionConfigFile >> "CfgSounds" >> _soundClass >> "duration") > 0) then {
	_return = getNumber (missionConfigFile >> "CfgSounds" >> _soundClass >> "duration");
} else {
	if (getNumber (configFile >> "CfgSounds" >> _soundClass >> "duration") > 0) then {
		_return = getNumber (configFile >> "CfgSounds" >> _soundClass >> "duration");
	};
};

_return;