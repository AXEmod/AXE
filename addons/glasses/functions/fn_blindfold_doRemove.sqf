/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_glasses\functions\fn_blindfold_doPutOn.sqf
 *	by Ojemineh
 *	
 *	remove blindfold from unit
 *	
 *	Arguments:
 *	0: caller	- <OBJECT>
 *	1: target	- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[_player, _target] call AXE_glasses_fnc_blindfold_doPutOn;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_caller", "_target"];

_caller = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _caller) exitWith {};
if (isNull _target) exitWith {};

// -------------------------------------------------------------------------------------------------

[_caller, _target] spawn {
	
	params ["_caller", "_target"];
	
	private _blindfolds = ["AXE_Blindfold_Black", "AXE_Blindfold_White", "AXE_Blindfold_White_Blood"];
	private _googles = (goggles _target);
	if !(_googles in _blindfolds) exitWith {};
	
	if (_caller == _target) then {
		[_caller, "Gear"] call ACE_common_fnc_doGesture;
	} else {
		[_caller, "PutDown"] call ACE_common_fnc_doGesture;
	};
	sleep 0.8;
	
	removeGoggles _target;
	[_caller, _googles, 1, [1,2,3], true] call AXE_fnc_addItem;
	
	if (_caller == _target) then {
		[_caller, "Stand"] call ACE_common_fnc_doGesture;
	};
	
};
