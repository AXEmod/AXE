/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_getSoundPath.sqf
 *	by Ojemineh
 *
 *	get the path of a soundclass
 *
 *	Arguments:
 *	0: soundClass	- <STRING>
 *	1: leadingSlash	- <BOOLEAN>
 *
 *	Return:
 *	<STRING>
 *
 *	Example:
 *	["horn"] call axe_fnc_getSoundPath;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_soundClass", "_leadingSlash"];

_soundClass		= [_this, 0, "", [""]] call BIS_fnc_param;
_leadingSlash	= [_this, 1, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

private _soundArray = getArray (configFile >> "CfgSounds" >> _soundClass >> "sound");
private _soundPath  = "";
private _soundFile  = "";
private _return     = "";

if (count _soundArray > 0) then {
	_soundPath = _soundArray select 0;
	if ( (_soundPath find "\") isEqualTo 0 ) then {
		if (!_leadingSlash) then {
			_soundFile = [_soundPath, 1] call BIS_fnc_trimString;
		} else {
			_soundFile = _soundPath;
		};
	} else {
		if (_leadingSlash) then {
			_soundFile = format ["\%1", _soundPath];
		} else {
			_soundFile = _soundPath;
		};
	};
};

if ( (_soundFile != "") && ((_soundFile find ".") isEqualTo -1) ) then {
	_return = _soundFile + ".wss";
} else {
	_return = _soundFile;
};

[5, "Get sound path from config: Sound '%1', Path '%2'", [_soundClass, _return], "common"] call AXE_fnc_diagLog;

_return
