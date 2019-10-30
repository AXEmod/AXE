/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_modules\functions\sound\fn_moduleTriggerSound.sqf
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
 *	[] call AXE_fnc_moduleTriggerSound;
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
		private _offset				= _logic getVariable ["offset", []];
		private _sound				= _logic getVariable ["sound", ""];
		private _distance			= _logic getVariable ["distance", 100];
		private _maxDistance		= _logic getVariable ["maxdistance", -1];
		private _duration			= _logic getVariable ["duration", -1];
		private _ignoreStop			= _logic getVariable ["ignoreStop", false];
		private _loop				= _logic getVariable ["loop", false];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// VALIDATE OFFSET
		
		private _soundOffset = [];
		
		if (_offset isEqualTo "") then {_offset = "[]";};
		
		_soundOffset = call compile _offset;
		
		if (_soundOffset isEqualTo []) then {_soundOffset = [0,0,0];};
		
		if !((typeName _soundOffset) isEqualType "ARRAY") exitWith {
			[format [localize "STR_AXE_ModuleError_OffsetNotValid", _soundOffset]] call BIS_fnc_error;
		};
		
		if !((count _soundOffset) isEqualTo 3) exitWith {
			[format [localize "STR_AXE_ModuleError_OffsetNotValid", _soundOffset]] call BIS_fnc_error;
		};
		
		// VALIDATE SOURCE
		
		private _soundSource = objNull;
		
		if (_source != "") then {
			
			if (isNull (missionNamespace getVariable [_source, objNull])) exitWith {
				[format [localize "STR_AXE_ModuleError_VarIsUnknown", _source]] call BIS_fnc_error;
			};
			
			_soundSource = missionNamespace getVariable _source;
			
			if !((typeName _soundSource) isEqualType "OBJECT") exitWith {
				[format [localize "STR_AXE_ModuleError_IsNotObject", _soundSource]] call BIS_fnc_error;
			};
			
		} else {
			
			_soundSource = _logic;
			_soundOffset = [0,0,0];
			
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
		
		if (_isActivated) then {
			
			if (_enabled > 0) then {
				if (_loop) then {
					[_soundSource, _sound, _soundOffset, _distance, _maxDistance, _duration] call AXE_fnc_loop3dSound;
				} else {
					[_soundSource, _sound, _soundOffset, _distance, _maxDistance, _duration] call AXE_fnc_play3dSound;
				};
			};
			
		} else {
			
			if !(_ignoreStop) then {
				[_soundSource, _sound] call AXE_fnc_stop3dSound;
			};
			
		};
		
	};
	
	// ATTRIBUTES
	// =============================================================================================
	
	case "attributesChanged3DEN": {
		
		private _logic				= _input param [0, objNull, [objNull]];
		
		private _enabled			= _logic getVariable ["enabled", 0];
		private _source				= _logic getVariable ["source", ""];
		private _offset				= _logic getVariable ["offset", []];
		private _sound				= _logic getVariable ["sound", ""];
		private _distance			= _logic getVariable ["distance", 100];
		private _maxDistance		= _logic getVariable ["maxdistance", -1];
		private _duration			= _logic getVariable ["duration", -1];
		private _ignoreStop			= _logic getVariable ["ignoreStop", false];
		private _loop				= _logic getVariable ["loop", false];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// OFFSET
		
		private _soundOffset = [];
		
		if (_offset isEqualTo "") then {_offset = "[]";};
		
		_soundOffset = call compile _offset;
		
		if (_soundOffset isEqualTo []) then {_soundOffset = [0,0,0];};
		
		if !((typeName _soundOffset) isEqualType "ARRAY") exitWith {
			[format [localize "STR_AXE_ModuleError_OffsetNotValid", _soundOffset]] call BIS_fnc_error;
		};
		
		if !((count _soundOffset) isEqualTo 3) exitWith {
			[format [localize "STR_AXE_ModuleError_OffsetNotValid", _soundOffset]] call BIS_fnc_error;
		};
		
		// CLASSNAME
		
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
		
		// DISTANCE
		
		if (_distance <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]] call BIS_fnc_error;
		};
		
		// MAX DISTANCE
		
		if ((_maxDistance > 0) && (_maxDistance <= _distance)) exitWith {
			[format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance]] call BIS_fnc_error;
		};
		
		// DURATION
		
		if (_duration <= 0) then {_duration = [_sound] call AXE_fnc_getSoundDuration;};
		if (_duration <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]] call BIS_fnc_error;
		};
		
	};
	
};
