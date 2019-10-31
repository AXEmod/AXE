/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_modules\functions\speech\fn_moduleTriggerSpeech.sqf
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
 *	[] call AXE_fnc_moduleTriggerSpeech;
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
		private _loop				= _logic getVariable ["loop", false];
		private _ignoreStop			= _logic getVariable ["ignoreStop", false];
		private _animation			= _logic getVariable ["animation", ""];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// VALIDATE SOURCE
		
		if (_source isEqualTo "") exitWith {
			[format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]], "modules"] call AXE_fnc_log;
		};
		
		if (isNull (missionNamespace getVariable [_source, objNull])) exitWith {
			[format [localize "STR_AXE_ModuleError_VarIsUnknown", _source]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_VarIsUnknown", _source]], "modules"] call AXE_fnc_log;
		};
		
		private _unit = missionNamespace getVariable _source;
		
		if !(_unit isKindOf "Man") exitWith {
			[format [localize "STR_AXE_ModuleError_IsNotUnit", _unit]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_IsNotUnit", _unit]], "modules"] call AXE_fnc_log;
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
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnknownInCfgSounds", _sound]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DISTANCE
		
		if (_distance <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE MAX DISTANCE
		
		if ((_maxDistance > 0) && (_maxDistance <= _distance)) exitWith {
			[format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DURATION
		
		if (_duration <= 0) then {_duration = [_sound] call AXE_fnc_getSoundDuration;};
		if (_duration <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]], "modules"] call AXE_fnc_log;
		};
		
		// MODULE
		
		if (_isActivated) then {
			
			if (_loop) then {
				
				private _pfhHandler = [{
					
					params ["_params", "_pfhHandler"];
					_params params ["_logic", "_unit", "_sound", "_distance", "_maxDistance", "_duration", "_lastTimePlayed"];
					
					if (!alive _logic) exitWith {
						[_unit, _sound] call AXE_fnc_stop3dSound;
						[_pfhHandler] call CBA_fnc_removePerFrameHandler;
					};
					
					if ((_logic getVariable ["enabled", 0]) isEqualTo 0) exitWith {};
					
					if ((CBA_missionTime - _lastTimePlayed) >= _duration) then {
						
						private _allPlayers = (allPlayers - entities "HeadlessClient_F");
						if ((count _allPlayers) == 0) exitWith {};
						
						[_unit, _sound, _distance, _maxDistance, _duration] call AXE_fnc_speak3d;
						
						_params set [6, CBA_missionTime];
						
					};
					
				}, 0, [_logic, _unit, _sound, _distance, _maxDistance, _duration, (CBA_missionTime - _duration)]] call CBA_fnc_addPerFrameHandler;
				
				_logic setVariable ["axe_pfhHandler", _pfhHandler];
				
			} else {
				
				if (_enabled > 0) then {
					[_unit, _sound, _distance, _maxDistance, _duration] call AXE_fnc_speak3d;
				};
				
			};
			
			if (_animation != "") then {
				_unit setVariable ["axe_isAnimEnabled", (_unit checkAIFeature "ANIM")];
				_unit setVariable ["axe_isMoveEnabled", (_unit checkAIFeature "MOVE")];
				_unit setVariable ["axe_unitPosition",  (getPosASL _unit)];
				_unit setVariable ["axe_unitDirection", (getDir _unit)];
				_unit disableAI "ANIM";
				_unit disableAI "MOVE";
				[_unit, _animation] remoteExecCall ["switchMove", 0];
			};
			
		} else {
			
			if !(_ignoreStop) then {
				
				if (_loop) then {
					private _pfhHandler = _logic getVariable ["axe_pfhHandler", -1];
					if (_pfhHandler > -1) then {[_pfhHandler] call CBA_fnc_removePerFrameHandler;};
					_logic setVariable ["axe_pfhHandler", nil];
				};
				
				[_unit, _sound] call AXE_fnc_stop3dSound;
				
				if (_animation != "") then {
					private _isAnimEnabled = _unit getVariable ["axe_isAnimEnabled", true];
					private _isMoveEnabled = _unit getVariable ["axe_isMoveEnabled", true];
					private _unitPosition  = _unit getVariable ["axe_unitPosition",  (getPosASL _unit)];
					private _unitDirection = _unit getVariable ["axe_unitDirection", (getDir _unit)];
					[_unit, ""] remoteExecCall ["switchMove", 0];
					_unit setPosASL _unitPosition;
					_unit setDir _unitDirection;
					if (_isMoveEnabled) then {_unit enableAI "MOVE";} else {_unit disableAI "MOVE";};
					if (_isAnimEnabled) then {_unit enableAI "ANIM";} else {_unit disableAI "ANIM";};
				};
				
			};
			
		};
		
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
		private _loop				= _logic getVariable ["loop", false];
		private _ignoreStop			= _logic getVariable ["ignoreStop", false];
		private _animation			= _logic getVariable ["animation", ""];
		
		if ((_sound isEqualTo "") || (_sound isEqualTo "$NONE$")) exitWith {};
		
		// VALIDATE SOURCE
		
		if (_source isEqualTo "") exitWith {
			[format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnitIsEmpty", _source]], "modules"] call AXE_fnc_log;
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
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_UnknownInCfgSounds", _sound]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DISTANCE
		
		if (_distance <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DistanceGreaterZero", _distance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE MAX DISTANCE
		
		if ((_maxDistance > 0) && (_maxDistance <= _distance)) exitWith {
			[format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_MaxGreaterDistance", _distance, _maxDistance]], "modules"] call AXE_fnc_log;
		};
		
		// VALIDATE DURATION
		
		if (_duration <= 0) then {_duration = [_sound] call AXE_fnc_getSoundDuration;};
		if (_duration <= 0) exitWith {
			[format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]] call BIS_fnc_error;
			[2, "ModuleTriggerpeech '%1' - %2", [_logic, format [localize "STR_AXE_ModuleError_DurationNotDefined", _sound]], "modules"] call AXE_fnc_log;
		};
		
	};
	
};
