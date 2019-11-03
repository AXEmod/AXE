class CfgVehicles {
	
	// MODULES
	
	class Logic;
	class Module_F: Logic {
		class AttributesBase {
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class ModuleDescription;
		};
		class ModuleDescription {
			class AnyBrain;
		};
	};
	
	// MODULE: TELEPORT NETWORK
	
	class AXE_ModuleTeleportNetwork: Module_F {
		
		scope = 2;
		
		displayName = "$STR_AXE_Teleport_Module_displayName";
		category = "AXE";
		author = "$STR_AXE_Teleport_Author";
		icon = "\axe_teleport\data\icons\module_teleport_network_ca.paa";
		
		function = "";
		functionPriority = 1;
		
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 1;
		
		class Attributes: AttributesBase {
			
			class Enabled {
				displayName = "$STR_AXE_Teleport_Module_Property_Enabled_Title";
				tooltip = "$STR_AXE_Teleport_Module_Property_Enabled_Tip";
				defaultValue = 1;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_ModuleTeleportNetwork_Enabled";
				control = "Combo";
				class Values {
					class Enabled_0	{
						name = "$STR_AXE_Teleport_Module_Property_Enabled_0";
						value = 0;
					};
					class Enabled_1	{
						name = "$STR_AXE_Teleport_Module_Property_Enabled_1";
						value = 1;
					};
				};
			};
			
			class ModuleDescription: ModuleDescription {
				property = "ModuleInfo";
				control = "ModuleInfo";
			};
			
		};
		
		class ModuleDescription: ModuleDescription {
			description = "$STR_AXE_Teleport_Module_Description";
		};
		
	};
	
	// OBJECT: TELEPORT FLAG
	
	class Flag_White_F;
	
	class AXE_Flag_Teleport: Flag_White_F {
		
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		
		author = "$STR_AXE_Teleport_Author";
		displayName = "$STR_AXE_Teleport_Flag_displayName";
		descriptionShort = "$STR_AXE_Teleport_Flag_Description";
		editorPreview = "\axe_teleport\data\previews\flag_teleport.jpg";
		
		editorCategory = "EdCat_Signs";
		editorSubcategory = "EdSubcat_Flags";
		vehicleClass = "Flag";
		side = 3;
		
		class EventHandlers {
			init = "(_this select 0) setFlagTexture ((_this select 0) getVariable ['FlagTexture', '\axe_teleport\data\textures\flag_teleport_co.paa']);";
		};
		
		class Attributes {
			
			class Enabled {
				displayName = "$STR_AXE_Teleport_Flag_Property_Enabled_Title";
				tooltip = "$STR_AXE_Teleport_Flag_Property_Enabled_Tip";
				defaultValue = 0;
				typeName = "NUMBER";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_FlagTeleport_Enabled";
				control = "Combo";
				class Values {
					class Enabled_0	{
						name = "$STR_AXE_Teleport_Flag_Property_Enabled_0";
						value = 0;
					};
					class Enabled_1	{
						name = "$STR_AXE_Teleport_Flag_Property_Enabled_1";
						value = 1;
					};
				};
			};
			
			class FlagName {
				displayName = "$STR_AXE_Teleport_Flag_Property_FlagName_Title";
				tooltip = "$STR_AXE_Teleport_Flag_Property_FlagName_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_FlagTeleport_FlagName";
				control = "Edit";
			};
			
			class Network {
				displayName = "$STR_AXE_Teleport_Flag_Property_Network_Title";
				tooltip = "$STR_AXE_Teleport_Flag_Property_Network_Tip";
				defaultValue = "''";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_FlagTeleport_Network";
				control = "Edit";
			};
			
			class isArrival {
				displayName = "$STR_AXE_Teleport_Flag_Property_IsArrival_Title";
				tooltip = "$STR_AXE_Teleport_Flag_Property_IsArrival_Tip";
				defaultValue = "false";
				typeName = "BOOL";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_FlagTeleport_IsArrival";
				control = "Checkbox";
			};
			
			class isDeparture {
				displayName = "$STR_AXE_Teleport_Flag_Property_IsDeparture_Title";
				tooltip = "$STR_AXE_Teleport_Flag_Property_IsDeparture_Tip";
				defaultValue = "false";
				typeName = "BOOL";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_FlagTeleport_IsDeparture";
				control = "Checkbox";
			};
			
			class isGroup {
				displayName = "$STR_AXE_Teleport_Flag_Property_IsGroup_Title";
				tooltip = "$STR_AXE_Teleport_Flag_Property_IsGroup_Tip";
				defaultValue = "false";
				typeName = "BOOL";
				expression = "_this setVariable ['%s', _value, true];";
				property = "AXE_FlagTeleport_IsGroup";
				control = "Checkbox";
			};
			
			class FlagTexture {
				displayName = "$STR_AXE_Teleport_Flag_Property_FlagTexture_Title";
				tooltip = "$STR_AXE_Teleport_Flag_Property_FlagTexture_Tip";
				defaultValue = "flagTexture _this";
				typeName = "STRING";
				expression = "_this setVariable ['%s', _value, true]; _this setFlagTexture _value;";
				property = "AXE_FlagTeleport_FlagTexture";
				control = "Edit";
			};
			
		};
		
		class ACE_Actions {
			
			class ACE_MainActions {
				
				displayName = "$STR_AXE_Teleport_Flag_Action_Main";
				condition = "[_target] call AXE_teleport_fnc_flag_isEnabled";
				statement = "";
				position = [-0.1,-0.4,-2.55];
				distance = 3;
				icon = "";
				
				class AXE_Flag_Teleport_Action_toFlag {
					displayName = "$STR_AXE_Teleport_Flag_Action_toFlag";
					condition = "[_player, _target] call AXE_teleport_fnc_flag_showFlags";
					statement = "true";
					insertChildren = "[_player, _target] call AXE_teleport_fnc_flag_getFlags";
					exceptions[] = {};
					showDisabled = 0;
					runOnHover = 1;
					icon = "";
				};
				
				class AXE_Flag_Teleport_Action_toGroup {
					displayName = "$STR_AXE_Teleport_Flag_Action_toGroup";
					condition = "[_player, _target] call AXE_teleport_fnc_flag_showGroups";
					statement = "true";
					insertChildren = "[_player, _target] call AXE_teleport_fnc_flag_getGroups";
					exceptions[] = {};
					showDisabled = 0;
					runOnHover = 1;
					icon = "";
				};
				
			};
			
		};
		
	};
	
};
