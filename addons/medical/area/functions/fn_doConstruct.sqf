/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\axe_medical\area\functions\fn_doConstruct.sqf
 *	by Ojemineh
 *	
 *	construct a medical area (dressing station)
 *	
 *	Arguments:
 *	0: unit - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player] call AXE_medical_area_fnc_doConstruct;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {false};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {
	
	params ["_unit"];
	
	_unit playAction "MedicStart";
	
	[_unit, "AXE_Medical_Area_Construct_1", [], 50, 1000] call AXE_fnc_play3dSound;
	
	private _isInBuilding = [_unit] call AXE_fnc_isInBuilding;
	private _isOnWater = (surfaceIsWater (getPosASL _unit));
	
	private _pos = getPosASL _unit;
	private _dir = getDir _unit;
	private _objects = [];
	
	private _direction = 0;
	private _distance = 1.5;
	private _heading = (_dir + _direction) mod 360;
	private _newX = (_pos select 0) + (sin _heading * _distance);
	private _newY = (_pos select 1) + (cos _heading * _distance);
	private _newPos = [0,0,0];
	if (!_isInBuilding && !_isOnWater) then {
		_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
	} else {
		_newPos = [_newX, _newY, (_pos select 2)];
	};
	
	private _medArea = createVehicle ["Item_Medikit", [0,0,0], [], 0, "CAN_COLLIDE"];
	_medArea setDir _dir;
	_medArea setPosASL _newPos;
	if (!_isInBuilding && !_isOnWater) then {
		_medArea setVectorUp surfaceNormal position _medArea;
	} else {
		_medArea setVectorUp [0,0,1];
	};
	_medArea setDamage 1;
	
	if (!_isInBuilding && !_isOnWater) then {
		private _cltPos = +_newPos;
		_cltPos set [2,0];
		private _cutter = createVehicle ["Land_ClutterCutter_medium_F", _cltPos, [], 0, "CAN_COLLIDE"];
		_objects pushBack _cutter;
	};
	
	private _medHpad = createVehicle ["Land_HelipadEmpty_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_medHpad setDir _dir;
	_medHpad setPosASL _newPos;
	if (!_isInBuilding && !_isOnWater) then {
		_medHpad setVectorUp surfaceNormal position _medHpad;
	} else {
		_medHpad setVectorUp [0,0,1];
	};
	_objects pushBack _medHpad;
	
	private _medMenu = "Sign_Sphere10cm_F" createVehicle [0,0,0]; 
	_medMenu setDir _dir;
	_medMenu setPosASL (AGLtoASL (_medArea modelToWorld [0,0,-0.5]));
	_medMenu setObjectTextureGlobal [0, "#(argb,8,8,3)color(1.0,0.6,0.1,0,ca)"];
	_objects pushBack _medMenu;
	
	_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
	
	AXE_MEDICAL_AREA_CONSTRUCT_SUCCESS = false;
	AXE_MEDICAL_AREA_CONSTRUCT_FAILURE = false;
	
	private _construct_time = round (missionNamespace getVariable ["axe_medical_area_constuct_time", 20]);
	if (_construct_time < 3) then { _construct_time = 3; };
	private _section_time = (_construct_time / 8);
	
	[
		_construct_time,
		[],
		{ AXE_MEDICAL_AREA_CONSTRUCT_SUCCESS = true; },
		{ AXE_MEDICAL_AREA_CONSTRUCT_FAILURE = true; },
		localize "STR_AXE_Medical_Area_Progress_Construct",
		{true},
		["isNotInside", "isNotSitting", "isNotSwimming"]
	] call ACE_common_fnc_progressBar;
	
	[_unit, _isInBuilding, _isOnWater, _pos, _dir, _objects, _medArea, _construct_time, _section_time] spawn {
		
		params ["_unit", "_isInBuilding", "_isOnWater", "_pos", "_dir", "_objects", "_medArea", "_construct_time", "_section_time"];
		
		private ["_direction", "_distance", "_heading", "_newX", "_newY", "_newPos"];
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then { sleep (2 * _section_time); };
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then {
			
			private _tarp1 = objNull;
			
			if (!_isInBuilding) then {
				_direction = 330;
				_distance = 1.9;
				_heading = (_dir + _direction) mod 360;
				_newX = (_pos select 0) + (sin _heading * _distance);
				_newY = (_pos select 1) + (cos _heading * _distance);
				if (!_isOnWater) then {
					_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
				} else {
					_newPos = [_newX, _newY, (_pos select 2) + 0.00];
				};
				_tarp1 = createSimpleObject ["Tarp_01_Small_Green_F", [0,0,0]];
				_tarp1 setDir (_dir + 0);
				_tarp1 setPosASL _newPos;
				if (!_isOnWater) then {
					_tarp1 setVectorUp surfaceNormal position _tarp1;
				} else {
					_tarp1 setVectorUp [0,0,1];
				};
			};
			
			_objects pushBack _tarp1;
			
			if (!_isInBuilding && !_isOnWater) then {
				private _cltPos = +_newPos;
				_cltPos set [2,0];
				private _cutter = createVehicle ["Land_ClutterCutter_medium_F", _cltPos, [], 0, "CAN_COLLIDE"];
				_objects pushBack _cutter;
			};
			
			_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
			sleep _section_time;
			
		};
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then {
			
			private _bodybag1 = objNull;
			
			if (!_isInBuilding) then {
				_direction = 330;
				_distance = 1.9;
				_heading = (_dir + _direction) mod 360;
				_newX = (_pos select 0) + (sin _heading * _distance);
				_newY = (_pos select 1) + (cos _heading * _distance);
				if (!_isOnWater) then {
					_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
				} else {
					_newPos = [_newX, _newY, (_pos select 2) + 0.005];
				};
				_bodybag1 = createSimpleObject ["Land_Sleeping_bag_blue_F", [0,0,0]];
				_bodybag1 setDir (_dir + 180);
				_bodybag1 setPosASL _newPos;
				if (!_isOnWater) then {
					_bodybag1 setVectorUp surfaceNormal position _bodybag1;
				} else {
					_bodybag1 setVectorUp [0,0,1];
				};
			};
			
			_objects pushBack _bodybag1;
			
			_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
			sleep _section_time;
			
		};
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then {
			
			private _tarp2 = objNull;
			
			if (!_isInBuilding) then {
				_direction = 030;
				_distance = 1.9;
				_heading = (_dir + _direction) mod 360;
				_newX = (_pos select 0) + (sin _heading * _distance);
				_newY = (_pos select 1) + (cos _heading * _distance);
				if (!_isOnWater) then {
					_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
				} else {
					_newPos = [_newX, _newY, (_pos select 2) + 0.005];
				};
				_tarp2 = createSimpleObject ["Tarp_01_Small_Green_F", [0,0,0]];
				_tarp2 setDir (_dir + 0);
				_tarp2 setPosASL _newPos;
				if (!_isOnWater) then {
					_tarp2 setVectorUp surfaceNormal position _tarp2;
				} else {
					_tarp2 setVectorUp [0,0,1];
				};
			};
			
			_objects pushBack _tarp2;
			
			if (!_isInBuilding && !_isOnWater) then {
				private _cltPos = +_newPos;
				_cltPos set [2,0];
				private _cutter = createVehicle ["Land_ClutterCutter_medium_F", _cltPos, [], 0, "CAN_COLLIDE"];
				_objects pushBack _cutter;
			};
			
			_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
			sleep _section_time;
			
		};
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then {
			
			private _bodybag2 = objNull;
			
			if (!_isInBuilding) then {
				_direction = 030;
				_distance = 1.9;
				_heading = (_dir + _direction) mod 360;
				_newX = (_pos select 0) + (sin _heading * _distance);
				_newY = (_pos select 1) + (cos _heading * _distance);
				if (!_isOnWater) then {
					_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
				} else {
					_newPos = [_newX, _newY, (_pos select 2) + 0.012];
				};
				_bodybag2 = createSimpleObject ["Land_Sleeping_bag_blue_F", [0,0,0]];
				_bodybag2 setDir (_dir + 0);
				_bodybag2 setPosASL _newPos;
				if (!_isOnWater) then {
					_bodybag2 setVectorUp surfaceNormal position _bodybag2;
				} else {
					_bodybag2 setVectorUp [0,0,1];
				};
			};
			
			_objects pushBack _bodybag2;
			
			_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
			sleep _section_time;
			
		};
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then {
			
			_direction = 0;
			_distance = 2.2; 
			_heading = (_dir + _direction) mod 360;
			_newX = (_pos select 0) + (sin _heading * _distance); 
			_newY = (_pos select 1) + (cos _heading * _distance); 
			if (!_isInBuilding && !_isOnWater) then {
				_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
			} else {
				_newPos = [_newX, _newY, (_pos select 2) + 0.00]; 
			};
			private _firstaid = createSimpleObject ["Land_FirstAidKit_01_open_F", [0,0,0]];
			_firstaid setDir (_dir + 50); 
			_firstaid setPosASL _newPos;
			if (!_isInBuilding && !_isOnWater) then {
				_firstaid setVectorUp surfaceNormal position _firstaid;
			} else {
				_firstaid setVectorUp [0,0,1];
			};
			_objects pushBack _firstaid;
			
			_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
			sleep _section_time;
			
		};
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then {
			
			_direction = 10;
			_distance = 1.0;
			_heading = (_dir + _direction) mod 360;
			_newX = (_pos select 0) + (sin _heading * _distance);
			_newY = (_pos select 1) + (cos _heading * _distance);
			if (!_isInBuilding && !_isOnWater) then {
				_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
			} else {
				_newPos = [_newX, _newY, (_pos select 2) + 0.000];
			};
			private _defibrillator = objNull;
			if ((["adv_aceCPR"] call AXE_fnc_isAddon) && (missionNamespace getVariable ["axe_medical_area_enable_defibrillator", false])) then {
				_defibrillator = createVehicle ["Land_Defibrillator_F", [0,0,0], [], 0, "CAN_COLLIDE"];
				_defibrillator setDir (_dir + 60);
				_defibrillator setPosASL (AGLtoASL (_medArea modelToWorld [0.10,-0.55,-0.30]));
				[_defibrillator, false] call ACE_dragging_fnc_setCarryable;
			} else {
				_defibrillator = createSimpleObject ["Land_Defibrillator_F", [0,0,0]];
				_defibrillator setDir (_dir + 60);
				_defibrillator setPosASL _newPos;
				if (!_isInBuilding && !_isOnWater) then {
					_defibrillator setVectorUp surfaceNormal position _defibrillator;
				} else {
					_defibrillator setVectorUp [0,0,1];
				};
			};
			_objects pushBack _defibrillator;
			
			_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
			sleep _section_time;
			
		};
		
		if (Not AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) then {
			
			_direction = 350;
			_distance = 1.15;
			_heading = (_dir + _direction) mod 360;
			_newX = (_pos select 0) + (sin _heading * _distance);
			_newY = (_pos select 1) + (cos _heading * _distance);
			if (!_isInBuilding && !_isOnWater) then {
				_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
			} else {
				_newPos = [_newX, _newY, (_pos select 2) + 0.00];
			};
			private _bloodbag = createSimpleObject ["Land_BloodBag_F", [0,0,0]];
			_bloodbag setDir (_dir + 110);
			_bloodbag setPosASL _newPos;
			if (!_isInBuilding && !_isOnWater) then {
				_bloodbag setVectorUp surfaceNormal position _bloodbag;
			} else {
				_bloodbag setVectorUp [0,0,1];
			};
			_objects pushBack _bloodbag;
			
			_direction = 355;
			_distance = 1.8;
			_heading = (_dir + _direction) mod 360;
			_newX = (_pos select 0) + (sin _heading * _distance);
			_newY = (_pos select 1) + (cos _heading * _distance);
			if (!_isInBuilding && !_isOnWater) then {
				_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
			} else {
				_newPos = [_newX, _newY, (_pos select 2) + 0.00];
			};
			private _gloves = createSimpleObject ["MedicalGarbage_01_Gloves_F", [0,0,0]];
			_gloves setDir (_dir + 270);
			_gloves setPosASL _newPos;
			if (!_isInBuilding && !_isOnWater) then {
				_gloves setVectorUp surfaceNormal position _gloves;
			} else {
				_gloves setVectorUp [0,0,1];
			};
			_objects pushBack _gloves;
			
			_direction = 355;
			_distance = 1.25;
			_heading = (_dir + _direction) mod 360;
			_newX = (_pos select 0) + (sin _heading * _distance);
			_newY = (_pos select 1) + (cos _heading * _distance);
			if (!_isInBuilding && !_isOnWater) then {
				_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
			} else {
				_newPos = [_newX, _newY, (_pos select 2) + 0.00];
			};
			private _bandage1 = createSimpleObject ["Land_Bandage_F", [0,0,0]];
			_bandage1 setDir (_dir + 180);
			_bandage1 setPosASL _newPos;
			if (!_isInBuilding && !_isOnWater) then {
				_bandage1 setVectorUp surfaceNormal position _bandage1;
			} else {
				_bandage1 setVectorUp [0,0,1];
			};
			_objects pushBack _bandage1;
			
			_direction = 0;
			_distance = 1.30;
			_heading = (_dir + _direction) mod 360;
			_newX = (_pos select 0) + (sin _heading * _distance);
			_newY = (_pos select 1) + (cos _heading * _distance);
			if (!_isInBuilding && !_isOnWater) then {
				_newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
			} else {
				_newPos = [_newX, _newY, (_pos select 2) + 0.00];
			};
			private _bandage2 = createSimpleObject ["Land_Bandage_F", [0,0,0]];
			_bandage2 setDir (_dir + 60);
			_bandage2 setPosASL _newPos;
			if (!_isInBuilding && !_isOnWater) then {
				_bandage2 setVectorUp surfaceNormal position _bandage2;
			} else {
				_bandage2 setVectorUp [0,0,1];
			};
			_objects pushBack _bandage2;
			
			_medArea setVariable ["AXE_MedicalArea_Objects", _objects, true];
			sleep _section_time;
			
		};
		
	};
	
	waitUntil {if ((AXE_MEDICAL_AREA_CONSTRUCT_SUCCESS) || (AXE_MEDICAL_AREA_CONSTRUCT_FAILURE)) exitWith {true}; false};
	
	if (AXE_MEDICAL_AREA_CONSTRUCT_SUCCESS) exitWith {
		
		[_medArea, _medMenu] remoteExec ["AXE_medical_area_fnc_createActions", 0];
		_medHpad setVariable ["ACE_medical_isMedicalFacility", true, true];
		
		_unit removeItem "AXE_MedicArea";
		_unit playActionNow "MedicStop";
		
		[_unit, "AXE_Medical_Area_Construct_1"] call AXE_fnc_stop3dSound;
		
		["axe_medical_area_constructed", [_unit, _medArea]] call CBA_fnc_globalEvent;
		
	};
	
	if (AXE_MEDICAL_AREA_CONSTRUCT_FAILURE) exitWith {
		
		private _delObjects = +_objects;
		reverse _delObjects;
		
		{
			deleteVehicle _x;
			sleep 0.15;
		} forEach _delObjects;
		
		deleteVehicle _medArea;
		
		_unit playActionNow "MedicStop";
		
		[_unit, "AXE_Medical_Area_Construct_1"] call AXE_fnc_stop3dSound;
		
	};
	
};
