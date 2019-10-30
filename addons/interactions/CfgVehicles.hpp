class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	class Man;
	class CAManBase: Man {
		
		class ACE_Actions {
			
			// exceptions[] = {"isNotDead", "isNotUnconscious", "isNotSurrendering", "isNotHandcuffed", "isNotCarrying", "isNotDragging", "isNotEscorting", "isNotSwimming", "isNotRefueling", "isNotOnLadder", "isNotSitting", "isNotInside", "isNotInZeus", "notOnMap"};
			
			/* SHOULDER TAP */
			
			class ACE_TapShoulderLeft   { condition = "false"; };
			class ACE_TapShoulderRight  { condition = "false"; };
			
			class AXE_Interactions_Action_TapShoulder_Left {
				displayName = "$STR_AXE_Interactions_Action_TapShoulder";
				condition = "[_player, _target] call AXE_interactions_fnc_tapshoulder_canTap";
				statement = "[_player, _target, 0] call AXE_interactions_fnc_tapshoulder_doTap";
				exceptions[] = {"isNotSwimming"};
				selection = "LeftShoulder";
				showDisabled = 0;
				distance = 2.0;
			};
			
			class AXE_Interactions_Action_TapShoulder_Right {
				displayName = "$STR_AXE_Interactions_Action_TapShoulder";
				condition = "[_player, _target] call AXE_interactions_fnc_tapshoulder_canTap";
				statement = "[_player, _target, 1] call AXE_interactions_fnc_tapshoulder_doTap";
				exceptions[] = {"isNotSwimming"};
				selection = "RightShoulder";
				showDisabled = 0;
				distance = 2.0;
			};
			
			class ACE_MainActions {
				
				/* BACKPACK ACCESS */
				
				class AXE_Interactions_Action_Backpack_Access {
					displayName = "$STR_AXE_Interactions_Action_Backpack_Access";
					condition = "[_player, _target] call AXE_interactions_fnc_backpack_canAccess";
					statement = "[_player, _target] call AXE_interactions_fnc_backpack_doAccess";
					exceptions[] = {};
					icon = "\axe_interactions\data\icons\search_backpack_ca.paa";
					showDisabled = 0;
				};
				
				/* GEAR ACCESS */
				
				class AXE_Interactions_Action_Gear_Access {
					displayName = "$STR_AXE_Interactions_Action_Gear_Access";
					condition = "[_player, _target] call AXE_interactions_fnc_gear_canAccess";
					statement = "[_player, _target] call AXE_interactions_fnc_gear_doAccess";
					exceptions[] = {};
					icon = "\axe_interactions\data\icons\search_gear_ca.paa";
					showDisabled = 0;
				};
				
				/* DISARMING */
				
				class ACE_DisarmInventory { condition = "false"; };
				
			};
			
		};
		
	};
	
};
