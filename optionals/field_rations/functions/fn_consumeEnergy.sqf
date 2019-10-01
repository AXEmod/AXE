/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\fn_consumeEnergy.sqf
 *	by Ojemineh
 *	
 *	consume energy drinks (red gull)
 *	
 *	Arguments:
 *	0: unit		- <OBJECT>
 *	1: item		- <STRING>
 *	2: value	- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "ACE_Can_RedGull", 10] call AXE_field_rations_fnc_consumeEnergy;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_item", "_value"];

_unit	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_item	= [_this, 1, "", [""]] call BIS_fnc_param;
_value	= [_this, 2, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (_item isEqualTo "") exitWith {};

if !(missionNamespace getVariable ["axe_field_rations_energy_enabled", false]) exitWith {};

// -------------------------------------------------------------------------------------------------

if (isNil "axe_field_rations_energy_loop") then {axe_field_rations_energy_loop = false;};
if (isNil "axe_field_rations_energy_time") then {axe_field_rations_energy_time = 0;};

private _duration = round (missionNamespace getVariable ["axe_field_rations_energy_duration", 180]);
if (_duration < 30) then {_duration = 30;};

[_unit, 20, (_duration / 4), {}] call ACE_medical_fnc_addHeartRateAdjustment;

axe_field_rations_energy_time = axe_field_rations_energy_time + _duration;

if !(axe_field_rations_energy_loop) then {[_unit] call AXE_field_rations_fnc_consumeEnergyLoop;};
