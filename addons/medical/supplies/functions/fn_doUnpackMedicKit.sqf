/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\supplies\functions\fn_doUnpackMedicKit.sqf
 *	by Ojemineh
 *	
 *	unpack medical supplies
 *	
 *	Arguments:
 *	0: unit - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player] call AXE_medical_supplies_fnc_doUnpackMedicKit;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {
	
	params ["_unit"];
	
	_unit playAction "Gear";
	
	if (vehicle _unit != _unit) then {
		playSound "AXE_Medical_MedicKit_Open_1";
	} else {
		private _pitch = random [0.6, 1, 1.4];
		[_unit, "AXE_Medical_MedicKit_Open_1", 30, 300, -1, _pitch] call AXE_fnc_play3dGlobal;
	};
	
	AXE_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
	AXE_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;
	
	[
		2,
		[],
		{ AXE_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; },
		{ AXE_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
		localize "STR_AXE_Medical_Supplies_Progress_MedicKit",
		{true},
		["isNotInside", "isNotSitting", "isNotSwimming"]
	] call ACE_common_fnc_progressBar;
	
	waitUntil { (AXE_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (AXE_MEDICAL_SUPPLIES_UNPACK_FAILURE) };
	
	if (AXE_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitWith {
		
		_unit removeItem "AXE_MedicKit";
		
		private _order = [3,1,2];
		private _overflow = false;
		
		if ((missionNamespace getVariable ["ace_medical_level", 0]) >= 2) then {
			[_unit, "ACE_fieldDressing",	20, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_elasticBandage",	20, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_packingBandage",	20, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_quikClot",			20, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_salineIV_500",		08, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_epinephrine",		10, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_morphine",			10, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_tourniquet",		08, _order, _overflow] call AXE_fnc_addItem;
			if (
				!(missionNamespace getVariable ["ace_medical_healHitPointAfterAdvBandage", false]) && 
				["adv_aceSplint"] call AXE_fnc_isAddon
			) then {
			[_unit, "ADV_aceSplint_splint",	08, _order, _overflow] call AXE_fnc_addItem;
			};
		} else {
			[_unit, "ACE_fieldDressing",	20, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_salineIV_500",		08, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_epinephrine",		10, _order, _overflow] call AXE_fnc_addItem;
			[_unit, "ACE_morphine",			10, _order, _overflow] call AXE_fnc_addItem;
		};
		
		[_unit, "Land_FirstAidKit_01_open_F"] call AXE_fnc_createLitter;
		
		_unit playActionNow "Stand";
		
	};
	
	if (AXE_MEDICAL_SUPPLIES_UNPACK_FAILURE) exitWith {
		
		[_unit, "AXE_Medical_MedicKit_Open_1"] call AXE_fnc_stop3dGlobal;
		
		_unit playActionNow "Stand";
		
	};
	
};
