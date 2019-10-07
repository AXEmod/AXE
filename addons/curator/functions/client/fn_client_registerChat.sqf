/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\client\fn_client_registerChat.sqf
 *	by Ojemineh
 *	
 *	register client chat commands
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call AXE_curator_fnc_client_registerChat;
 *	
 */

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------
// CHAT: ZEUS

[
	"zeus", 
	{
		
		[
			{
				
				private _param = _this select 0;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enablefor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enablefor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Access_Denied"];
				};
				
				if (_param isEqualTo "") then {
					
					private _unit = player;
					systemChat format [localize "STR_AXE_Curator_Module_Prepare", _unit];
					
					[{
						["axe_curator_createModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
					}, [player, _unit]] call CBA_fnc_execNextFrame;
					
				} else {
					
					if (_param isEqualTo "target") then {
						
						private _unit = cursorObject;
						
						if ((_unit isKindOf "Man") && (isPlayer _unit)) then {
							private _unitName = [_unit] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Module_Prepare_For", _unitName, _unit];
							[{
								["axe_curator_createModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
							}, [player, _unit]] call CBA_fnc_execNextFrame;
						} else {
							systemChat format [localize "STR_AXE_Curator_Module_Prepare_Failed", _unit];
						};
						
					} else {
						
						private _unit = call compile _param;
						
						if (isNull (missionNamespace getVariable [_param, objNull])) exitWith {
							systemChat format [localize "STR_AXE_Curator_Module_Unknown_Target", _param];
						};
						
						if (!(isNull _unit) && (isPlayer _unit)) then {
							private _unitName = [_unit] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Module_Prepare_For", _unitName, _unit];
							[{
								["axe_curator_createModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
							}, [player, _unit]] call CBA_fnc_execNextFrame;
						} else {
							systemChat format [localize "STR_AXE_Curator_Module_Prepare_Failed", _unit];
						};
						
					};
					
				};
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: END MISSION

[
	"endmission", 
	{
		
		[
			{
				
				private _param = _this select 0;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enablefor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enablefor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Access_Denied"];
				};
				
				if (_param == "") then {
					["axe_curator_endMission", ["AXE_MISSION_DONE", true]] call CBA_fnc_globalEvent;
				} else {
					["axe_curator_endMission", [_param, true]] call CBA_fnc_globalEvent;
				};
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: FAIL MISSION

[
	"failmission", 
	{
		
		[
			{
				
				private _param = _this select 0;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enablefor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enablefor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Access_Denied"];
				};
				
				if (_param == "") then {
					["axe_curator_endMission", ["AXE_MISSION_FAIL", false]] call CBA_fnc_globalEvent;
				} else {
					["axe_curator_endMission", [_param, false]] call CBA_fnc_globalEvent;
				};
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
