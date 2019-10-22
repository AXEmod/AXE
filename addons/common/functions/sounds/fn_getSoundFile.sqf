/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_getSoundFile.sqf
 *	by Ojemineh
 *
 *	get filename (incl. path) of a sound-class
 *
 *	Arguments:
 *	0: soundClass - <STRING>
 *
 *	Return:
 *	<STRING>
 *
 *	Example:
 *	["AlarmBell"] call AXE_fnc_getSoundFile;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_soundClass"];

_soundClass = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

private _missionRoot	= str missionConfigFile select [0, count str missionConfigFile - 15];
private _soundArray		= [];
private _soundPath  	= "";
private _soundFile  	= "";
private _return     	= "";

if (isClass (missionConfigFile >> "CfgSounds" >> _soundClass)) then {
	_soundArray = getArray (missionConfigFile >> "CfgSounds" >> _soundClass >> "sound");
	if (count _soundArray > 0) then {
		_soundPath = _soundArray select 0;
		if (_soundPath select [0,1] == "\") then {
			_soundFile = _missionRoot + (_soundPath select [1]);
		} else {
			_soundFile = _missionRoot + _soundPath;
		};
	};
} else {
	if (isClass (configFile >> "CfgSounds" >> _soundClass)) then {
		_soundArray = getArray (configFile >> "CfgSounds" >> _soundClass >> "sound");
		if (count _soundArray > 0) then {
			_soundPath = _soundArray select 0;
			if ((_soundPath select [0,1]) == "\") then {
				_soundFile = _soundPath select [1];
			} else {
				_soundFile = _soundPath;
			};
		};
	};
};

if ((_soundFile != "") && ((_soundFile find ".") == -1)) then {
	_return = _soundFile + ".wss";
} else {
	_return = _soundFile;
};

_return;