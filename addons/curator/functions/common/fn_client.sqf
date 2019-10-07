/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\common\fn_client.sqf
 *	by Ojemineh
 *	
 *	setup client
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_client;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};
if  (is3DEN) exitWith {};

// -------------------------------------------------------------------------------------------------

[] call AXE_curator_fnc_client_registerEvents;

[] call AXE_curator_fnc_client_registerChat;
[] call AXE_curator_fnc_client_registerKeys;
[] call AXE_curator_fnc_client_registerModules;

// -------------------------------------------------------------------------------------------------

if (missionNamespace getVariable ["axe_curator_add_players", false]) then {
	
	[] spawn {
		
		waitUntil {(!isNull player) && (time > 1)};
		
		private _assignedLogic = getAssignedCuratorLogic player;
		
		if !(isNull _assignedLogic) then {
			_assignedLogic addCuratorEditableObjects [(allPlayers - entities "HeadlessClient_F"), false];
		};
		
	};
	
};

// -------------------------------------------------------------------------------------------------
