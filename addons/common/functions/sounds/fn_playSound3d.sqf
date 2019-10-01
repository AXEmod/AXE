/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_playSound3d.sqf
 *	by Ojemineh
 *
 *	play global sound at object position
 *
 *	Arguments:
 *	0: object     - <OBJECT>
 *	1: soundClass - <STRING>
 *	2: distance   - <NUMBER>
 *	3: volume     - <NUMBER>
 *	4: pitch      - <NUMBER>
 *	5: isInside   - <BOOLEAN>
 *	6: position   - <ARRAY>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[car1, "horn", 300] call AXE_fnc_playSound3d;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_distance", "_max", "_volume", "_pitch"];

_object     = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass	= [_this, 1, "", [""]] call BIS_fnc_param;
_distance   = [_this, 2, 300, [0]] call BIS_fnc_param;
_volume     = [_this, 3, -1, [0]] call BIS_fnc_param;
_pitch      = [_this, 4, -1, [0]] call BIS_fnc_param;
_isInside   = [_this, 5, false, [true]] call BIS_fnc_param;
_position   = [_this, 6, [], [[]]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

if (_position isEqualTo []) then { _position = (getPosASL _object); };

// -------------------------------------------------------------------------------------------------

private _soundArray = getArray (configFile >> "CfgSounds" >> _soundClass >> "sound");
private _soundPath = "";
private _soundFile = "";
private _soundVolume = 1;
private _soundPitch = 1;

if (count _soundArray > 0) then {
	
	_soundPath = _soundArray select 0;
	
	if (_volume > 0) then {
		_soundVolume = _volume;
	} else {
		_soundVolume = _soundArray select 1;
	};
	
	if (_pitch > 0) then {
		_soundPitch = _pitch;
	} else {
		_soundPitch = _soundArray select 2;
	};
	
	if ( (_soundPath find "\") isEqualTo 0 ) then {
		_soundFile = [_soundPath, 1] call BIS_fnc_trimString;
	} else {
		_soundFile = _soundPath;
	};
	
	if ( (_soundFile != "") && ((_soundFile find ".") isEqualTo -1) ) then {
		_soundFile = _soundFile + ".wss";
	};
	
	[5, "playSound3d '%1' on Object '%2' (Position: %3)", [_soundFile, _object, _position], "common"] call AXE_fnc_diagLog;
	playSound3D [_soundFile, _object, _isInside, _position, _soundVolume, _soundPitch, _distance];
	
};
