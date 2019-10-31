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

private ["_logic", "_caller", "_target"];

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
private _reaction		= _logic getVariable ["reaction", 0];
private _animation		= _logic getVariable ["animation", ""];
private _codeStart		= _logic getVariable ["codeStart", ""];
private _codeEnd		= _logic getVariable ["codeEnd", ""];

// -------------------------------------------------------------------------------------------------

_codeStart = [_codeStart] call CBA_fnc_trim;
_codeEnd = [_codeEnd] call CBA_fnc_trim;

// -------------------------------------------------------------------------------------------------

[_logic, _caller, _target, _source, _sound, _distance, _maxDistance, _duration, _onlyOnce, _reaction, _animation, _codeStart, _codeEnd] spawn {
	
	params ["_logic", "_caller", "_target", "_source", "_sound", "_distance", "_maxDistance", "_duration", "_onlyOnce", "_reaction", "_animation", "_codeStart", "_codeEnd"];
	
	if (_onlyOnce) then {_target setVariable ["axe_playedOnce", true, true];};
	
	[_target, _target, true] call ACE_common_fnc_claim;
	
	private _isAnimEnabled = _target checkAIFeature "ANIM";
	private _isMoveEnabled = _target checkAIFeature "MOVE";
	private _isPathEnabled = _target checkAIFeature "PATH";
	private _unitPosition  = getPosASL _target;
	private _unitDirection = getDir _target;
	
	[_target, [_caller, 4]] remoteExecCall ["reveal", 0];
	[_caller, [_target, 4]] remoteExecCall ["reveal", 0];
	
	if (_reaction > 0) then {
		switch (_reaction) do {
			case 1: {
				_target disableAI "PATH";
				_target doWatch _caller;
			};
			case 2: {
				//_target disableAI "MOVE";
				//_target setDir (_target getDir _caller);
				_target disableAI "PATH";
				_target doWatch (ASLtoAGL (eyePos _caller));
			};
			case 3: {
				if (_animation != "") then {
					_target disableAI "ANIM";
					_target disableAI "MOVE";
					[_target, _animation] remoteExecCall ["switchMove", 0];
				};
			};
			default {};
		};
	};
	
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
	
	if (_reaction > 0) then {
		switch (_reaction) do {
			case 1: {
				_target doWatch objNull;
				if (_isPathEnabled) then {_target enableAI "PATH";} else {_target disableAI "PATH";};
			};
			case 2: {
				//_target setDir _unitDirection;
				//if (_isMoveEnabled) then {_target enableAI "MOVE";} else {_target disableAI "MOVE";};
				_target doWatch objNull;
				if (_isPathEnabled) then {_target enableAI "PATH";} else {_target disableAI "PATH";};
			};
			case 3: {
				if (_animation != "") then {
					[_target, ""] remoteExecCall ["switchMove", 0];
					_target setPosASL _unitPosition;
					_target setDir _unitDirection;
					if (_isMoveEnabled) then {_target enableAI "MOVE";} else {_target disableAI "MOVE";};
					if (_isAnimEnabled) then {_target enableAI "ANIM";} else {_target disableAI "ANIM";};
				};
			};
			default {};
		};
	};
	
	if (_codeEnd != "") then {
		[_logic, _caller, _target, _codeEnd] spawn {
			params ["_logic", "_caller", "_target", "_codeEnd"];
			private _codeParams = "params ['_logic', '_caller', '_target']; ";
			private _func = compile (_codeParams + _codeEnd);
			[_logic, _caller, _target] call _func;
		};
	};
	
	[objNull, _target, false] call ACE_common_fnc_claim;
	
};
