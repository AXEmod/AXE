/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_modules\functions\speech\fn_moduleGlobalSpeech.sqf
 *	by Ojemineh
 *	
 *	module function
 *	
 *	Arguments:
 *	0: mode		- <STRING>
 *	1: input	- <ARRAY>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_fnc_moduleGlobalSpeech;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_mode", "_input"];

_mode	= param [0, "", [""]];
_input	= param [1, [], [[]]];

// -------------------------------------------------------------------------------------------------

switch _mode do {
	
	// INITIALIZE
	// =============================================================================================
	
	case "init": {
		
		private _logic				= _input param [0, objNull, [objNull]];
		private _isActivated		= _input param [1, true, [true]];
		private _isCuratorPlaced	= _input param [2, false, [true]];
		
		private _enabled			= _logic getVariable ["enabled", 0];
		private _source				= _logic getVariable ["source", ""];
		private _sound				= _logic getVariable ["sound", ""];
		private _distance			= _logic getVariable ["distance", 30];
		private _maxDistance		= _logic getVariable ["maxDistance", -1];
		private _duration			= _logic getVariable ["duration", -1];
		private _onlyOnce			= _logic getVariable ["onlyOnce", false];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// VALIDATE SOURCE
		
		if (_source isEqualTo "") exitWith {};
		
		if (isNull (missionNamespace getVariable [_source, objNull])) exitWith {
			[format [localize "STR_AXE_ModuleError_VarIsUnknown", _source]] call BIS_fnc_error;
		};
		
		private _unit = missionNamespace getVariable _source;
		
		if !(_unit isKindOf "Man") exitWith {
			[format [localize "STR_AXE_ModuleError_IsNotUnit", _unit]] call BIS_fnc_error;
		};
		
		// VALIDATE CLASSNAME
		
		private _soundExist = 0;
		
		if (isClass (missionConfigFile >> "CfgSounds" >> _sound)) then {
			_soundExist = 1;
		} else {
			if (isClass (configFile >> "CfgSounds" >> _sound)) then {
				_soundExist = 2;
			};
		};
		
		if (_soundExist isEqualTo 0) exitWith {
			[format [localize "STR_AXE_ModuleError_UnknownInCfgSounds", _sound]] call BIS_fnc_error;
		};
		
		// VALIDATE DISTANCE
		
		if (_distance <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]] call BIS_fnc_error;
		};
		
		// VALIDATE MAX DISTANCE
		
		if ((_maxDistance > 0) && (_maxDistance <= _distance)) exitWith {
			[format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance]] call BIS_fnc_error;
		};
		
		// VALIDATE DURATION
		
		if (_duration <= 0) then {_duration = [_sound] call AXE_fnc_getSoundDuration;};
		if (_duration <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]] call BIS_fnc_error;
		};
		
		// MODULE
		
		private _unitName = [_unit] call ACE_common_fnc_getName;
		private _holdText = format [localize "STR_AXE_Module_GlobalSpeech_HoldAction", _unitName];
		private _holdIcon = "\axe_modules\data\gui\holdAction_speech_ca.paa";
		
		[
			_unit,
			_holdText,
			_holdIcon,
			_holdIcon,
			"(_this distance _target < 2) && !(_target getVariable ['axe_speak3d', false]) && !(_target getVariable ['axe_playedOnce', false])",
			"(_caller distance _target < 2) && !(_target getVariable ['axe_speak3d', false]) && !(_target getVariable ['axe_playedOnce', false])",
			{},
			{},
			{
				params ["_target", "_caller", "_actionId", "_params"];
				if (((_params select 0) getVariable ["enabled", 0]) > 0) then {
					[(_params select 0), _caller, _target] remoteExecCall ["AXE_fnc_moduleGlobalSpeechPlay", _target];
				};
			},
			{},
			[_logic],
			1,
			999,
			false,
			false
		] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
		
	};
	
	// ATTRIBUTES
	// =============================================================================================
	
	case "attributesChanged3DEN": {
		
		private _logic				= _input param [0, objNull, [objNull]];
		
		private _enabled			= _logic getVariable ["enabled", 0];
		private _source				= _logic getVariable ["source", ""];
		private _sound				= _logic getVariable ["sound", ""];
		private _distance			= _logic getVariable ["distance", 30];
		private _maxDistance		= _logic getVariable ["maxDistance", -1];
		private _duration			= _logic getVariable ["duration", -1];
		private _onlyOnce			= _logic getVariable ["onlyOnce", false];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// VALIDATE CLASSNAME
		
		private _soundExist = 0;
		
		if (isClass (missionConfigFile >> "CfgSounds" >> _sound)) then {
			_soundExist = 1;
		} else {
			if (isClass (configFile >> "CfgSounds" >> _sound)) then {
				_soundExist = 2;
			};
		};
		
		if (_soundExist isEqualTo 0) exitWith {
			[format [localize "STR_AXE_ModuleError_UnknownInCfgSounds", _sound]] call BIS_fnc_error;
		};
		
		// VALIDATE DISTANCE
		
		if (_distance <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]] call BIS_fnc_error;
		};
		
		// VALIDATE MAX DISTANCE
		
		if ((_maxDistance > 0) && (_maxDistance <= _distance)) exitWith {
			[format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance]] call BIS_fnc_error;
		};
		
		// VALIDATE DURATION
		
		if (_duration <= 0) then {_duration = [_sound] call AXE_fnc_getSoundDuration;};
		if (_duration <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]] call BIS_fnc_error;
		};
		
	};
	
};
