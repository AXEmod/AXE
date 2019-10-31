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
		private _reaction			= _logic getVariable ["reaction", 0];
		private _animation			= _logic getVariable ["animation", ""];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// VALIDATE SOURCE
		
		if (_source isEqualTo "") exitWith {
			[format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]], "modules"] call AXE_fnc_log;
		};
		
		if (isNull (missionNamespace getVariable [_source, objNull])) exitWith {
			[format [localize "STR_AXE_ModuleError_VarIsUnknown", _source]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_VarIsUnknown", _source]], "modules"] call AXE_fnc_log;
		};
		
		private _unit = missionNamespace getVariable _source;
		
		if !(_unit isKindOf "Man") exitWith {
			[format [localize "STR_AXE_ModuleError_IsNotUnit", _unit]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_IsNotUnit", _unit]], "modules"] call AXE_fnc_log;
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
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnknownInCfgSounds", _sound]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DISTANCE
		
		if (_distance <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE MAX DISTANCE
		
		if ((_maxDistance > 0) && (_maxDistance <= _distance)) exitWith {
			[format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DURATION
		
		if (_duration <= 0) then {_duration = [_sound] call AXE_fnc_getSoundDuration;};
		if (_duration <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE ANIMATION
		
		if ((_reaction > 2) && (_animation isEqualTo "")) exitWith {
			[format [localize "STR_AXE_ModuleError_AnimationEmpty", _reaction, _animation]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_AnimationEmpty", _reaction, _animation]], "modules"] call AXE_fnc_log;
		};
		
		// GLOBAL SPEECH MENU
		
		[_logic] remoteExec ["AXE_fnc_moduleGlobalSpeechMenu", 0, true];
		
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
		private _reaction			= _logic getVariable ["reaction", 0];
		private _animation			= _logic getVariable ["animation", ""];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// VALIDATE SOURCE
		
		if (_source isEqualTo "") exitWith {
			[format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]], "modules"] call AXE_fnc_log;
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
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnknownInCfgSounds", _sound]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DISTANCE
		
		if (_distance <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE MAX DISTANCE
		
		if ((_maxDistance > 0) && (_maxDistance <= _distance)) exitWith {
			[format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DURATION
		
		if (_duration <= 0) then {_duration = [_sound] call AXE_fnc_getSoundDuration;};
		if (_duration <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE ANIMATION
		
		if ((_reaction > 2) && (_animation isEqualTo "")) exitWith {
			[format [localize "STR_AXE_ModuleError_AnimationEmpty", _reaction, _animation]] call BIS_fnc_error;
			[2, "ModuleGlobalSpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_AnimationEmpty", _reaction, _animation]], "modules"] call AXE_fnc_log;
		};
		
	};
	
};
