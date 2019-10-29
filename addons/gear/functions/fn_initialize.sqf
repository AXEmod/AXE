/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_gear\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize gear addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_gear_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["axe_gear"] call AXE_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "gear"] call AXE_fnc_log;

// -------------------------------------------------------------------------------------------------

if (isNil "GEAR_LOADOUT_PATH") then { GEAR_LOADOUT_PATH = "loadout"; };
if (isNil "GEAR_DEFAULT_TEAM") then { GEAR_DEFAULT_TEAM = "blufor"; };
if (isNil "GEAR_DEFAULT_ROLE") then { GEAR_DEFAULT_ROLE = "rifle"; };
if (isNil "GEAR_DEFAULT_TYPE") then { GEAR_DEFAULT_TYPE = "0"; };

if (isNil "GEAR_KEEP_GOGGLES") then { GEAR_KEEP_GOGGLES = true; };

// -------------------------------------------------------------------------------------------------
// EVENTHANDLER

[] spawn {
	
	waitUntil {if (!isNull (findDisplay 46)) exitWith {true}; false};
	waitUntil {if ((!isNull player) && (time > 1)) exitWith {true}; false};
	
	if (player in entities "HeadlessClient_F") exitWith {};
	
	player addEventHandler ["Respawn", {
		
		params ["_unit", "_corpse"];
		
		private _insignia = [_unit] call AXE_fnc_getUnitInsignia;
		if (_insignia != "") then {[_unit, _insignia] call AXE_fnc_setUnitInsignia;};
		
		false;
	}];
	
	player addEventHandler ["Take", {
		
		params ["_unit", "_container", "_item"];
		
		private _insignia = [_unit] call AXE_fnc_getUnitInsignia;
		if (_insignia != "") then {[_unit, _insignia] call AXE_fnc_setUnitInsignia;};
		
		false;
	}];
	
	player addEventHandler ["InventoryClosed", {
		
		params ["_unit", "_container"];
		
		private _insignia = [_unit] call AXE_fnc_getUnitInsignia;
		if (_insignia != "") then {[_unit, _insignia] call AXE_fnc_setUnitInsignia;};
		
		false;
	}];
	
};

// -------------------------------------------------------------------------------------------------
