#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\client\fn_client_registerKeys.sqf
 *	by Ojemineh
 *	
 *	register client keys
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_client_registerKeys;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------
// KEY: JUMP TO AIM

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_JumpToAim", 
	["STR_AXE_Curator_KEY_JumpToAim_Title", "STR_AXE_Curator_KEY_JumpToAim_Tip"], 
	{
		
		if (!(isNull curatorCamera) || (visibleMap)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			private _posTarget = getPos player;
			private _intersections = [];
			
			if (vehicle player != player) then {
				_intersections = lineIntersectsWith [eyePos player, AGLtoASL screenToWorld [0.5, 0.5], player, (vehicle player), true];
			} else {
				_intersections = lineIntersectsWith [eyePos player, AGLtoASL screenToWorld [0.5, 0.5], player, objNull, true];
			};
			
			if (count _intersections > 0) then {
				private _object = _intersections select ((count _intersections)-1);
				private _objectDiameter = (sizeOf (typeOf _object)) / 2;
				private _objectRelDir = _object getDir player;
				_posTarget = [_object, _objectDiameter, _objectRelDir] call BIS_fnc_relPos;
			} else {
				_posTarget = screenToWorld [0.5, 0.5];
			};
			
			if ((player distance2d _posTarget) > 1000) then {
				private _relDir = player getDir _posTarget;
				_posTarget = [player, 1000, _relDir] call BIS_fnc_relPos;
			};
			
			_posTarget = _posTarget findEmptyPosition [0, 30, (typeOf player)];
			
			if (!(_posTarget isEqualTo [])) then {
				
				if (vehicle player != player) then {
					unassignVehicle player;
					moveOut player;
				};
				
				player setVelocity [0, 0, 0];
				player setPos [(_posTarget select 0), (_posTarget select 1), 0];
				
			};
			
		};
		
	}, 
	{}, 
	[DIK_NUMPAD0, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// KEY: JUMP TO PING

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_JumpToPing", 
	["STR_AXE_Curator_KEY_JumpToPing_Title", "STR_AXE_Curator_KEY_JumpToPing_Tip"], 
	{
		
		if (!(isNull curatorCamera) || (visibleMap)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (isNull AXE_CURATOR_PING_LASTUNIT) exitWith {};
			
			private _time = AXE_CURATOR_PING_LASTTIME;
			private _unit = AXE_CURATOR_PING_LASTUNIT;
			
			if (_time > (time - AXE_CURATOR_PING_MAXTIME)) then {
				
				private _unitPos = _unit modelToWorld [0, -2, 0];
				private _jumpPos = _unitPos findEmptyPosition [0, 20, (typeOf player)];
				if (!(_jumpPos isEqualTo [])) then {
					player setPos _jumpPos;
				};
				
			};
			
		};
		
	}, 
	{}, 
	[DIK_NUMPAD1, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// KEY: ZEUS HIDE/SHOW

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_HideZeus", 
	["STR_AXE_Curator_KEY_HideZeus_Title", "STR_AXE_Curator_KEY_HideZeus_Tip"], 
	{
		
		if (!(isNull curatorCamera) || (visibleMap)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (Not isObjectHidden player) then {
				
				[player, "blockDamage", "axe_curator_hidden", true] call ACE_common_fnc_statusEffect_set;
				
				[player, true] remoteExecCall ["hideObjectGlobal", 2];
				player setCaptive true;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Invisible"];
				[_hint] call AXE_fnc_hint;
				
				if (AXE_CURATOR_FOOTPRINT_HANDLER > -1) then {
					[AXE_CURATOR_FOOTPRINT_HANDLER] call CBA_fnc_removePerFrameHandler;
				};
				
				AXE_CURATOR_FOOTPRINT_HANDLER = [{
					
					params ["_params", "_pfhHandler"];
					
					if (isObjectHidden player) then {
						private _step = nearestObject [player, "#mark"];
						if !(isNull _step) then {
							if ((_step distance player) < 1) then {
								_step setPos [0,0,0];
							};
						};
					};
					
				}, 0, []] call CBA_fnc_addPerFrameHandler;
				
			} else {
				
				[player, false] remoteExecCall ["hideObjectGlobal", 2];
				player setCaptive false;
				
				[player, "blockDamage", "axe_curator_hidden", false] call ACE_common_fnc_statusEffect_set;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Visible"];
				[_hint] call AXE_fnc_hint;
				
				[AXE_CURATOR_FOOTPRINT_HANDLER] call CBA_fnc_removePerFrameHandler;
				AXE_CURATOR_FOOTPRINT_HANDLER = -1;
				
			};
			
		};
		
	}, 
	{}, 
	[DIK_NUMPAD2, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// KEY: ZEUS ATTACH TO

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_AttachTo", 
	["STR_AXE_Curator_KEY_AttachTo_Title", "STR_AXE_Curator_KEY_AttachTo_Tip"], 
	{
		
		if (!(isNull curatorCamera) || (visibleMap) || (vehicle player != player)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (isNull attachedTo player) then {
				
				if (Not isNull cursorObject) then {
					
					[player, "blockDamage", "axe_curator_attached", true] call ACE_common_fnc_statusEffect_set;
					
					[player, cursorObject] call AXE_fnc_attachToRel;
					
					private _name = "";
					if (isPlayer cursorObject) then {
						_name = format [hint_tpl_var_1, [cursorObject] call ACE_common_fnc_getName];
					} else {
						_name = format [hint_tpl_var_1, (typeOf cursorObject)];
					};
					private _text = format [localize "STR_AXE_Curator_Hint_Attached", _name];
					private _hint = format [hint_tpl_liner_1, _text];
					[_hint] call AXE_fnc_hint;
					
				};
				
			} else {
				
				private _posOld = (getPos player);
				_posOld set [2, 0];
				
				private _posNew = _posOld findEmptyPosition [0, 30, (typeOf player)];
				
				if (!(_posNew isEqualTo [])) then {
					
					_posNew set [2, 0];
					detach player;
					
					player setVelocity [0, 0, 0];
					player setPos _posNew;
					
					missionNamespace setVariable ["ace_advanced_fatigue_anReserve", 2300];
					
					[player, "blockDamage", "axe_curator_attached", false] call ACE_common_fnc_statusEffect_set;
					
					private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Detached"];
					[_hint] call AXE_fnc_hint;
					
				};
				
			};
			
		};
		
	}, 
	{}, 
	[DIK_NUMPAD3, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// KEY: PLAYER FPS

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_PlayerFPS", 
	["STR_AXE_Curator_KEY_PlayerFPS_Title", "STR_AXE_Curator_KEY_PlayerFPS_Tip"], 
	{
		
		if (!(isNull curatorCamera) || (visibleMap)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (missionNamespace getVariable ["axe_curator_fps_inZeus", false]) exitWith {
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_FPS_OnlyInZeus"];
				[_hint] call AXE_fnc_hint;
			};
			
			if (AXE_CURATOR_FPS_SHOW) then {
				
				AXE_CURATOR_FPS_SHOW = false;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_FPS_Hide"];
				[_hint] call AXE_fnc_hint;
				
			} else {
				
				AXE_CURATOR_FPS_SHOW = true;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_FPS_Show"];
				[_hint] call AXE_fnc_hint;
				
			};
			
		};
		
	}, 
	{}, 
	[DIK_NUMPAD4, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// KEY: PLEYER HEAL

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_HealPlayer", 
	["STR_AXE_Curator_KEY_HealPlayer_Title", "STR_AXE_Curator_KEY_HealPlayer_Tip"], 
	{
		
		if (!(isNull curatorCamera) || (visibleMap) || (vehicle player != player)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (isPlayer cursorObject) then {
				
				["axe_curator_playerHeal", [player, cursorObject], [cursorObject]] call CBA_fnc_targetEvent;
				
				private _name = format [hint_tpl_var_1, [cursorObject] call ACE_common_fnc_getName];
				private _text = format [localize "STR_AXE_Curator_Hint_Heal_Player", _name];
				private _hint = format [hint_tpl_liner_1, _text];
				[_hint] call AXE_fnc_hint;
				
			} else {
				
				["axe_curator_playerHeal", [player, player], [player]] call CBA_fnc_targetEvent;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Heal_Zeus"];
				[_hint] call AXE_fnc_hint;
				
			};
			
		};
		
	}, 
	{}, 
	[DIK_NUMPAD5, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// KEY: OBJECT DELETE

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_DeleteObject", 
	["STR_AXE_Curator_KEY_DeleteObject_Title", "STR_AXE_Curator_KEY_DeleteObject_Tip"], 
	{
		
		if (!(isNull curatorCamera) || (visibleMap) || (vehicle player != player)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (Not isNull cursorObject) then {
				if ((Not isPlayer cursorObject) && (cursorObject in (allMissionObjects ""))) then {
					
					[cursorObject] spawn {
						
						params ["_object"];
						
						private _result = [
							format [localize "STR_AXE_Curator_GUI_DeleteObject_Message", (typeOf _object)], 
							localize "STR_AXE_Curator_GUI_DeleteObject_Title", 
							localize "STR_AXE_Curator_GUI_DeleteObject_Yes", 
							localize "STR_AXE_Curator_GUI_DeleteObject_No"
						] call BIS_fnc_guiMessage;
						
						if (_result) then {
							
							deleteVehicle _object;
							
							private _name = format [hint_tpl_var_1, (typeOf _object)];
							private _text = format [localize "STR_AXE_Curator_Hint_Object_Deleted", _name];
							private _hint = format [hint_tpl_liner_1, _text];
							[_hint] call AXE_fnc_hint;
							
							private _callerType = ["Admin", "Zeus"] select !(isNull getAssignedCuratorLogic player);
							private _callerName = [player] call ACE_common_fnc_getName;
							[4, "%1 (%2) removed object '%3' at %4", [_callerType, _callerName, (typeOf _object), (getPos _object)], "curator"] call AXE_fnc_logServer;
							
						};
						
					};
					
				};
			};
			
		};
		
	}, 
	{}, 
	[DIK_NUMPAD9, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
