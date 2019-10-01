/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_getSoundDuration.sqf
 *	by Ojemineh
 *	
 *	get the duration of a soundclass
 *	(needs an edited CfgSound)
 *	
 *	Arguments:
 *	0: soundClass - <STRING>
 *	
 *	Return:
 *	<NUMBER>
 *	
 *	Example:
 *	["SND_anthem_usa"] call AXE_fnc_getSoundDuration;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_soundClass"];

_soundClass = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

private _return = -1;

if (getNumber (configFile >> "CfgSounds" >> _soundClass >> "duration") > 0) then {
	_return = getNumber (configFile >> "CfgSounds" >> _soundClass >> "duration");
	[5, "Get sound duration from config: Sound '%1', Duration '%2' seconds", [_soundClass, _return], "common"] call AXE_fnc_diagLog;
};

if (getNumber (missionConfigFile >> "CfgSounds" >> _soundClass >> "duration") > 0) then {
	_return = getNumber (missionConfigFile >> "CfgSounds" >> _soundClass >> "duration");
	[5, "Get sound duration from mission: Sound '%1', Duration '%2' seconds", [_soundClass, _return], "common"] call AXE_fnc_diagLog;
};

_return