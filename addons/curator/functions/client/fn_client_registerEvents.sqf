#include "\a3\ui_f\hpp\defineDIKCodes.inc"
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
// UPDATE: PLAYER FPS

private _fpsInterval = round (missionNamespace getVariable ["axe_curator_fps_interval", 3]);
if (_fpsInterval < 1) then {_fpsInterval = 1;};

[{
	
	player setVariable ["axe_current_fps", (round diag_fps), true];
	
}, _fpsInterval] call CBA_fnc_addPerFrameHandler;

// -------------------------------------------------------------------------------------------------
// DRAW3D: PLAYER FPS

addMissionEventHandler ["Draw3D", {
	
	if (AXE_CURATOR_SHOW_FPS) then {
		
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
					format ["%1 - %2", (name _x), (str _currentFPS)],
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
		
		private _callerName = [_caller] call ACE_common_fnc_getName;
		private _targetName = [_target] call ACE_common_fnc_getName;
		
		if (_caller isEqualTo _target) then {
			systemChat format [localize "STR_AXE_Curator_Module_Promoted_Player", _callerName, _targetName];
		} else {
			systemChat format [localize "STR_AXE_Curator_Module_Promoted_Target", _callerName, _targetName];
		};
		
		private _curatorKeyName = actionKeysNames "curatorInterface";
		systemChat format [localize "STR_AXE_Curator_Module_Open", _curatorKeyName];
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: END MISSION

[
	"axe_curator_endMission", 
	{
		
		params ["_endName", "_isVictory"];
		
		[_endName, _isVictory] call BIS_fnc_endMission;
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
