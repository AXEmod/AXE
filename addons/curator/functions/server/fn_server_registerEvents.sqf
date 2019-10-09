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
		
		if (missionNamespace getVariable ["axe_curator_players_autoAdd", false]) then {
			_curator addCuratorEditableObjects [(allPlayers - entities "HeadlessClient_F"), false];
		};
		
		[_curator, [-1, -2, 0]] call BIS_fnc_setCuratorVisionModes;
		
		_target assignCurator _curator;
		
		private _callerName = [_caller] call ACE_common_fnc_getName;
		private _targetName = [_target] call ACE_common_fnc_getName;
		
		[4, "'%1' created Zeus for '%2'!", [_callerName, _targetName], "curator"] call AXE_fnc_log;
		
		if (_caller isEqualTo _target) then {
			["axe_curator_moduleCreated", [_caller, _target], [_caller]] call CBA_fnc_targetEvent;
		} else {
			["axe_curator_moduleCreated", [_caller, _target], [_caller, _target]] call CBA_fnc_targetEvent;
		};
		
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
			
			private _callerName = [_caller] call ACE_common_fnc_getName;
			private _targetName = [_target] call ACE_common_fnc_getName;
			
			[4, "'%1' removed Zeus from '%2'!", [_callerName, _targetName], "curator"] call AXE_fnc_log;
			
			if (_caller isEqualTo _target) then {
				["axe_curator_moduleRemoved", [_caller, _target], [_caller]] call CBA_fnc_targetEvent;
			} else {
				["axe_curator_moduleRemoved", [_caller, _target], [_caller, _target]] call CBA_fnc_targetEvent;
			};
			
		};
		
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------
