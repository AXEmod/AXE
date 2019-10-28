/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_loop3dSoundLocal.sqf
 *	by Ojemineh
 *
 *	loop local sound at attached position
 *
 *	Arguments:
 *	0: object		- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: position		- <ARRAY>
 *	3: distance		- <NUMBER>	(default: 100m)
 *	4: maxDistance	- <NUMBER>	(default: no limitation)
 *	5: duration		- <NUMBER>	(seconds)
 *	6: pitch		- <NUMBER>
 *	7: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "AlarmBell", [], -1, -1, 6] call AXE_fnc_loop3dSoundLocal;
 *
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_position", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];

_object			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass		= [_this, 1, "", [""]] call BIS_fnc_param;
_position		= [_this, 2, [], [[]]] call BIS_fnc_param;
_distance		= [_this, 3, -1, [0]] call BIS_fnc_param;
_maxDistance	= [_this, 4, -1, [0]] call BIS_fnc_param;
_duration		= [_this, 5, -1, [0]] call BIS_fnc_param;
_pitch			= [_this, 6, -1, [0]] call BIS_fnc_param;
_isSpeech		= [_this, 7, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

if (_position isEqualTo []) then {_position = [0,0,0];};
if (_distance <= 0) then {_distance = [_soundClass] call AXE_fnc_getSoundDistance;};
if (_distance <= 0) then {_distance = 100;};
//if ((_maxDistance > 0) && ((player distance _object) > _maxDistance)) exitWith {};

if (_duration <= 0) then {_duration = [_soundClass] call AXE_fnc_getSoundDuration;};
if (_duration <= 0) exitWith {};

if (_pitch <= 0) then {_pitch = [_soundClass] call AXE_fnc_getSoundPitch;};
if (_pitch <= 0) then {_pitch = 1;};

// -------------------------------------------------------------------------------------------------

private _soundArray = _object getVariable ["axe_sound3d", []];
private _soundInUse = false;

if (count _soundArray > 0) then {
	{
		if ((_x select 0) == _soundClass) then {
			_soundInUse = true;
		};
	} forEach _soundArray;
};

if (_soundInUse) exitWith {
	[_object, _soundClass, _position, _distance, _maxDistance, _duration, _pitch, _isSpeech] spawn {
		params ["_object", "_soundClass", "_position", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];
		[_object, _soundClass] call AXE_fnc_stop3dSoundLocal;
		sleep 0.1;
		[_object, _soundClass, _position, _distance, _maxDistance, _duration, _pitch, _isSpeech] call AXE_fnc_loop3dSoundLocal;
	};
};

// -------------------------------------------------------------------------------------------------

private _soundObject = AXE_COMMON_HELPER_OBJECT createVehicleLocal [0,0,0];
_soundObject hideObject true;
_soundObject attachTo [_object, _position];

_soundArray pushBackUnique [_soundClass, _soundObject];
_object setVariable ["axe_sound3d", _soundArray];

private _handler = [_object, _soundObject, _soundClass, _distance, _maxDistance, _duration, _pitch, _isSpeech] spawn {
	params ["_object", "_soundObject", "_soundClass", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];
	while {(alive _object) && !(isNull _soundObject)} do {
		[_soundObject, _soundClass, _distance, _maxDistance, _pitch, _isSpeech] call AXE_fnc_say3dLocal;
		private _time = CBA_missionTime + _duration;
		waitUntil {!(alive _object) || (isNull _soundObject) || (_time < CBA_missionTime)};
	};
	[_object, _soundClass] call AXE_fnc_stop3dSoundLocal;
};

_handler;