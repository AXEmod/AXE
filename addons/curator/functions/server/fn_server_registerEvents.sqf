/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\server\fn_server_registerEvents.sqf
 *	by Ojemineh
 *	
 *	register server events
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_server_registerEvents;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(isServer) exitWith {};

// -------------------------------------------------------------------------------------------------
// EVENT: PLAYER CONNECTED

addMissionEventHandler ["PlayerConnected", {
	
	params ["_id", "_uid", "_name", "_jip", "_owner"];
	
    private _player =_uid call BIS_fnc_getUnitByUid;
	
	if (_name != "__SERVER__") then {
		[0, "CONNECTED: '%1', uid='%2', owner='%3', jip='%4'", [_name, _uid, _owner, _jip], "", ""] call AXE_fnc_log;
		["axe_curator_registerPlayer", [_player]] call CBA_fnc_serverEvent;
	};
	
}];

// -------------------------------------------------------------------------------------------------
// EVENT: PLAYER DISCONNECTED

addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	
    private _player =_uid call BIS_fnc_getUnitByUid;
	
	if (_name != "__SERVER__") then {
		[0, "DISCONNECTED: '%1', uid='%2', owner='%3', jip='%4'", [_name, _uid, _owner, _jip], "", ""] call AXE_fnc_log;
		["axe_curator_unregisterPlayer", [_player]] call CBA_fnc_serverEvent;
	};
	
}];

// -------------------------------------------------------------------------------------------------
// EVENT: REGISTER PLAYER

[
	"axe_curator_registerPlayer", 
	{
		
		params ["_player"];
		
		if !((isPlayer _player) && !(_player in entities "HeadlessClient_F")) exitWith {};
		
		if ((count allCurators) > 0) then {
			if (missionNamespace getVariable ["axe_curator_players_autoAdd", false]) then {
				{_x addCuratorEditableObjects [(allPlayers - entities "HeadlessClient_F"), false];} forEach allCurators;
			};
		};
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: UNREGISTER PLAYER

[
	"axe_curator_unregisterPlayer", 
	{
		
		params ["_player"];
		
		if !((isPlayer _player) && !(_player in entities "HeadlessClient_F")) exitWith {};
		/*
		if ((count allCurators) > 0) then {
			if (missionNamespace getVariable ["axe_curator_players_autoAdd", false]) then {
				{_x removeCuratorEditableObjects [[_player], false];} forEach allCurators;
			};
		};
		*/
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: CREATE MODULE

[
	"axe_curator_createModule", 
	{
		
		params ["_caller", "_target"];
		
		private _assignedLogic = getAssignedCuratorLogic _target;
		if !(isNull _assignedLogic) then {unassignCurator _assignedLogic;};
		
		private _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
		
		_curator setVariable ["addons", 3, true];
        _curator setVariable ["birdType", "", true];
        _curator setVariable ["showNotification", false, true];
		_curator setVariable ["curatorUnitOwner", str (owner _target), true];
		_curator setVariable ["owner", str (owner _target), true];
		
		if (missionNamespace getVariable ["axe_curator_players_autoAdd", false]) then {
			_curator addCuratorEditableObjects [(allPlayers - entities "HeadlessClient_F"), false];
		};
		
		[_curator, [-1, -2, 0]] call BIS_fnc_setCuratorVisionModes;
		
		_target assignCurator _curator;
		
		private _callerType = ["Admin", "Zeus"] select !(isNull getAssignedCuratorLogic _caller);
		private _callerName = [_caller] call ACE_common_fnc_getName;
		private _targetName = [_target] call ACE_common_fnc_getName;
		
		if (_caller isEqualTo _target) then {
			["axe_curator_moduleCreated", [_caller, _target], [_caller]] call CBA_fnc_targetEvent;
			[4, "%1 (%2) created a new module", [_callerType, _callerName, _targetName], "curator"] call AXE_fnc_logGlobal;
		} else {
			["axe_curator_moduleCreated", [_caller, _target], [_caller, _target]] call CBA_fnc_targetEvent;
			[4, "%1 (%2) created a new module for '%3'", [_callerType, _callerName, _targetName], "curator"] call AXE_fnc_logGlobal;
		};
		
		["axe_curator_modulePing", [], [_target]] call CBA_fnc_targetEvent;
		
		if (missionNamespace getVariable ["axe_curator_module_deleteEmpty", false]) then {
			{
				if (isNull (getAssignedCuratorUnit _x)) then {
					deleteVehicle _x
				};
			} forEach allCurators;
		};
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
// EVENT: REMOVE MODULE

[
	"axe_curator_removeModule", 
	{
		
		params ["_caller", "_target"];
		
		private _assignedLogic = getAssignedCuratorLogic _target;
		
		if !(isNull _assignedLogic) then {
			
			unassignCurator _assignedLogic;
			deleteVehicle _assignedLogic;
			
			private _callerType = ["Admin", "Zeus"] select !(isNull getAssignedCuratorLogic _caller);
			private _callerName = [_caller] call ACE_common_fnc_getName;
			private _targetName = [_target] call ACE_common_fnc_getName;
			
			if (_caller isEqualTo _target) then {
				["axe_curator_moduleRemoved", [_caller, _target], [_caller]] call CBA_fnc_targetEvent;
				[4, "%1 (%2) removed module", [_callerType, _callerName, _targetName], "curator"] call AXE_fnc_logGlobal;
			} else {
				["axe_curator_moduleRemoved", [_caller, _target], [_caller, _target]] call CBA_fnc_targetEvent;
				[4, "%1 (%2) removed module from '%3'", [_callerType, _callerName, _targetName], "curator"] call AXE_fnc_logGlobal;
			};
			
		};
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
