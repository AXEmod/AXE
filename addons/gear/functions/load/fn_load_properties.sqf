/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_gear\functions\load\fn_load_properties.sqf
 *	by Ojemineh
 *	
 *	load properties
 *	
 *	Arguments:
 *	0: unit	- <OBJECT>
 *	1: role	- <STRING>
 *	2: type	- <STRING>
 *	3: team	- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "curator"] call AXE_gear_fnc_load_properties;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_role", "_type", "_team"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_role = [_this, 1, "", [""]] call BIS_fnc_param;
_type = [_this, 2, "", [""]] call BIS_fnc_param;
_team = [_this, 4, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

if (Not local _unit) exitWith {
	[_unit, _role, _type, _team] remoteExecCall ["AXE_gear_fnc_load_properties", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_LOADOUT_PATH;
private _default_role = GEAR_DEFAULT_ROLE;
private _default_type = GEAR_DEFAULT_TYPE;
private _default_team = GEAR_DEFAULT_TEAM;

private _gear_role = toUpper( _unit getVariable ["gear_role", _default_role] );
private _gear_type = toUpper( _unit getVariable ["gear_type", _default_type] );
private _gear_team = toUpper( _unit getVariable ["gear_team", _default_team] );

if (_role isEqualTo "") then { _role = _gear_role; };
if (_type isEqualTo "") then { _type = _gear_type; };
if (_team isEqualTo "") then { _team = _gear_team; };

// -------------------------------------------------------------------------------------------------

private _file = format ["%1\%2\%3\%4\properties.hpp", _loadout_path, _team, _role, _type];
private _data = [] call compile preprocessFileLineNumbers _file;

private _data_insignia	= (_data select 0);
private _data_rank		= (_data select 1);
private _data_medic		= (_data select 2);
private _data_engineer	= (_data select 3);
private _data_eod		= (_data select 4);
private _data_safety	= (_data select 5);

// -------------------------------------------------------------------------------------------------

// INSIGNIA
if (_data_insignia != "") then {
	[_unit, ""] call BIS_fnc_setUnitInsignia;
	[_unit, _data_insignia] call BIS_fnc_setUnitInsignia;
};

// -------------------------------------------------------------------------------------------------

// RANK (PRIVATE, CORPORAL, SERGEANT, LIEUTENANT, CAPTAIN, MAJOR, COLONEL)
if (_data_rank != "") then {
	_unit setUnitRank _data_rank;
};

// -------------------------------------------------------------------------------------------------

// MEDIC (0-2)
if (_data_medic > -1) then {
	if (_data_medic > 0) then {
		_unit setUnitTrait ["medic", 1];
		_unit setVariable ["ACE_medical_medicClass", _data_medic, true];
	} else {
		_unit setUnitTrait ["medic", 0];
		_unit setVariable ["ACE_medical_medicClass", 0, true];
	};
};

// ENGINEER (0-2)
if (_data_engineer > -1) then {
	if (_data_engineer > 0) then {
		_unit setUnitTrait ["engineer", 1];
		_unit setVariable ["ACE_isEngineer", _data_engineer, true];
	} else {
		_unit setUnitTrait ["engineer", 0];
		_unit setVariable ["ACE_isEngineer", 0, true];
	};
};

// EOD (0-1)
if (_data_eod > -1) then {
	if (_data_eod isEqualTo 1) then {
		_unit setUnitTrait ["explosiveSpecialist", 1];
		_unit setVariable  ["ACE_isEOD", true, true];
	} else {
		_unit setUnitTrait ["explosiveSpecialist", 0];
		_unit setVariable  ["ACE_isEOD", false, true];
	};
};

// -------------------------------------------------------------------------------------------------

// WEAPON SAFETY
if (count _data_safety > 0) then {
	
	private _safety_primary = (_data_safety select 0);
	if (_safety_primary > 0) then {
		[_unit, (primaryWeapon _unit), (primaryWeapon _unit), false] call AXE_fnc_weaponLock;
	};
	
	private _safety_secondary = (_data_safety select 1);
	if (_safety_secondary > 0) then {
		[_unit, (secondaryWeapon _unit), (secondaryWeapon _unit), false] call AXE_fnc_weaponLock;
	};
	
	private _safety_handgun = (_data_safety select 2);
	if (_safety_handgun > 0) then {
		[_unit, (handgunWeapon _unit), (handgunWeapon _unit), false] call AXE_fnc_weaponLock;
	};
	
};

// -------------------------------------------------------------------------------------------------
