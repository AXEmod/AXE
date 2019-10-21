/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_addItem.sqf
 *	by Ojemineh
 *	
 *	add item to unit/vehicle
 *	
 *	Arguments:
 *	0: unit			- <OBJECT>
 *	1: item			- <STRING>
 *	2: amount		- <NUMBER>
 *	3: priority		- <ARRAY>	[0 = Uniform, 1 = Vest, 2 = Backpack]
 *	4: overflow		- <BOOLEAN>	[Default = true]
 *	
 *	Return:
 *	0: addToUnit	- <BOOLEAN>
 *	1: addToGround	- <BOOLEAN>
 *	
 *	Examples:
 *	[player, "ACE_EarPlugs", 1, [3,2,1], true] call AXE_fnc_addItem;
 *	[truck1, "ACE_EarPlugs", 1] call AXE_fnc_addItem;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_item", "_amount", "_priority", "_overflow"];

_unit		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_item		= [_this, 1, "", [""]] call BIS_fnc_param;
_amount		= [_this, 2, 1, [0]] call BIS_fnc_param;
_priority	= [_this, 3, [0], [[]]] call BIS_fnc_param;
_overflow	= [_this, 4, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {[false,false]};
if (_item isEqualTo "") exitWith {[false,false]};
if (_amount < 1) exitWith {[false,false]};

if (_priority isEqualTo []) then {_priority = [1,2,3];};

// -------------------------------------------------------------------------------------------------

private _added = false;
private _addToUnit = false;
private _addToGround = false;

for "_i" from 1 to _amount do {
	
	_added = false;
	
	// ADD TO CONTAINER
	{
		switch (_x) do {
			case 0: {
				if ( (_unit canAdd _item) && (!_added) ) then {
					_unit addItemCargoGlobal [_item, 1];
					_addToUnit = true;
					_added = true;
				};
			};
			case 1: {
				if ( (uniform _unit != "") && (_unit canAddItemToUniform _item) && (!_added) ) then {
					_unit addItemToUniform _item;
					_addToUnit = true;
					_added = true;
				};
			};
			case 2: {
				if ( (vest _unit != "") && (_unit canAddItemToVest _item) && (!_added) ) then {
					_unit addItemToVest _item;
					_addToUnit = true;
					_added = true;
				};
			};
			case 3: {
				if ( (backpack _unit != "") && (_unit canAddItemToBackpack _item) && (!_added) ) then {
					_unit addItemToBackpack _item;
					_addToUnit = true;
					_added = true;
				};
			};
			default {};
		};
	} forEach _priority;
	
	// IF CONTAINER IS FULL
	if ( (!_added) && (_overflow) ) then {
		
		if (vehicle _unit != _unit) exitWith {
			[_addToUnit, _addToGround]
		};
		if (
			(surfaceIsWater (position _unit)) && 
			(((getPosASL _unit)-(getPosATL _unit)) select 0 < -1.5)
		) exitWith {
			[_addToUnit, _addToGround]
		};
		
		private _gwh = nearestObject [_unit, "GroundWeaponHolder"];
		private _pos = [0,0,0];
		
		if ((isNull _gwh) || (_unit distance _gwh > 3)) then {
			
			_gwh = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "CAN_COLLIDE"];
			_pos = (getPosATL _unit) findEmptyPosition [0, 3, "GroundWeaponHolder"];
			
			if (_pos isEqualTo []) then {
				_pos = (getPosASL _unit);
			} else {
				_pos = (ATLtoASL _pos);
			};
			
			_gwh setPosASL _pos;
			
		};
		
		_gwh addItemCargoGlobal [_item, 1];
		_gwh setVectorUp surfaceNormal (position _gwh);
		
		_addToGround = true;
		
	};
	
};

[_addToUnit, _addToGround];