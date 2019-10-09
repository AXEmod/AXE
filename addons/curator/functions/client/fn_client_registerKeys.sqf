#include "\a3\ui_f\hpp\defineDIKCodes.inc"
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
// KEY: ZEUS JUMP TO

[
	"STR_AXE_Curator_CBA_Category", 
	"AXE_Curator_KEY_JumpToAim", 
	["STR_AXE_Curator_KEY_JumpToAim_Title", "STR_AXE_Curator_KEY_JumpToAim_Tip"], 
	{
		
		if ((visibleMap) || (vehicle player != player)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			private _intersections = lineIntersectsWith [eyePos player, AGLtoASL screenToWorld [0.5,0.5], player, objNull, true];
			private _position = [0,0,0];
			
			if (count _intersections > 0) then {
				
				private _count = count _intersections;
				private _intersection = _intersections select (_count-1);
				
				if (_intersection isKindOf "House") then {
					_position = (getPos _intersection) findEmptyPosition [0, 30];
				} else {
					_position = (getPos _intersection) findEmptyPosition [0, 10];
				};
				
			} else {
				
				_position = (screenToWorld [0.5,0.5]);
				
			};
			
			if (!(_position isEqualTo []) && !(_position isEqualTo [0,0,0])) then {
				player setPos _position;
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
		
		if (visibleMap) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (Not isObjectHidden player) then {
				
				[player, true] remoteExecCall ["hideObjectGlobal", 2];
				player setCaptive true;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Invisible"];
				[_hint] call AXE_fnc_hint;
				
			} else {
				
				[player, false] remoteExecCall ["hideObjectGlobal", 2];
				player setCaptive false;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Visible"];
				[_hint] call AXE_fnc_hint;
				
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
		
		if ((visibleMap) || (vehicle player != player)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (isNull attachedTo player) then {
				
				if (Not isNull cursorObject) then {
					
					[player, cursorObject] call AXE_fnc_attachToRel;
					
					private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Attached"];
					[_hint] call AXE_fnc_hint;
					
				};
				
			} else {
				
				private _posOld = (getPos player);
				_posOld set [2, 0];
				
				private _posNew = _posOld findEmptyPosition [0, 30, (typeOf player)];
				
				if (!(_posNew isEqualTo [])) then {
					
					detach player;
					
					_posNew set [2, 0];
					player setPos _posNew;
					
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
		
		if (visibleMap) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if ((missionNamespace getVariable ["axe_curator_fps_inZeus", false]) && (isNull curatorCamera)) exitWith {
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
		
		if ((visibleMap) || (vehicle player != player)) exitWith {};
		if (
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) ||
			((missionNamespace getVariable ["axe_curator_keys_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
		) then {
			
			if (isPlayer cursorObject) then {
				
				["ACE_medical_treatmentAdvanced_fullHealLocal", [cursorObject, cursorObject], cursorObject] call CBA_fnc_targetEvent;
				
				private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Heal_Player"];
				[_hint] call AXE_fnc_hint;
				
			} else {
				
				["ACE_medical_treatmentAdvanced_fullHealLocal", [player, player], player] call CBA_fnc_targetEvent;
				missionNamespace setVariable ["ace_advanced_fatigue_anReserve", 2300];
				player setVariable ["acex_field_rations_thirst", 0];
				player setVariable ["acex_field_rations_hunger", 0];
				
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
		
		if ((visibleMap) || (vehicle player != player)) exitWith {};
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
							
							deleteVehicle cursorObject;
							
							private _hint = format [hint_tpl_liner_1, localize "STR_AXE_Curator_Hint_Object_Deleted"];
							[_hint] call AXE_fnc_hint;
							
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
