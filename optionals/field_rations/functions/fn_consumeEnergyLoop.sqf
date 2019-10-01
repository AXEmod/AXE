/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_field_rations\functions\fn_consumeEnergyLoop.sqf
 *	by Ojemineh
 *	
 *	energy drinks loop
 *	
 *	Arguments:
 *	0: unit - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_field_rations_fnc_consumeEnergyLoop;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if !(alive _unit) exitWith {};

if !(missionNamespace getVariable ["axe_field_rations_energy_enabled", false]) exitWith {};

private _heartRate = (_unit getVariable ["ace_medical_heartRate", 80]);
if ((axe_field_rations_energy_time <= 0) && (_heartRate <= 100)) exitWith {axe_field_rations_energy_loop = false;};

// -------------------------------------------------------------------------------------------------

axe_field_rations_energy_loop = true;

if (axe_field_rations_energy_time > 0) then {
	missionNamespace setVariable ["ace_advanced_fatigue_anReserve", AXE_FIELD_RATIONS_MAXRESERVE];
	axe_field_rations_energy_time = axe_field_rations_energy_time - 1;
};

if (_heartRate > 100) then {
	playSound "ACE_heartbeat_fast_2";
	enableCamShake true;
	setCamShakeParams [0, 0, 1, 0, true];
	addCamShake [1, 2, 3];
};

[AXE_field_rations_fnc_consumeEnergyLoop, [_unit], 1] call CBA_fnc_waitAndExecute;
