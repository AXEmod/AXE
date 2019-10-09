/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_teleport\functions\common\fn_toGroup.sqf
 *	by Ojemineh
 *	
 *	teleport a unit to a group
 *	
 *	Arguments:
 *	0: unit		- <OBJECT>
 *	1: group	- <OBJECT>
 *	2: message	- <STRING>
 *	3: blackout	- <BOOLEAN>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player] call AXE_teleport_fnc_toGroup;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit", "_group", "_message", "_blackout"];

_unit		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_group		= [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;
_message	= [_this, 2, "", [""]] call BIS_fnc_param;
_blackout	= [_this, 3, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};
if (isNull _group) then {_group = group _unit;};

// -------------------------------------------------------------------------------------------------

[_unit, _group, _message, _blackout] spawn {
	
	params ["_unit", "_group", "_message", "_blackout"];
	
	if (_unit getVariable ["AXE_Teleport_InProgress", false]) exitWith {
		private _hintInProgress = format [hint_tpl_liner_2, toUpper(localize "STR_AXE_Teleport_Hint_Title"), localize "STR_AXE_Teleport_Hint_InProgress"];
		[_hintInProgress, 2] call AXE_fnc_hint;
	};
	
	if (count (units _group) < 1) exitWith {
		private _hintNoMembers = format [hint_tpl_liner_2, toUpper(localize "STR_AXE_Teleport_Hint_Title"), localize "STR_AXE_Teleport_Hint_NoMembers"];
		[_hintNoMembers, 2] call AXE_fnc_hint;
	};
	
	if (missionNamespace getVariable ["axe_teleport_safeMode", true]) then {
		_unit setVariable ["ACE_allowDamage", false, true];
		_unit allowDamage false;
	};
	
	_unit setVariable ["AXE_Teleport_InProgress", true, true];
	
	if (_blackout) then {
		999 cutText [_message, "BLACK OUT", 0.5];
	} else {
		999 cutText [_message, "BLACK FADED", 10];
	};
	
	uiSleep 2;
	
	_unit hideObjectGlobal true;
	
	private _success = false;
	private _leader = leader _group;
	private _target = _leader;
	
	if (_unit == _leader) then {
		_units = (units _group);
		private _shuffle = _units call BIS_fnc_arrayShuffle;
		private _valid = false;
		{
			if ((!isNil "_x") && (!_valid)) then {
				_target = _x;
				_valid = true;
			};
		} forEach _shuffle;
	};
	
	waitUntil {preloadCamera (getPos _target)};
	
	if (vehicle _unit != _unit) then {
		unassignVehicle _unit;
		moveOut _unit;
	};
	
	if (vehicle _target != _target) then {
		private _vehicle = vehicle _target;
		private _freeDriver = _vehicle emptyPositions "driver";
		if (_freeDriver > 0) then {
			_unit moveInDriver _vehicle;
			_success = true;
		} else {
			private _freeGunner = _vehicle emptyPositions "gunner";
			if (_freeGunner > 0) then {
				_unit moveInGunner _vehicle;
				_success = true;
			} else {
				private _freeCommander = _vehicle emptyPositions "commander";
				if (_freeCommander > 0) then {
					_unit moveInCommander _vehicle;
					_success = true;
				} else {
					private _turrets = fullCrew [_vehicle, "turret", true];
					{
						if ((isNull (_x select 0)) && (_x select 4) && (!_success)) then {
							_unit moveInTurret [_vehicle, (_x select 3)];
							_success = true;
						};
					} forEach _turrets;
					if (!_success) then {
						private _freeCargo = _vehicle emptyPositions "cargo";
						if (_freeCargo > 0) then {
							_unit moveInCargo _vehicle;
							_success = true;
						};
					};
				};
			};
		};
	} else {
		private _pos = _target modelToWorld [0, -2, 0];
		_pos = _pos findEmptyPosition [0, 30, (typeOf _unit)];
		if (!(_pos isEqualTo [])) then {
			private _dir = _pos getDir _target;
			_unit setPos _pos;
			_unit setDir _dir;
			_success = true;
		};
	};
	
	uiSleep 0.5;
	
	999 cutText [_message, "BLACK IN", 1.0];
	
	_unit hideObjectGlobal false;
	
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
			
			_unit setVariable ["ACE_allowDamage", true, true];
			_unit allowDamage true;
			
		};
		
		_unit setVariable ["AXE_Teleport_InProgress", nil, true];
		
	};
	
	uiSleep 1;
	
	if (missionNamespace getVariable ["axe_teleport_hint", true]) then {
		if (_success) then {
			private _targetName = [_target] call ACE_common_fnc_getName;
			private _groupName = groupId _group;
			private _textToGroup = format [localize "STR_AXE_Teleport_Hint_toGroup", _targetName, _groupName];
			private _hintToGroup = format [hint_tpl_liner_1, _textToGroup];
			//private _hintToGroup = format [hint_tpl_liner_2, toUpper(localize "STR_AXE_Teleport_Hint_Title"), _textToGroup];
			[_hintToGroup, 0] call AXE_fnc_hint;
		} else {
			private _hintToGroup = format [hint_tpl_liner_1, localize "STR_AXE_Teleport_Hint_Failure"];
			//private _hintToGroup = format [hint_tpl_liner_2, toUpper(localize "STR_AXE_Teleport_Hint_Title"), localize "STR_AXE_Teleport_Hint_Failure"];
			[_hintToGroup, 2] call AXE_fnc_hint;
		};
	};
	
};
