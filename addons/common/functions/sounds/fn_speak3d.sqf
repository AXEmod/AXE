/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_speak3d.sqf
 *	by Ojemineh
 *
 *	play local sound with random lip sync
 *
 *	Arguments:
 *	0: unit			- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: hearDistance	- <NUMBER>	(default 30m)
 *	3: playDistance	- <NUMBER>	(default 1000m)
 *	4: duration		- <NUMBER>	(in seconds)
 *	5: pitch		- <NUMBER>
 *	6: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[soldier1, "cp_mission_accomplished_1", 300] call AXE_fnc_speak3d;
 *
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_unit", "_soundClass", "_hearDistance", "_playDistance", "_duration", "_pitch", "_isSpeech"];

_unit         	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_hearDistance 	= [_this, 2, 30, [0]] call BIS_fnc_param;
_playDistance	= [_this, 3, 1000, [0]] call BIS_fnc_param;
_duration     	= [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch        	= [_this, 5, 1, [0]] call BIS_fnc_param;
_isSpeech     	= [_this, 6, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (Not alive _unit) exitWith {};
if !(_unit isKindOf "CAManBase") exitWith {};
if (_soundClass isEqualTo "") exitWith {};

if (_hearDistance <= 0) then {_hearDistance = 30;};
if (_playDistance <= 0) then {_playDistance = 1000;};
if ((player distance _unit) > _playDistance) exitWith {};

// -------------------------------------------------------------------------------------------------

if (_duration <= 0) then {_duration = [_soundClass] call AXE_fnc_getSoundDuration;};
if (_duration <= 0) exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit, _soundClass, _hearDistance, _playDistance, _duration, _pitch, _isSpeech] spawn {
	
	params ["_unit", "_soundClass", "_hearDistance", "_playDistance", "_duration", "_pitch", "_isSpeech"];
	
	private _helper = AXE_COMMON_HELPER_OBJECT createVehicleLocal [0,0,0];
	_helper hideObject true;
	
	private _headPos = _unit selectionPosition "head";
	_helper attachTo [_unit, _headPos];
	
	_unit setVariable ["axe_speak3d_active", true, true];
	_unit setVariable ["axe_speak3d_object", _helper];
	_unit setRandomLip true;
	
	private _timer = time + _duration;
	
	_helper say3d [_soundClass, _hearDistance, _pitch, _isSpeech];
	
	waitUntil {
		(_unit getVariable ["ACE_isUnconscious", false]) ||
		(Not alive _unit) ||
		(isNull _helper) ||
		(_timer < time)
	};
	
	_unit setRandomLip false;
	_unit setVariable ["axe_speak3d_object", nil];
	_unit setVariable ["axe_speak3d_active", nil, true];
	
	if (Not isNull _helper) then {deleteVehicle _helper;};
	
};
