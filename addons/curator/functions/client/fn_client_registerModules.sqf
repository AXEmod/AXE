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
		
		player setPos _position;
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
// MODULE: ZEUS TO PING

[
	localize "STR_AMAE_ZEUS", 
	localize "STR_AXE_Curator_Module_ZeusToPing", 
	{
		
		params [
			["_position", [0,0,0], [[]], 3], 
			["_objectUnderCursor", objNull, [objNull]]
		];
		
		if (isNull AXE_CURATOR_PING_LASTUNIT) exitWith {};
		
		private _time = AXE_CURATOR_PING_LASTTIME;
		private _unit = AXE_CURATOR_PING_LASTUNIT;
		
		if (_time > (time - 300)) then {
			private _cameraPos = _unit modelToWorld [0, 10, 5];
			[_cameraPos, _unit, 3] spawn BIS_fnc_setCuratorCamera;
		};
		
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
		} else {
			[player, false] remoteExecCall ["hideObjectGlobal", 2];
			player setCaptive false;
			[player, "blockDamage", "axe_curator_hidden", false] call ACE_common_fnc_statusEffect_set;
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
		} else {
			AXE_CURATOR_FPS_SHOW = true;
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
		};
		
	}
] call Ares_fnc_RegisterCustomModule;

// -------------------------------------------------------------------------------------------------
