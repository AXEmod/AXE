/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_common\functions\common\fn_attachToRel.sqf
 *	by Ojemineh
 *	
 *	attach object relative to parent
 *	
 *	Arguments:
 *	0: object	- <OBJECT>
 *	1: parent	- <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, vehicle1] call AXE_fnc_attachToRel;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_object", "_parent"];

_object	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_parent	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitWith {};
if (isNull _parent) exitWith {};

// -------------------------------------------------------------------------------------------------

private _vectorDirAndUpRel = {
	
    private ["_o", "_p", "_v"];
	
    _o = _this select 0;
    _p = _this select 1;
	
    _v = _p worldToModelVisual [0,0,0];
	
    [
        _p worldToModelVisual vectorDirVisual _o vectorDiff _v,
        _p worldToModelVisual vectorUpVisual _o vectorDiff _v
    ]
	
};

private _vector = _this call _vectorDirAndUpRel;

_object attachTo [_parent];
_object setVectorDirAndUp _vector;
