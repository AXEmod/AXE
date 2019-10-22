/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\client\fn_client_registerModules.sqf
 *	by Ojemineh
 *	
 *	register client modules
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_client_registerModules;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};
if !(["achilles_functions_f_ares"] call AXE_fnc_isAddon) exitWith {};

// -------------------------------------------------------------------------------------------------
// MODULE: ZEUS TELEPORT

[
	localize "STR_AMAE_ZEUS", 
	localize "STR_AXE_Curator_Module_ZeusTeleport", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (vehicle player != player) then {
			unassignVehicle player;
			moveOut player;
		};
		
		player setVelocity [0, 0, 0];
		player setPos _position;
		
		[objNull, format [localize "STR_AXE_Curator_MMSG_Zeus_Teleported"]] call BIS_fnc_showCuratorFeedbackMessage;
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: ZEUS TELEPORT TO CAMERA

[
	localize "STR_AMAE_ZEUS", 
	localize "STR_AXE_Curator_Module_ZeusTeleportToCam", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (vehicle player != player) then {
			unassignVehicle player;
			moveOut player;
		};
		
		private _posASL = AGLtoASL (positionCameraToWorld [0,0,1]);
		player setVelocity [0, 0, 0];
		player setPosASL _posASL;
		
		[objNull, format [localize "STR_AXE_Curator_MMSG_Zeus_Teleported"]] call BIS_fnc_showCuratorFeedbackMessage;
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: ZEUS HIDE/SHOW

[
	localize "STR_AMAE_ZEUS", 
	localize "STR_AXE_Curator_Module_ZeusVisible", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (Not isObjectHidden player) then {
			[player, "blockDamage", "axe_curator_hidden", true] call ACE_common_fnc_statusEffect_set;
			[player, true] remoteExecCall ["hideObjectGlobal", 2];
			player setCaptive true;
			[objNull, format [localize "STR_AXE_Curator_MMSG_Zeus_Invisible"]] call BIS_fnc_showCuratorFeedbackMessage;
		} else {
			[player, false] remoteExecCall ["hideObjectGlobal", 2];
			player setCaptive false;
			[player, "blockDamage", "axe_curator_hidden", false] call ACE_common_fnc_statusEffect_set;
			[objNull, format [localize "STR_AXE_Curator_MMSG_Zeus_Visible"]] call BIS_fnc_showCuratorFeedbackMessage;
		};
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: PLAYER FPS

[
	localize "STR_AMAE_PLAYERS", 
	localize "STR_AXE_Curator_Module_PlayerFPS", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (AXE_CURATOR_FPS_SHOW) then {
			AXE_CURATOR_FPS_SHOW = false;
			[objNull, format [localize "STR_AXE_Curator_MMSG_FPS_Hide"]] call BIS_fnc_showCuratorFeedbackMessage;
		} else {
			AXE_CURATOR_FPS_SHOW = true;
			[objNull, format [localize "STR_AXE_Curator_MMSG_FPS_Show"]] call BIS_fnc_showCuratorFeedbackMessage;
		};
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: PLAYER HEAL

[
	localize "STR_AMAE_PLAYERS", 
	localize "STR_AXE_Curator_Module_PlayerHeal", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (!(isNull _objectUnderCursor) && (isPlayer _objectUnderCursor)) then {
			["axe_curator_playerHeal", [player, _objectUnderCursor], [_objectUnderCursor]] call CBA_fnc_targetEvent;
			[objNull, format [localize "STR_AXE_Curator_MMSG_Heal_Player", [_objectUnderCursor] call ACE_common_fnc_getName]] call BIS_fnc_showCuratorFeedbackMessage;
		};
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: SHOW LAST PING

[
	localize "STR_AMAE_PLAYERS", 
	localize "STR_AXE_Curator_Module_ZeusToPing", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (isNull AXE_CURATOR_PING_LASTUNIT) exitWith {
			[objNull, format [localize "STR_AXE_Curator_MMSG_Ping_Failure"]] call BIS_fnc_showCuratorFeedbackMessage;
		};
		
		private _time = AXE_CURATOR_PING_LASTTIME;
		private _unit = AXE_CURATOR_PING_LASTUNIT;
		
		if (_time > (time - AXE_CURATOR_PING_MAXTIME)) then {
			private _cameraPos = _unit modelToWorld [0, 16, 8];
			[_cameraPos, _unit, 3] spawn BIS_fnc_setCuratorCamera;
			[objNull, format [localize "STR_AXE_Curator_MMSG_Ping_ShowUnit", [_unit] call ACE_common_fnc_getName]] call BIS_fnc_showCuratorFeedbackMessage;
		} else {
			[objNull, format [localize "STR_AXE_Curator_MMSG_Ping_Failure"]] call BIS_fnc_showCuratorFeedbackMessage;
		};
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
