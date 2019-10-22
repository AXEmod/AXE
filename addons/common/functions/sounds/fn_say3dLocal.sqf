/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_say3dLocal.sqf
 *	by Ojemineh
 *
 *	play local sound at object position
 *
 *	Arguments:
 *	0: object 		- <OBJECT>
 *	1: soundClass	- <STRING>
 *	2: distance		- <NUMBER>	(default: 100m)
 *	3: maxDistance	- <NUMBER>	(default: no limitation)
 *	4: pitch		- <NUMBER>
 *	5: isSpeech		- <BOOLEAN>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "AlarmBell"] call AXE_fnc_say3dLocal;
 *
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_distance", "_maxDistance", "_pitch", "_isSpeech"];

_object       	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass   	= [_this, 1, "", [""]] call BIS_fnc_param;
_distance		= [_this, 2, -1, [0]] call BIS_fnc_param;
_maxDistance	= [_this, 3, -1, [0]] call BIS_fnc_param;
_pitch        	= [_this, 4, -1, [0]] call BIS_fnc_param;
_isSpeech     	= [_this, 5, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (_soundClass isEqualTo "") exitWith {};

if (_distance <= 0) then {_distance = [_soundClass] call AXE_fnc_getSoundDistance;};
if (_distance <= 0) then {_distance = 100;};
if ((_maxDistance > 0) && ((player distance _object) > _maxDistance)) exitWith {};

if (_pitch <= 0) then {_pitch = [_soundClass] call AXE_fnc_getSoundPitch;};
if (_pitch <= 0) then {_pitch = 1;};

// -------------------------------------------------------------------------------------------------

_object say3d [_soundClass, _distance, _pitch, _isSpeech];
