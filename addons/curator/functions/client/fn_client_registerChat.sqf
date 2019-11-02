/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_curator\functions\client\fn_client_registerChat.sqf
 *	by Ojemineh
 *	
 *	register client chat
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
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				["axe_curator_cleanupModules", []] call CBA_fnc_serverEvent;
				
				if ((count allCurators) == 0) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Zeus_NotPresent"];
				};
				
				systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Available"];
				
				{
					private _curatorUnit = getAssignedCuratorUnit _x;
					private _curatorName = [_curatorUnit] call ACE_common_fnc_getName;
					systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Listing", _curatorUnit, _curatorName];
				} forEach allCurators;
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: ZEUS CREATE

[
	"zeus.create", 
	{
		
		[
			{
				
				private _param = _this select 0;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				if ((_param isEqualTo "") || (_param isEqualTo "self")) then {
					
					private _target = player;
					
					if (!(isNull _target) && (isNull getAssignedCuratorLogic _target)) then {
						private _targetName = [_target] call ACE_common_fnc_getName;
						systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Create", _targetName, _target];
						[{
							["axe_curator_createModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
						}, [player, _target], 1] call CBA_fnc_waitAndExecute;
					} else {
						systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Create_Failed", _target];
					};
					
				} else {
					
					if (_param isEqualTo "target") then {
						
						private _target = cursorObject;
						
						if ((_target isKindOf "Man") && (isPlayer _target) && (isNull getAssignedCuratorLogic _target)) then {
							private _targetName = [_target] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Create_For", _targetName, _target];
							[{
								["axe_curator_createModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
							}, [player, _target], 1] call CBA_fnc_waitAndExecute;
						} else {
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Create_Failed", _target];
						};
						
					} else {
						
						private _target = call compile _param;
						
						if (isNull (missionNamespace getVariable [_param, objNull])) exitWith {
							systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _param];
						};
						
						if (!(isNull _target) && (isPlayer _target) && (isNull getAssignedCuratorLogic _target)) then {
							private _targetName = [_target] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Create_For", _targetName, _target];
							[{
								["axe_curator_createModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
							}, [player, _target], 1] call CBA_fnc_waitAndExecute;
						} else {
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Create_Failed", _target];
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
// CHAT: ZEUS REMOVE

[
	"zeus.remove", 
	{
		
		[
			{
				
				private _param = _this select 0;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				if ((_param isEqualTo "") || (_param isEqualTo "self")) then {
					
					private _target = player;
					
					if (!(isNull _target) && !(isNull getAssignedCuratorLogic _target)) then {
						private _targetName = [_target] call ACE_common_fnc_getName;
						systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Remove", _targetName, _target];
						[{
							["axe_curator_removeModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
						}, [player, _target], 1] call CBA_fnc_waitAndExecute;
					} else {
						systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Remove_Failed", _target];
					};
					
				} else {
					
					if (_param isEqualTo "target") then {
						
						private _target = cursorObject;
						
						if ((_target isKindOf "Man") && (isPlayer _target) && !(isNull getAssignedCuratorLogic _target)) then {
							private _targetName = [_target] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Remove_For", _targetName, _target];
							[{
								["axe_curator_removeModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
							}, [player, _target], 1] call CBA_fnc_waitAndExecute;
						} else {
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Remove_Failed", _target];
						};
						
					} else {
						
						private _target = call compile _param;
						
						if (isNull (missionNamespace getVariable [_param, objNull])) exitWith {
							systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _param];
						};
						
						if (!(isNull _target) && (isPlayer _target) && !(isNull getAssignedCuratorLogic _target)) then {
							private _targetName = [_target] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Remove_For", _targetName, _target];
							[{
								["axe_curator_removeModule", [_this select 0, _this select 1]] call CBA_fnc_serverEvent;
							}, [player, _target], 1] call CBA_fnc_waitAndExecute;
						} else {
							systemChat format [localize "STR_AXE_Curator_Chat_Zeus_Remove_Failed", _target];
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
// CHAT: HEAL

[
	"heal", 
	{
		
		[
			{
				
				private _param = _this select 0;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				if (_param isEqualTo "all") exitWith {
					{
						private _target = _x;
						private _targetName = [_target] call ACE_common_fnc_getName;
						systemChat format [localize "STR_AXE_Curator_Chat_Healing_For", _targetName, _target];
						["axe_curator_playerHeal", [player, _target], [_target]] call CBA_fnc_targetEvent;
					} forEach (allPlayers - entities "HeadlessClient_F");
				};
				
				if ((_param isEqualTo "") || (_param isEqualTo "self")) then {
					
					private _target = player;
					
					if (!(isNull _target)) then {
						private _targetName = [_target] call ACE_common_fnc_getName;
						systemChat format [localize "STR_AXE_Curator_Chat_Healing", _targetName, _target];
						["axe_curator_playerHeal", [player, _target], [_target]] call CBA_fnc_targetEvent;
					} else {
						systemChat format [localize "STR_AXE_Curator_Chat_Healing_Failed", _target];
					};
					
				} else {
					
					if (_param isEqualTo "target") then {
						
						private _target = cursorObject;
						
						if ((_target isKindOf "Man") && (isPlayer _target)) then {
							private _targetName = [_target] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Chat_Healing_For", _targetName, _target];
							["axe_curator_playerHeal", [player, _target], [_target]] call CBA_fnc_targetEvent;
						} else {
							systemChat format [localize "STR_AXE_Curator_Chat_Healing_Failed", _target];
						};
						
					} else {
						
						private _target = call compile _param;
						
						if (isNull (missionNamespace getVariable [_param, objNull])) exitWith {
							systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _param];
						};
						
						if (!(isNull _target) && (isPlayer _target)) then {
							private _targetName = [_target] call ACE_common_fnc_getName;
							systemChat format [localize "STR_AXE_Curator_Chat_Healing_For", _targetName, _target];
							["axe_curator_playerHeal", [player, _target], [_target]] call CBA_fnc_targetEvent;
						} else {
							systemChat format [localize "STR_AXE_Curator_Chat_Healing_Failed", _target];
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
// CHAT: MEDIC

[
	"medic", 
	{
		
		[
			{
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				private _allMedics = [];
				
				{
					if ((_x getVariable ["ACE_medical_medicClass", 0]) > 0) then {
						_allMedics pushBack _x;
					};
				} forEach (allPlayers - entities "HeadlessClient_F");
				
				if ((count _allMedics) == 0) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Medic_NotPresent"];
				};
				
				systemChat format [localize "STR_AXE_Curator_Chat_Medic_Available"];
				
				{
					private _medicUnit = _x;
					private _medicName = [_medicUnit] call ACE_common_fnc_getName;
					private _medicLevel = _medicUnit getVariable ["ACE_medical_medicClass", 0];
					private _medicLevelStr = "";
					if (_medicLevel > 1) then {
						_medicLevelStr = localize "STR_AXE_Curator_Chat_Medic_Level_2";
					} else {
						_medicLevelStr = localize "STR_AXE_Curator_Chat_Medic_Level_1";
					};
					systemChat format [localize "STR_AXE_Curator_Chat_Medic_Listing", _medicUnit, _medicName, _medicLevel, _medicLevelStr];
				} forEach _allMedics;
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: MEDIC LEVEL

[
	"medic.level", 
	{
		
		[
			{
				
				private _params = [(_this select 0), ","] call CBA_fnc_split;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				private _paramTarget = "";
				private _paramLevel = "";
				
				if ((count _params) == 0) then {
					_paramTarget = str player;
					_paramLevel = "2";
				} else {
					if ((count _params) == 1) then {
						_paramTarget = _params select 0;
						_paramLevel = "1";
					} else {
						_paramTarget = _params select 0;
						_paramLevel = _params select 1;
					};
				};
				
				private _target = objNull;
				private _level = 0;
				
				if (_paramTarget == "target") then {
					_target = cursorObject;
					_level = parseNumber _paramLevel;
				} else {
					_target = call compile _paramTarget;
					_level = parseNumber _paramLevel;
				};
				
				if (_level < 0) then {_level = 0;};
				if (_level > 2) then {_level = 2;};
				
				if (_paramTarget == "0") exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _paramTarget];
				};
				if ((_paramTarget != "target") && (isNull (missionNamespace getVariable [_paramTarget, objNull]))) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _paramTarget];
				};
				
				if ((isPlayer _target) && (_target isKindOf "Man") && !(_target in (entities "HeadlessClient_F"))) then {
					private _targetName = [_target] call ACE_common_fnc_getName;
					systemChat format [localize "STR_AXE_Curator_Chat_Medic_Level_Prepare", _targetName];
					[{
						["axe_curator_setMedicLevel", [_this select 0, _this select 1, _this select 2], [_this select 0, _this select 1]] call CBA_fnc_targetEvent;
					}, [player, _target, _level], 1] call CBA_fnc_waitAndExecute;
				} else {
					systemChat format [localize "STR_AXE_Curator_Chat_Medic_Level_Failed", _target];
				};
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: ENGINEER

[
	"engineer", 
	{
		
		[
			{
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				private _allEngineers = [];
				
				{
					if ((_x getVariable ["ACE_isEngineer", 0]) > 0) then {
						_allEngineers pushBack _x;
					};
				} forEach (allPlayers - entities "HeadlessClient_F");
				
				if ((count _allEngineers) == 0) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Engineer_NotPresent"];
				};
				
				systemChat format [localize "STR_AXE_Curator_Chat_Engineer_Available"];
				
				{
					private _engineerUnit = _x;
					private _engineerName = [_engineerUnit] call ACE_common_fnc_getName;
					private _engineerLevel = _engineerUnit getVariable ["ACE_isEngineer", 0];
					private _engineerLevelStr = "";
					if (_engineerLevel > 1) then {
						_engineerLevelStr = localize "STR_AXE_Curator_Chat_Engineer_Level_2";
					} else {
						_engineerLevelStr = localize "STR_AXE_Curator_Chat_Engineer_Level_1";
					};
					systemChat format [localize "STR_AXE_Curator_Chat_Engineer_Listing", _engineerUnit, _engineerName, _engineerLevel, _engineerLevelStr];
				} forEach _allEngineers;
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: ENGINEER LEVEL

[
	"engineer.level", 
	{
		
		[
			{
				
				private _params = [(_this select 0), ","] call CBA_fnc_split;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				private _paramTarget = "";
				private _paramLevel = "";
				
				if ((count _params) == 0) then {
					_paramTarget = str player;
					_paramLevel = "2";
				} else {
					if ((count _params) == 1) then {
						_paramTarget = _params select 0;
						_paramLevel = "1";
					} else {
						_paramTarget = _params select 0;
						_paramLevel = _params select 1;
					};
				};
				
				private _target = objNull;
				private _level = 0;
				
				if (_paramTarget == "target") then {
					_target = cursorObject;
					_level = parseNumber _paramLevel;
				} else {
					_target = call compile _paramTarget;
					_level = parseNumber _paramLevel;
				};
				
				if (_level < 0) then {_level = 0;};
				if (_level > 2) then {_level = 2;};
				
				if (_paramTarget == "0") exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _paramTarget];
				};
				if ((_paramTarget != "target") && (isNull (missionNamespace getVariable [_paramTarget, objNull]))) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _paramTarget];
				};
				
				if ((isPlayer _target) && (_target isKindOf "Man") && !(_target in (entities "HeadlessClient_F"))) then {
					private _targetName = [_target] call ACE_common_fnc_getName;
					systemChat format [localize "STR_AXE_Curator_Chat_Engineer_Level_Prepare", _targetName];
					[{
						["axe_curator_setEngineerLevel", [_this select 0, _this select 1, _this select 2], [_this select 0, _this select 1]] call CBA_fnc_targetEvent;
					}, [player, _target, _level], 1] call CBA_fnc_waitAndExecute;
				} else {
					systemChat format [localize "STR_AXE_Curator_Chat_Engineer_Level_Failed", _target];
				};
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: EOD

[
	"eod", 
	{
		
		[
			{
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				private _allEODs = [];
				
				{
					if (_x getVariable ["ACE_isEOD", false]) then {
						_allEODs pushBack _x;
					};
				} forEach (allPlayers - entities "HeadlessClient_F");
				
				if ((count _allEODs) == 0) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_EOD_NotPresent"];
				};
				
				systemChat format [localize "STR_AXE_Curator_Chat_EOD_Available"];
				
				{
					private _eodUnit = _x;
					private _eodName = [_eodUnit] call ACE_common_fnc_getName;
					private _eodLevel = _eodUnit getVariable ["ACE_isEOD", false];
					private _eodLevelNum = 0;
					private _eodLevelStr = "";
					if (_eodLevel) then {
						_eodLevelStr = localize "STR_AXE_Curator_Chat_EOD_Level_1";
						_eodLevelNum = 1;
					} else {
						_eodLevelStr = localize "STR_AXE_Curator_Chat_EOD_Level_0";
						_eodLevelNum = 0;
					};
					systemChat format [localize "STR_AXE_Curator_Chat_EOD_Listing", _eodUnit, _eodName, _eodLevelNum, _eodLevelStr];
				} forEach _allEODs;
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
// CHAT: EOD LEVEL

[
	"eod.level", 
	{
		
		[
			{
				
				private _params = [(_this select 0), ","] call CBA_fnc_split;
				
				if (
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				private _paramTarget = "";
				private _paramLevel = "";
				
				if ((count _params) == 0) then {
					_paramTarget = str player;
					_paramLevel = "1";
				} else {
					if ((count _params) == 1) then {
						_paramTarget = _params select 0;
						_paramLevel = "1";
					} else {
						_paramTarget = _params select 0;
						_paramLevel = _params select 1;
					};
				};
				
				private _target = objNull;
				private _level = 0;
				
				if (_paramTarget == "target") then {
					_target = cursorObject;
					_level = parseNumber _paramLevel;
				} else {
					_target = call compile _paramTarget;
					_level = parseNumber _paramLevel;
				};
				
				if (_level < 0) then {_level = 0;};
				if (_level > 1) then {_level = 1;};
				
				if (_paramTarget == "0") exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _paramTarget];
				};
				if ((_paramTarget != "target") && (isNull (missionNamespace getVariable [_paramTarget, objNull]))) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Unknown_Target", _paramTarget];
				};
				
				if ((isPlayer _target) && (_target isKindOf "Man") && !(_target in (entities "HeadlessClient_F"))) then {
					private _targetName = [_target] call ACE_common_fnc_getName;
					systemChat format [localize "STR_AXE_Curator_Chat_EOD_Level_Prepare", _targetName];
					[{
						["axe_curator_setEODLevel", [_this select 0, _this select 1, _this select 2], [_this select 0, _this select 1]] call CBA_fnc_targetEvent;
					}, [player, _target, _level], 1] call CBA_fnc_waitAndExecute;
				} else {
					systemChat format [localize "STR_AXE_Curator_Chat_EOD_Level_Failed", _target];
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
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				if (_param == "") then {
					["axe_curator_endMission", [player, "AXE_MISSION_DONE", true]] call CBA_fnc_globalEvent;
				} else {
					["axe_curator_endMission", [player, _param, true]] call CBA_fnc_globalEvent;
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
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 1) && ([] call AXE_fnc_isAdmin)) &&
					!((missionNamespace getVariable ["axe_curator_chat_enableFor", 0] == 2) && ([] call AXE_fnc_isAdmin || [] call AXE_fnc_isCurator))
				) exitWith {
					systemChat format [localize "STR_AXE_Curator_Chat_Access_Denied"];
				};
				
				if (_param == "") then {
					["axe_curator_endMission", [player, "AXE_MISSION_FAIL", false]] call CBA_fnc_globalEvent;
				} else {
					["axe_curator_endMission", [player, _param, false]] call CBA_fnc_globalEvent;
				};
				
			}, 
			[_this select 0]
		] call CBA_fnc_execNextFrame;
		
	}, 
	"all"
] call CBA_fnc_registerChatCommand;

// -------------------------------------------------------------------------------------------------
