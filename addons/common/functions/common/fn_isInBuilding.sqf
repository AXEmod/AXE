/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_isInBuilding.sqf
 *	by Ojemineh
 *	
 *	check if unit is in a building
 *	
 *	Arguments:
 *	0: unit - <OBJECT>
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[player] call AXE_fnc_isInBuilding;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

private _return = false;
private _building = nearestObject [_unit, "HouseBase"];

if (Not isNull _building) then {
	
	//private _boundingBox = boundingBox _building;
	private _boundingBox = 0 boundingBoxReal _building;
	private _min = (_boundingBox select 0);
	private _max = (_boundingBox select 1);
	
	private _relPos = _building worldToModel (getPosATL _unit);
	private _unitX = (_relPos select 0);
	private _unitY = (_relPos select 1);
	private _unitZ = (_relPos select 2);
	
	if ((_unitX > (_min select 0)) && (_unitX < (_max select 0))) then {
		if ((_unitY > (_min select 1)) && (_unitY < (_max select 1))) then {
			if ((_unitZ > (_min select 2)) && (_unitZ < (_max select 2))) then {
				_return = true;
			};
		};
	};
	
};

_return;