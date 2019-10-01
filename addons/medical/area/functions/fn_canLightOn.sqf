/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\area\functions\fn_canLightOn.sqf
 *	by Ojemineh
 *	
 *	check if light can be switched on
 *	
 *	Arguments:
 *	0: area - <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[area1] call AXE_medical_area_fnc_canLightOn;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_area"];

_area = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _area) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _return = false;

_return = (
	!(_area getVariable ["AXE_MedicalArea_LightOnInProgress", false]) && 
	((_area getVariable ["AXE_MedicalArea_Lights", []]) isEqualTo [])
);

_return