/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_actionRemoveTourniquet.sqf
 *	by Ojemineh
 *	
 *	action for removing the tourniquet on specified selection
 *	
 *	Arguments:
 *	0: medic		- <OBJECT>
 *	1: patient		- <OBJECT>
 *	2: body part	- <STRING>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[bob, kevin, "selection"] call ACE_medical_fnc_actionRemoveTourniquet;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient", "_bodyPart"];

// GRAB THE REQUIRED DATA
private _part = [_bodyPart] call ACE_medical_fnc_selectionNameToNumber;
private _tourniquets = _patient getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];

// CHECK IF THERE IS A TOURNIQUET ON THIS BODYPART
if ((_tourniquets select _part) == 0) exitWith {
    ["ace_common_displayTextStructured", ["STR_ACE_noTourniquetOnBodyPart", 1.5, _medic], [_medic]] call CBA_fnc_targetEvent;
};

// REMOVING THE TOURNIQUET
_tourniquets set [_part, 0];
_patient setVariable ["ace_medical_tourniquets", _tourniquets, true];

// IF TOURNIQUET IS NOT A CONSUMABLE ITEM
if (!(missionNamespace getVariable ["axe_medical_consume_tourniquet", false])) then {
	
	// ADDING THE TOURNIQUET ITEM TO THE CALLER/TARGET
	if (missionNamespace getVariable ["axe_medical_return_items", true]) then {
		
		private _holding = (missionNamespace getVariable ["axe_medical_return_tourniquets", 1]);
		
		if ( ({_x == "ACE_tourniquet"} count (items _patient)) >= _holding ) then {
			[_medic, "ACE_tourniquet", 1, [3,1,2], true] call AXE_fnc_addItem;
		} else {
			[_patient, "ACE_tourniquet", 1, [1,3,2], true] call AXE_fnc_addItem;
		};
		
	} else {
		
		[_medic, "ACE_tourniquet", 1, [3,1,2], true] call AXE_fnc_addItem;
		
	};
	
};

//HANDLE ALL INJECTED MEDICATIONS NOW THAT BLOOD IS FLOWING:
private _delayedMedications = _patient getVariable ["ace_medical_occludedMedications", []];
private _updatedArray = false;

{
	_x params ["", "", "_medPartNum"];
	if (_part == _medPartNum) then {
		["ace_medical_treatmentAdvanced_medicationLocal", _x, [_patient]] call CBA_fnc_targetEvent;
		_delayedMedications set [_forEachIndex, -1];
		_updatedArray = true;
	};
} forEach _delayedMedications;

if (_updatedArray) then {
    _delayedMedications = _delayedMedications - [-1];
    _patient setVariable ["ace_medical_occludedMedications", _delayedMedications, true];
};
