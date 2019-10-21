/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_createLitterServer.sqf
 *	by Ojemineh
 *	
 *	create litter on ground
 *	
 *	Arguments:
 *	0: unit			- <OBJECT>
 *	1: className	- <STRING>
 *	2: offset		- <ARRAY>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "MedicalGarbage_01_FirstAidKit_F"] call AXE_fnc_createLitterServer;
 *	
 */

// -------------------------------------------------------------------------------------------------

if (!isServer) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_unit", "_className", "_offset"];

_unit		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_className	= [_this, 1, "", [""]] call BIS_fnc_param;
_offset		= [_this, 2, [], [[]]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (_className isEqualTo "") exitWith {};
if (_offset isEqualTo []) then {_offset = [0,0,0];};

if (Not (missionNamespace getVariable ["ace_medical_allowLitterCreation", false])) exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit, _className, _offset] spawn {
	
	params ["_unit", "_className", "_offset"];
	
	private _posASL = AGLtoASL (_unit modelToWorld _offset);
	private _litter = createSimpleObject [_className, _posASL];
	
	_litter setDir (random 360);
	
	if ([_unit] call AXE_fnc_isInBuilding) then {
		_litter setVectorUp [0,0,1];
	} else {
		_litter setVectorUp surfaceNormal position _litter;
	};
	
	private _delay = round (missionNamespace getVariable ["ace_medical_litterCleanUpDelay", 120]);
	
	[{deleteVehicle _this;}, _litter, _delay] call CBA_fnc_waitAndExecute;
	
};
