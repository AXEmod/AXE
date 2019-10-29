/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_speak3dLocal.sqf
 *	by Ojemineh
 *
 *	play local sound with random lip sync
 *
 *	Arguments:
 *	0: unit			- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: distance		- <NUMBER>	(default: 30m)
 *	3: maxDistance	- <NUMBER>	(default: no limitation)
 *	4: duration		- <NUMBER>	(seconds)
 *	5: pitch		- <NUMBER>
 *	6: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "cp_mission_accomplished_1", -1, -1, 4.5] call AXE_fnc_speak3dLocal;
 *
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_unit", "_soundClass", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];

_unit         	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_distance 		= [_this, 2, -1, [0]] call BIS_fnc_param;
_maxDistance	= [_this, 3, -1, [0]] call BIS_fnc_param;
_duration     	= [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch        	= [_this, 5, -1, [0]] call BIS_fnc_param;
_isSpeech     	= [_this, 6, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if !(_unit isKindOf "CAManBase") exitWith {};
if !(alive _unit) exitWith {};
if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

if (_distance <= 0) then {_distance = [_soundClass] call AXE_fnc_getSoundDistance;};
if (_distance <= 0) then {_distance = 30;};
if ((_maxDistance > 0) && ((player distance _unit) > _maxDistance)) exitWith {};

if (_duration <= 0) then {_duration = [_soundClass] call AXE_fnc_getSoundDuration;};
if (_duration <= 0) exitWith {};

if (_pitch <= 0) then {_pitch = [_soundClass] call AXE_fnc_getSoundPitch;};
if (_pitch <= 0) then {_pitch = 1;};

// -------------------------------------------------------------------------------------------------

private _soundArray = _unit getVariable ["axe_sound3d", []];
private _soundInUse = false;

if (count _soundArray > 0) then {
	{
		if ((_x select 0) == _soundClass) then {
			_soundInUse = true;
		};
	} forEach _soundArray;
};

if (_soundInUse) exitWith {
	[_unit, _soundClass, _distance, _maxDistance, _duration, _pitch, _isSpeech] spawn {
		params ["_unit", "_soundClass", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];
		[_unit, _soundClass] call AXE_fnc_stop3dSoundLocal;
		sleep 0.1;
		[_unit, _soundClass, _distance, _maxDistance, _duration, _pitch, _isSpeech] call AXE_fnc_speak3dLocal;
	};
};

// -------------------------------------------------------------------------------------------------

[_unit, _soundClass, _distance, _maxDistance, _duration, _pitch, _isSpeech] spawn {
	
	params ["_unit", "_soundClass", "_distance", "_maxDistance", "_duration", "_pitch", "_isSpeech"];
	
	private _helper = createSimpleObject [AXE_COMMON_HELPER_OBJECT, [0,0,0], true];
	_helper hideObject true;
	_helper attachTo [_unit, (_unit selectionPosition "head")];
	
	private _soundArray = _unit getVariable ["axe_sound3d", []];
	_soundArray pushBackUnique [_soundClass, _helper];
	
	_unit setVariable ["axe_sound3d", _soundArray];
	_unit setVariable ["axe_speak3d", true, true];
	_unit setRandomLip true;
	
	private _timer = CBA_missionTime + _duration;
	
	_helper say3d [_soundClass, _distance, _pitch, _isSpeech];
	
	waitUntil {
		if (
			(_unit getVariable ["ACE_isUnconscious", false]) ||
			(Not alive _unit) ||
			(isNull _helper) ||
			(_timer < CBA_missionTime)
		) exitWith {true};
		false
	};
	
	_unit setRandomLip false;
	_unit setVariable ["axe_speak3d", nil, true];
	
	[_unit, _soundClass] call AXE_fnc_stop3dSoundLocal;
	
};
