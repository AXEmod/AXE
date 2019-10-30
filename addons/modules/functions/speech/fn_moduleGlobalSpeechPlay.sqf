/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_modules\functions\speech\fn_moduleGlobalSpeechPlay.sqf
 *	by Ojemineh
 *	
 *	module function
 *	
 *	Arguments:
 *	0: logic	- <OBJECT>
 *	1: caller	- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_fnc_moduleGlobalSpeechPlay;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_logic", "_caller"];

_logic	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_caller	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_target	= [_this, 2, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _logic) exitWith {};
if ((_logic getVariable ["enabled", 0]) isEqualTo 0) exitWith {};

if (isNull _caller) exitWith {};
if (isNull _target) exitWith {};

// -------------------------------------------------------------------------------------------------

private _source			= _logic getVariable ["source", ""];
private _sound			= _logic getVariable ["sound", ""];
private _distance		= _logic getVariable ["distance", 30];
private _maxDistance	= _logic getVariable ["maxDistance", -1];
private _duration		= _logic getVariable ["duration", -1];
private _onlyOnce		= _logic getVariable ["onlyOnce", false];
private _codeStart		= _logic getVariable ["codeStart", ""];
private _codeEnd		= _logic getVariable ["codeEnd", ""];

// -------------------------------------------------------------------------------------------------

_codeStart = [_codeStart] call CBA_fnc_trim;
_codeEnd = [_codeEnd] call CBA_fnc_trim;

// -------------------------------------------------------------------------------------------------

[_logic, _caller, _target, _source, _sound, _distance, _maxDistance, _duration, _onlyOnce, _codeStart, _codeEnd] spawn {
	
	params ["_logic", "_caller", "_target", "_source", "_sound", "_distance", "_maxDistance", "_duration", "_onlyOnce", "_codeStart", "_codeEnd"];
	
	if (_onlyOnce) then {_target setVariable ["axe_playedOnce", true, true];};
	
	[_target, _caller] remoteExecCall ["doWatch", _target];
	
	[_target, _sound, _distance, _maxDistance, _duration, 1, true] call AXE_fnc_speak3d;
	
	if (_codeStart != "") then {
		[_logic, _caller, _target, _codeStart] spawn {
			params ["_logic", "_caller", "_target", "_codeStart"];
			private _codeParams = "params ['_logic', '_caller', '_target']; ";
			private _func = compile (_codeParams + _codeStart);
			[_logic, _caller, _target] call _func;
		};
	};
	
	sleep 0.2;
	
	waitUntil {if (!(_target getVariable ["axe_speak3d", false])) exitWith {true}; false};
	
	[_target, objNull] remoteExecCall ["doWatch", _target];
	
	if (_codeEnd != "") then {
		[_logic, _caller, _target, _codeEnd] spawn {
			params ["_logic", "_caller", "_target", "_codeEnd"];
			private _codeParams = "params ['_logic', '_caller', '_target']; ";
			private _func = compile (_codeParams + _codeEnd);
			[_logic, _caller, _target] call _func;
		};
	};
	
};
