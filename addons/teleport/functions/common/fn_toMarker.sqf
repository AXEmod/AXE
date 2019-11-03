/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\common\fn_toMarker.sqf
 *	by Ojemineh
 *	
 *	teleport unit to a marker
 *	
 *	Arguments:
 *	0: unit		- <OBJECT>
 *	1: marker	- <STRING>
 *	2: message	- <STRING>
 *	3: blackout	- <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player, "marker1"] call AXE_teleport_fnc_toMarker;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_marker", "_message", "_blackout"];

_unit		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_marker		= [_this, 1, "", [""]] call BIS_fnc_param;
_message	= [_this, 2, "", [""]] call BIS_fnc_param;
_blackout	= [_this, 3, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (_marker isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

if (Not local _unit) exitWith {
	[_unit, _marker, _message, _blackout] remoteExecCall ["AXE_teleport_fnc_toMarker", _unit];
};

// -------------------------------------------------------------------------------------------------

private _markerPos = markerPos _marker;
private _markerDir = markerDir _marker;

[_unit, _markerPos, _markerDir, _message, _blackout] spawn {
	
	params ["_unit", "_markerPos", "_markerDir", "_message", "_blackout"];
	
	if (_unit getVariable ["AXE_Teleport_InProgress", false]) exitWith {
		private _hintInProgress = format [hint_tpl_liner_1, localize "STR_AXE_Teleport_Hint_InProgress"];
		[_hintInProgress, 2] call AXE_fnc_hint;
	};
	
	if (missionNamespace getVariable ["axe_teleport_safeMode", true]) then {
		[_unit, "blockDamage", "axe_teleport_toPos", true] call ACE_common_fnc_statusEffect_set;
	};
	
	if (visibleMap) then {openMap false;};
	closeDialog 0;
	disableUserInput true;
	
	_unit setVariable ["AXE_Teleport_InProgress", true, true];
	
	if (_blackout) then {
		999 cutText [_message, "BLACK OUT", 0.5];
	} else {
		999 cutText [_message, "BLACK FADED", 10];
	};
	
	uiSleep 2;
	
	_unit hideObjectGlobal true;
	
	waitUntil {if (preloadCamera (_markerPos)) exitWith {true}; false};
	
	private _success = false;
	
	if (vehicle _unit != _unit) then {
		unassignVehicle _unit;
		moveOut _unit;
	};
	
	private _pos = _markerPos findEmptyPosition [0, 30, (typeOf _unit)];
	if (!(_pos isEqualTo [])) then {
		_unit setDir _markerDir;
		_unit setPos _pos;
		_success = true;
	};
	
	uiSleep 0.5;
	
	999 cutText [_message, "BLACK IN", 1.0];
	
	_unit hideObjectGlobal false;
	
	disableUserInput false;
	
	[_unit, _success] spawn {
		
		params ["_unit", "_success"];
		
		if (missionNamespace getVariable ["axe_teleport_safeMode", true]) then {
			
			private _time = round (missionNamespace getVariable ["axe_teleport_safeTime", 5]);
			
			if (missionNamespace getVariable ["axe_teleport_safeInfo", true]) then {
				
				private _info = format [localize "STR_AXE_Teleport_Hint_SafeMode_Message", _time];
				
				[
					format [
						"<t color='#ff0000' size='1.2'>%1</t><br/><t color='#ff0000' size='0.7'>%2</t>", 
						toUpper (localize "STR_AXE_Teleport_Hint_SafeMode_Title"), 
						_info
					],
					-1, 
					-1, 
					_time, 
					0
				] spawn BIS_fnc_dynamicText;
				
			};
			
			uiSleep _time;
			
			[_unit, "blockDamage", "axe_teleport_toPos", false] call ACE_common_fnc_statusEffect_set;
			
		};
		
		_unit setVariable ["AXE_Teleport_InProgress", nil, true];
		
	};
	
	uiSleep 1;
	
	if (missionNamespace getVariable ["axe_teleport_hint", true]) then {
		if (_success) then {
			private _hintToPos = format [hint_tpl_liner_1, localize "STR_AXE_Teleport_Hint_toPos"];
			[_hintToPos, 0] call AXE_fnc_hint;
		} else {
			private _hintToPos = format [hint_tpl_liner_1, localize "STR_AXE_Teleport_Hint_Failure"];
			[_hintToPos, 2] call AXE_fnc_hint;
		};
	};
	
};
