/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\client\fn_client_registerEvents.sqf
 *	by Ojemineh
 *	
 *	register client events
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_client_registerEvents;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------
// EVENT: DRAW3D

addMissionEventHandler ["Draw3D", {
	
	private _zeusGUI = false;
	
	if (missionNamespace getVariable ["axe_curator_fps_inZeus", false]) then {
		_zeusGUI = !(isNull curatorCamera);
	} else {
		_zeusGUI = true;
	};
	
	if ((AXE_CURATOR_FPS_SHOW) && (_zeusGUI) && !(visibleMap) && !(dialog)) then {
		
		private _distanceMax = round (missionNamespace getVariable ["axe_curator_fps_distance", 300]);
		
		{
			
			private _distance = ((positionCameraToWorld [0,0,0]) distance _x);
			
			if (_distance <= _distanceMax) then {
				
				private _distanceFactor = (_distance / 3);
				private _currentFPS = _x getVariable ["axe_current_fps", 0];
				
				private _fontName = "EtelkaMonospacePro";
				private _fontSize = 0.028;
				private _alpha = linearConversion [0, _distanceMax, _distance, 1, 0.01, true];
				private _color = [1,1,1,_alpha];
				
				if (_currentFPS <= 30) then {_color = [1,1,0,_alpha];};
				if (_currentFPS <= 20) then {_color = [1,0,0,_alpha];};
				
				private _posBody = (_x modelToWorld (_x selectionPosition "body"));
				private _posLine = (getPosASL _x);
				_posLine set [2, (_posLine select 2) + ((2.5 * _distanceFactor) / 5) + 2.0  - (_fontSize * (3 * _distanceFactor))];
				
				drawLine3D [
					ASLtoAGL _posLine,
					_posBody,
					[0,0,0,_alpha]
				];
				
				private _pos = (getPosASL _x);
				_pos set [2, (_pos select 2) + ((2.5 * _distanceFactor) / 5) + 2.0];
				
				drawIcon3D [
					"",
					_color,
					ASLtoAGL _pos,
					1,
					1,
					0,
					format ["%1 [%2fps]", (name _x), (str _currentFPS)],
					2,
					_fontSize,
					_fontName,
					"center"
				];
				
			};
			
		} forEach (allPlayers - entities "HeadlessClient_F");
		
	};
	
}];

// -------------------------------------------------------------------------------------------------
// EVENT: MODULE CREATED

[
	"axe_curator_moduleCreated", 
	{
		
		params ["_caller", "_target"];
		
		AXE_CURATOR_PING_LASTTIME = 0;
		AXE_CURATOR_PING_LASTUNIT = objNull;
		
		private _callerName = [_caller] call ACE_common_fnc_getName;
		private _targetName = [_target] call ACE_common_fnc_getName;
		private _curatorKeyName = actionKeysNames "curatorInterface";
		
		if (_caller isEqualTo _target) then {
			systemChat format [localize "STR_AXE_Curator_Chat_Created_Player", _callerName, _targetName];
			systemChat format [localize "STR_AXE_Curator_Chat_Open_Interface", _curatorKeyName];
		} else {
			systemChat format [localize "STR_AXE_Curator_Chat_Created_Target", _callerName, _targetName];
			systemChat format [localize "STR_AXE_Curator_Chat_Open_Interface", _curatorKeyName];
		};
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: MODULE REMOVED

[
	"axe_curator_moduleRemoved", 
	{
		
		params ["_caller", "_target"];
		
		AXE_CURATOR_PING_LASTTIME = 0;
		AXE_CURATOR_PING_LASTUNIT = objNull;
		
		private _callerName = [_caller] call ACE_common_fnc_getName;
		private _targetName = [_target] call ACE_common_fnc_getName;
		
		if (_caller isEqualTo _target) then {
			systemChat format [localize "STR_AXE_Curator_Chat_Removed_Player", _callerName, _targetName];
		} else {
			systemChat format [localize "STR_AXE_Curator_Chat_Removed_Target", _callerName, _targetName];
		};
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: MODULE PING

[
	"axe_curator_modulePing", 
	{
		
		private _logic = getAssignedCuratorLogic player;
		if (isNull _logic) exitWith {};
		
		_logic addEventHandler ["CuratorPinged", {
			
			params ["_curator", "_unit"];
			
			private _timeout = AXE_CURATOR_PING_TIMEOUT;
			private _lastPing = _unit getVariable ["AXE_Curator_LastPing", (_timeout * (-1))];
			
			if (_lastPing < (time - _timeout)) then {
				
				_unit setVariable ["AXE_Curator_LastPing", time, true];
				AXE_CURATOR_PING_LASTTIME = time;
				AXE_CURATOR_PING_LASTUNIT = _unit;
				
				private _text = format [
					localize "STR_AXE_Curator_Hint_Ping_Message", 
					[_unit] call ACE_common_fnc_getName, 
					_unit
				];
				
				private _hint = format [hint_tpl_liner_1, _text];				
				[_hint, 1, 0] call AXE_fnc_hint;
				
			};
			
		}];
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: LOAD INTERFACE

[
	"Achilles_onLoadCuratorInterface", 
	{
		
		params ["_param"];
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: UNLOAD INTERFACE

[
	"Achilles_onUnloadCuratorInterface", 
	{
		
		params ["_param"];
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: PLAYER HEAL

[
	"axe_curator_playerHeal", 
	{
		
		params ["_caller", "_target"];
		
		if !(isPlayer _target) exitWith {};
		
		["ACE_medical_treatmentAdvanced_fullHealLocal", [_caller, _target], _target] call CBA_fnc_targetEvent;
		missionNamespace setVariable ["ace_advanced_fatigue_anReserve", 2300];
		
		player setVariable ["acex_field_rations_thirst", 0];
		player setVariable ["acex_field_rations_hunger", 0];
		
		private _callerType = ["Admin", "Zeus"] select !(isNull getAssignedCuratorLogic _caller);
		private _callerName = [_caller] call ACE_common_fnc_getName;
		private _targetName = [_target] call ACE_common_fnc_getName;
		
		[4, "%1 (%2) healed player '%3'", [_callerType, _callerName, _targetName], "curator"] call AXE_fnc_diagLogGlobal;
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: END MISSION

[
	"axe_curator_endMission", 
	{
		
		params ["_caller", "_endName", "_isVictory"];
		
		[_endName, _isVictory] call BIS_fnc_endMission;
		
		private _callerType = ["Admin", "Zeus"] select !(isNull getAssignedCuratorLogic _caller);
		
		if (_endName != "") then {
			[4, "%1 has finished the mission (victory=%2, class=%3)", [_callerType, _isVictory, _endName], "curator"] call AXE_fnc_logGlobal;
		} else {
			[4, "%1 has finished the mission (victory=%2)", [_callerType, _isVictory, ""], "curator"] call AXE_fnc_logGlobal;
		};
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
