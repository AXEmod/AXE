/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_gear\functions\load\fn_load_loadout.sqf
 *	by Ojemineh
 *	
 *	load loadout
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
 *	[player, "curator"] call AXE_gear_fnc_load_loadout;
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
	[_unit, _role, _type, _team] remoteExecCall ["AXE_gear_fnc_load_loadout", _unit];
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

private _file = format ["%1\%2\%3\%4\loadout.hpp", _loadout_path, _team, _role, _type];
private _data = [] call compile preprocessFileLineNumbers _file;

if (isNil "_data") exitWith {[4, "Can't read unit-loadout from file (%1)", [_file], "gear"] call AXE_fnc_log;};
[5, "'%1' loading gear '%2' (File: %3) - Data: %4", [_unit, _role, _file, _data], "gear"] call AXE_fnc_diagLog;

// -------------------------------------------------------------------------------------------------

_unit setUnitLoadout [_data, false];

// -------------------------------------------------------------------------------------------------
// LOAD PLAYERS DEFAULT GOGGLES

if (GEAR_KEEP_GOGGLES) then {
	private _unit_goggles = _unit getVariable ["axe_gear_goggles", ""];
	if (_unit_goggles != "") then {
		if ((goggles _unit) != "") then {removeGoggles _unit;};
		_unit addGoggles _unit_goggles;
		_unit setVariable ["axe_gear_goggles", nil];
	};
};

// -------------------------------------------------------------------------------------------------
/*
private _data_primary	= (_data select 0);
private _data_secondary	= (_data select 1);
private _data_handgun	= (_data select 2);
private _data_uniform	= (_data select 3);
private _data_vest		= (_data select 4);
private _data_backpack	= (_data select 5);
private _data_headgear	= (_data select 6);
private _data_goggles	= (_data select 7);
private _data_binocular	= (_data select 8);
private _data_items		= (_data select 9);

// -------------------------------------------------------------------------------------------------

// PRIMARY
if (count _data_primary > 0) then {
	
	private _primary = (_data_primary select 0);
	if (_primary != "") then { _unit addWeapon _primary; };
	
	private _primary_items = +_data_primary;
	_primary_items deleteAt 0;
	
	if ((primaryWeapon _unit != "") && (count _primary_items > 0)) then {
		{
			if (_x isEqualType []) then {
				if (count _x > 0) then {
					_unit addPrimaryWeaponItem (_x select 0);
				};
			} else {
				if (_x != "") then {
					_unit addPrimaryWeaponItem _x;
				};
			};
		} forEach _primary_items;
	};
	
};

// SECONDARY
if (count _data_secondary > 0) then {
	
	private _secondary = (_data_secondary select 0);
	if (_secondary != "") then { _unit addWeapon _secondary; };
	
	private _secondary_items = +_data_secondary;
	_secondary_items deleteAt 0;
	
	if ((secondaryWeapon _unit != "") && (count _secondary_items > 0)) then {
		{
			if (_x isEqualType []) then {
				if (count _x > 0) then {
					_unit addSecondaryWeaponItem (_x select 0);
				};
			} else {
				if (_x != "") then {
					_unit addSecondaryWeaponItem _x;
				};
			};
		} forEach _secondary_items;
	};
	
};

// HANDGUN
if (count _data_handgun > 0) then {
	
	private _handgun = (_data_handgun select 0);
	if (_handgun != "") then { _unit addWeapon _handgun; };
	
	private _handgun_items = +_data_handgun;
	_handgun_items deleteAt 0;
	
	if ((handgunWeapon _unit != "") && (count _handgun_items > 0)) then {
		{
			if (_x isEqualType []) then {
				if (count _x > 0) then {
					_unit addHandgunItem (_x select 0);
				};
			} else {
				if (_x != "") then {
					_unit addHandgunItem _x;
				};
			};
		} forEach _handgun_items;
	};
	
};

// -------------------------------------------------------------------------------------------------

// UNIFORM
if (count _data_uniform > 0) then {
	
	private _uniform = (_data_uniform select 0);
	if (_uniform != "") then { _unit forceAddUniform _uniform; };
	
	private _uniform_items = (_data_uniform select 1);
	
	if ((uniform _unit != "") && (count _uniform_items > 0)) then {
		{
			private _item = (_x select 0); 
			private _quantity = (_x select 1);
			if (_quantity > 0) then {
				for "_i" from 1 to _quantity do {
					if (_unit canAddItemToUniform _item) then {
						_unit addItemToUniform _item;
					};
				};
			};
		} forEach _uniform_items;
	};
	
};

// VEST
if (count _data_vest > 0) then {
	
	private _vest = (_data_vest select 0);
	if (_vest != "") then { _unit addVest _vest; };
	
	private _vest_items = (_data_vest select 1);
	
	if ((vest _unit != "") && (count _vest_items > 0)) then {
		{
			private _item = (_x select 0); 
			private _quantity = (_x select 1);
			if (_quantity > 0) then {
				for "_i" from 1 to _quantity do {
					if (_unit canAddItemToVest _item) then {
						_unit addItemToVest _item;
					};
				};
			};
		} forEach _vest_items;
	};
	
};

// BACKPACK
if (count _data_backpack > 0) then {
	
	private _backpack = (_data_backpack select 0);
	if (_backpack != "") then { _unit addBackpack _backpack; };
	
	private _backpack_items = (_data_backpack select 1);
	
	if ((backpack _unit != "") && (count _backpack_items > 0)) then {
		{
			private _item = (_x select 0); 
			private _quantity = (_x select 1);
			if (_quantity > 0) then {
				for "_i" from 1 to _quantity do {
					if (_unit canAddItemToBackpack _item) then {
						_unit addItemToBackpack _item;
					};
				};
			};
		} forEach _backpack_items;
	};
	
};

// -------------------------------------------------------------------------------------------------

// HEADGEAR
private _headgear = _data_headgear;
if (_headgear != "") then { _unit addHeadgear _headgear; };

// GOOGLES
private _goggles = _data_goggles;
if (_goggles != "") then { _unit addGoggles _goggles; };

// BINOCULAR
if (count _data_binocular > 0) then {
	
	private _binocular = (_data_binocular select 0);
	if (_binocular != "") then { _unit addWeapon _binocular; };
	
	private _binocular_items = +_data_binocular;
	_binocular_items deleteAt 0;
	
	if ((_binocular != "") && (count _binocular_items > 0)) then {
		{
			if (_x isEqualType []) then {
				if (count _x > 0) then {
					_unit addWeaponItem [_binocular, (_x select 0), true] ;
				};
			} else {
				if (_x != "") then {
					_unit addWeaponItem [_binocular, _x, true] ;
				};
			};
		} forEach _binocular_items;
	};
	
};

// -------------------------------------------------------------------------------------------------

// ITEMS
if (count _data_items > 0) then {
	
	// MAP
	private _map = (_data_items select 0);
	if (_map != "") then { _unit linkItem _map; };
	
	// GPS
	private _gps = (_data_items select 1);
	if (_gps != "") then { _unit linkItem _gps; };
	
	// RADIO
	private _radio = (_data_items select 2);
	if (_radio != "") then { _unit linkItem _radio; };
	
	// COMPASS
	private _compass = (_data_items select 3);
	if (_compass != "") then { _unit linkItem _compass; };
	
	// WATCH
	private _watch = (_data_items select 4);
	if (_watch != "") then { _unit linkItem _watch; };
	
	// NVG
	private _nvg = (_data_items select 5);
	if (_nvg != "") then { _unit addWeapon _nvg; };
	
};

// -------------------------------------------------------------------------------------------------
*/
