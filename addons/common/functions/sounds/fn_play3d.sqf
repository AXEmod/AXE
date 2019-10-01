/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_play3d.sqf
 *	by Ojemineh
 *
 *	play local sound at object position
 *
 *	Arguments:
 *	0: object       - <OBJECT>
 *	1: soundClass   - <STRING>
 *	2: hearDistance - <NUMBER>	(in meter)
 *	3: playDistance - <NUMBER>	(in meter)
 *	4: duration     - <NUMBER>	(in seconds)
 *	5: pitch        - <NUMBER>
 *	6: isSpeech     - <BOOLEAN>
 *	7: attach       - <ARRAY>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "BattlefieldFirefight1_3D", 300] call AXE_fnc_play3d;
 *
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_hearDistance", "_playDistance", "_duration", "_pitch", "_isSpeech", "_attach"];

_object       	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_hearDistance 	= [_this, 2, 100, [0]] call BIS_fnc_param;
_playDistance	= [_this, 3, 1000, [0]] call BIS_fnc_param;
_duration     	= [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch        	= [_this, 5, 1, [0]] call BIS_fnc_param;
_isSpeech     	= [_this, 6, false, [true]] call BIS_fnc_param;
_attach       	= [_this, 7, [0,0,0], [[]]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};
if (_hearDistance <= 0) then {_hearDistance = 100;};
if (_playDistance <= 0) then {_playDistance = 1000;};
if ((player distance _object) > _playDistance) exitWith {};
if (_attach isEqualTo []) then {_attach = [0,0,0];};

// -------------------------------------------------------------------------------------------------

if (_duration <= 0) then { _duration = [_soundClass] call AXE_fnc_getSoundDuration; };
if (_duration <= 0) exitWith {};

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
	[_object, _soundClass] call AXE_fnc_stop3d;
	[_object, _soundClass, _hearDistance, _playDistance, _duration, _pitch, _isSpeech, _attach] call AXE_fnc_play3d;
};

// -------------------------------------------------------------------------------------------------

private _soundObject = AXE_COMMON_HELPER_OBJECT createVehicleLocal [0,0,0];
_soundObject hideObject true;
_soundObject attachTo [_object, _attach];

_soundArray pushBackUnique [_soundClass, _soundObject];
_object setVariable ["axe_sound3d", _soundArray];

private _handler = [_object, _soundObject, _soundClass, _hearDistance, _playDistance, _duration, _pitch, _isSpeech] spawn {
	
	params ["_object", "_soundObject", "_soundClass", "_hearDistance", "_playDistance", "_duration", "_pitch", "_isSpeech"];
	
	[5, "play3d '%1' on Object '%2'", [_soundClass, _soundObject], "common"] call AXE_fnc_diagLog;
	
	[_soundObject, _soundClass, _hearDistance, _playDistance, _pitch, _isSpeech] call AXE_fnc_say3d;
	
	sleep _duration;
	
	[_object, _soundClass] call AXE_fnc_stop3d;
	
};

_handler
