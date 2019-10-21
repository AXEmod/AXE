/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\sounds\fn_stop3dSoundLocal.sqf
 *	by Ojemineh
 *
 *	stop 3d sound
 *
 *	Arguments:
 *	0: object     - <OBJECT>
 *	1: soundClass - <STRING>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player, "AlarmBell"] call AXE_fnc_stop3dSoundLocal;
 *
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass"];

_object     = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass	= [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};

// -------------------------------------------------------------------------------------------------

private _soundArray = _object getVariable ["axe_sound3d", []];
private _soundInUse = false;
private _soundObject = objNull;

// -------------------------------------------------------------------------------------------------

if (_soundClass != "") then {
	
	if (count _soundArray > 0) then {
		{
			if ((_x select 0) == _soundClass) then {
				_soundObject = (_x select 1);
				_soundInUse = true;
			};
		} forEach _soundArray;
	};
	
	if (_soundInUse) then {
		
		private _index = _soundArray find [_soundClass, _soundObject];
		
		if (_index >= 0) then {
			_soundArray deleteAt _index;
			_object setVariable ["axe_sound3d", _soundArray];
			if (Not isNull _soundObject) then {deleteVehicle _soundObject;};
		};
		
	};
	
} else {
	
	if (count _soundArray > 0) then {
		{
			
			private _sndClass = (_x select 0);
			private _sndObject = (_x select 1);
			
			if (Not isNull _sndObject) then {deleteVehicle _sndObject;};
			
		} forEach _soundArray;
	};
	
	_object setVariable ["axe_sound3d", []];
	
};
