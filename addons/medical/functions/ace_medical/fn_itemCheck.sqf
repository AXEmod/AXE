/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_itemCheck.sqf
 *	by Ojemineh
 *	
 *	replaces vanilla items with ace ones
 *	
 *	Arguments:
 *  0: unit - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[bob] call ACE_medical_fnc_itemCheck;
 *	
 */

// -------------------------------------------------------------------------------------------------

if ((missionNamespace getVariable ["ace_medical_convertItems", 0]) == 2) exitWith {};

// -------------------------------------------------------------------------------------------------

params ["_unit"];

private _order = [];

if (_unit isKindOf "CAManBase") then {
	_order = [1,3,2];
} else {
	_order = [0];
};

while {({_x == "FirstAidKit"} count items _unit) > 0} do {
	
    _unit removeItem "FirstAidKit";
	
    if ((missionNamespace getVariable ["ace_medical_convertItems", 0]) == 0) then {
		
		if ((missionNamespace getVariable ["ace_medical_level", 0]) >= 2) then {
			[_unit, "ACE_fieldDressing",	3, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_elasticBandage",	3, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_packingBandage",	3, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_quikClot",			3, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_morphine",			2, _order, false] call AXE_fnc_addItem;
			if (
				!(missionNamespace getVariable ["ace_medical_healHitPointAfterAdvBandage", false]) && 
				["adv_aceSplint"] call AXE_fnc_isAddon
			) then {
			[_unit, "ADV_aceSplint_splint",	2, _order, false] call AXE_fnc_addItem;
			};
		} else {
			[_unit, "ACE_fieldDressing",	6, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_morphine",			2, _order, false] call AXE_fnc_addItem;
		};
		
    };
	
};

if (_unit isKindOf "CAManBase") then {
	_order = [3,1,2];
} else {
	_order = [0];
};

while {({_x == "Medikit"} count items _unit) > 0} do {
	
    _unit removeItem "Medikit";
	
    if ((missionNamespace getVariable ["ace_medical_convertItems", 0]) == 0) then {
		
        if ((missionNamespace getVariable ["ace_medical_level", 0]) >= 2) then {
			[_unit, "ACE_fieldDressing",		20, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_elasticBandage",		20, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_packingBandage",		20, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_quikClot",				20, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_salineIV_500",			08, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_epinephrine",			10, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_morphine",				10, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_tourniquet",			08, _order, false] call AXE_fnc_addItem;
			if (
				!(missionNamespace getVariable ["ace_medical_healHitPointAfterAdvBandage", false]) && 
				(isClass (configFile >> "CfgWeapons" >> "adv_aceSplint_splint"))
			) then {
				[_unit, "adv_aceSplint_splint",	08, _order, false] call AXE_fnc_addItem;
			};
        } else {
			[_unit, "ACE_fieldDressing",		20, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_salineIV_500",			08, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_epinephrine",			10, _order, false] call AXE_fnc_addItem;
			[_unit, "ACE_morphine",				10, _order, false] call AXE_fnc_addItem;
        };
		
    };
	
};
