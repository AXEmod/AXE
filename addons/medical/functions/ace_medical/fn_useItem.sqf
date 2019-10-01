/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\functions\ace_medical\fn_useItem.sqf
 *	by Ojemineh
 *	
 *	use equipment if any is available
 *	
 *	Arguments:
 *  0: medic	- <OBJECT>
 *  1: patient	- <OBJECT>
 *  2: item		- <STRING>
 *	
 *	Return:
 *  0: success <BOOL>
 *  1: Unit <OBJECT>
 *	
 *	Example:
 *	[unit, patient, "bandage"] call ACE_medical_fnc_useItem;
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_medic", "_patient", "_item"];

private _return	= [false, objNull];

private _medicClass = _medic getVariable ["ace_medical_medicClass", 0];
private _usageMedics = missionNamespace getVariable ["axe_medical_usage_order_medics", 0];
private _usageResponder = missionNamespace getVariable ["axe_medical_usage_order_responder", 0];
private _vehicleCrew = [objNull];

private _useItem = {
	
	params ["_target", "_item"];
	
	if (local _target) then {
		["ace_useItem", [_target, _item]] call CBA_fnc_localEvent;
	} else {
		["ace_useItem", [_target, _item], _target] call CBA_fnc_targetEvent;
	};
	
};

if (_item == "ACE_tourniquet") exitWith {
	
	if ([_patient, _item] call ACE_common_fnc_hasItem) exitWith {
		[_patient, _item] call _useItem;
		_return = [true, _patient];
		[true, _patient];
	};
	
	if ([_medic, _item] call ACE_common_fnc_hasItem) exitWith {
		[_medic, _item] call _useItem;
		_return = [true, _medic];
		[true, _medic];
	};
	
	if (([(vehicle _medic)] call ACE_medical_fnc_isMedicalVehicle) && ((vehicle _medic) != _medic)) then {
		_vehicleCrew = crew (vehicle _medic);
		{
			if (([_medic, _x] call ACE_medical_fnc_canAccessMedicalEquipment) && ([_x, _item] call ACE_common_fnc_hasItem)) exitWith {
				[_x, _item] call _useItem;
				_return = [true, _x];
				[true, _x];
			};
		} forEach _vehicleCrew;
	};
	
	_return
};

if (_medicClass > 0) exitWith {
	
	if (_usageMedics > 0) then {
		
		if ([_medic, _item] call ACE_common_fnc_hasItem) exitWith {
			[_medic, _item] call _useItem;
			_return = [true, _medic];
			[true, _medic];
		};
		
		if ([_patient, _item] call ACE_common_fnc_hasItem) exitWith {
			[_patient, _item] call _useItem;
			_return = [true, _patient];
			[true, _patient];
		};
		
	} else {
	
		if ([_patient, _item] call ACE_common_fnc_hasItem) exitWith {
			[_patient, _item] call _useItem;
			_return = [true, _patient];
			[true, _patient];
		};
		
		if ([_medic, _item] call ACE_common_fnc_hasItem) exitWith {
			[_medic, _item] call _useItem;
			_return = [true, _medic];
			[true, _medic];
		};
		
	};
	
	if (([(vehicle _medic)] call ACE_medical_fnc_isMedicalVehicle) && ((vehicle _medic) != _medic)) then {
		_vehicleCrew = crew (vehicle _medic);
		{
			if (([_medic, _x] call ACE_medical_fnc_canAccessMedicalEquipment) && ([_x, _item] call ACE_common_fnc_hasItem)) exitWith {
				[_x, _item] call _useItem;
				_return = [true, _x];
				[true, _x];
			};
		} forEach _vehicleCrew;
	};
	
	_return
};

if (_usageResponder > 0) then {
	
	if ([_medic, _item] call ACE_common_fnc_hasItem) exitWith {
		[_medic, _item] call _useItem;
		_return = [true, _medic];
		[true, _medic];
	};
	
	if ([_patient, _item] call ACE_common_fnc_hasItem) exitWith {
		[_patient, _item] call _useItem;
		_return = [true, _patient];
		[true, _patient];
	};

} else {

	if ([_patient, _item] call ACE_common_fnc_hasItem) exitWith {
		[_patient, _item] call _useItem;
		_return = [true, _patient];
		[true, _patient];
	};

	if ([_medic, _item] call ACE_common_fnc_hasItem) exitWith {
		[_medic, _item] call _useItem;
		_return = [true, _medic];
		[true, _medic];
	};
	
};

if (([(vehicle _medic)] call ACE_medical_fnc_isMedicalVehicle) && ((vehicle _medic) != _medic)) then {
    _vehicleCrew = crew (vehicle _medic);
    {
        if (([_medic, _x] call ACE_medical_fnc_canAccessMedicalEquipment) && ([_x, _item] call ACE_common_fnc_hasItem)) exitWith {
			[_x, _item] call _useItem;
            _return = [true, _x];
			[true, _x];
        };
    } forEach _vehicleCrew;
};

_return