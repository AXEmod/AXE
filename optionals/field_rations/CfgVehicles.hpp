class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// FOOD BOX (BASE)
	
	class Land_PaperBox_01_small_closed_brown_F;
	
	class AXE_Field_Rations_Box_Base: Land_PaperBox_01_small_closed_brown_F {
		scope = 1;
		scopeArsenal = 0;
		scopeCurator = 0;
		author = "$STR_AXE_Field_Rations_Author";
		displayName = "";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_PaperBox_01_small_closed_brown_F.jpg";
		editorCategory = "EdCat_Supplies";
		editorSubcategory = "EdSubcat_Food";
		vehicleClass = "Ammo";
		hiddenSelections[] = {"Camo"};
		hiddenSelectionsTextures[] = {"\axe_field_rations\data\textures\box_mre_co.paa"};
		icon = "AXE_iconCrateDefault";
		maximumLoad = 250;
		ace_cookoff_probability = 0;
		ace_cargo_canLoad = 1;
		ace_cargo_size = 1;
		ace_dragging_canCarry = 1;
		ace_dragging_carryDirection = 0;
		ace_dragging_carryPosition[] = {0,0.7,1};
		ace_dragging_canDrag = 1;
		ace_dragging_dragDirection = 90;
		ace_dragging_dragPosition[] = {0,1.0,0};
		class TransportBackpacks {};
		class TransportItems {};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Field_Rations_Action_Box_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// FOOD BOX (MRE)
	
	class AXE_Field_Rations_Box_MRE: AXE_Field_Rations_Box_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Field_Rations_Box_MRE";
		editorPreview = "\axe_field_rations\data\preview\box_mre.jpg";
		hiddenSelections[] = {"Camo"};
		hiddenSelectionsTextures[] = {"\axe_field_rations\data\textures\box_mre_co.paa"};
		class TransportBackpacks {};
		class TransportItems {
			/* MACRO_ADDITEM(ACE_Humanitarian_Ration,10); */
			MACRO_ADDITEM(ACE_MRE_BeefStew,5);
			MACRO_ADDITEM(ACE_MRE_CreamChickenSoup,5);
			MACRO_ADDITEM(ACE_MRE_MeatballsPasta,5);
			MACRO_ADDITEM(ACE_MRE_ChickenHerbDumplings,5);
			MACRO_ADDITEM(ACE_MRE_ChickenTikkaMasala,5);
			MACRO_ADDITEM(ACE_MRE_LambCurry,5);
			MACRO_ADDITEM(ACE_MRE_CreamTomatoSoup,5);
			MACRO_ADDITEM(ACE_MRE_SteakVegetables,5);
		};
		class TransportMagazines {};
		class TransportWeapons {};
	};
	
	// FOOD BOX (RED GULL)
	
	class AXE_Field_Rations_Box_RedGull: AXE_Field_Rations_Box_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Field_Rations_Box_RedGull";
		editorPreview = "\axe_field_rations\data\preview\box_redgull.jpg";
		hiddenSelections[] = {"Camo"};
		hiddenSelectionsTextures[] = {"\axe_field_rations\data\textures\box_redgull_co.paa"};
		maximumLoad = 150;
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_Can_RedGull,40);
		};
		class TransportMagazines {};
		class TransportWeapons {};
	};
	
	// FOOD BOX (WATER)
	
	class AXE_Field_Rations_Box_Water: AXE_Field_Rations_Box_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Field_Rations_Box_Water";
		editorPreview = "\axe_field_rations\data\preview\box_water.jpg";
		hiddenSelections[] = {"Camo"};
		hiddenSelectionsTextures[] = {"\axe_field_rations\data\textures\box_water_co.paa"};
		maximumLoad = 150;
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_WaterBottle,20);
		};
		class TransportMagazines {};
		class TransportWeapons {};
	};
	
	// CANTEEN BOX [NATO]
	
	class Box_NATO_Support_F;
	
	class AXE_Field_Rations_Box_Canteen_NATO: Box_NATO_Support_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_AXE_Field_Rations_Author";
		displayName = "$STR_AXE_Field_Rations_Box_Canteen_NATO";
		editorCategory = "EdCat_Supplies";
		editorSubcategory = "EdSubcat_Food";
		vehicleClass = "Ammo";
		icon = "AXE_iconCrateDefault";
		maximumLoad = 250;
		ace_cookoff_probability = 0;
		ace_cargo_canLoad = 1;
		ace_cargo_size = 1;
		ace_dragging_canCarry = 1;
		ace_dragging_carryDirection = 90;
		ace_dragging_carryPosition[] = {0,1,1};
		ace_dragging_canDrag = 1;
		ace_dragging_dragDirection = 0;
		ace_dragging_dragPosition[] = {0,1.2,0};
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_Canteen,40);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Field_Rations_Action_Box_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// CANTEEN BOX [CSAT]
	
	class Box_East_Support_F;
	
	class AXE_Field_Rations_Box_Canteen_CSAT: Box_East_Support_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_AXE_Field_Rations_Author";
		displayName = "$STR_AXE_Field_Rations_Box_Canteen_CSAT";
		editorCategory = "EdCat_Supplies";
		editorSubcategory = "EdSubcat_Food";
		vehicleClass = "Ammo";
		icon = "AXE_iconCrateDefault";
		maximumLoad = 250;
		ace_cookoff_probability = 0;
		ace_cargo_canLoad = 1;
		ace_cargo_size = 1;
		ace_dragging_canCarry = 1;
		ace_dragging_carryDirection = 90;
		ace_dragging_carryPosition[] = {0,1,1};
		ace_dragging_canDrag = 1;
		ace_dragging_dragDirection = 0;
		ace_dragging_dragPosition[] = {0,1.2,0};
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_Canteen,40);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Field_Rations_Action_Box_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// CANTEEN BOX [AAF]
	
	class Box_IND_Support_F;
	
	class AXE_Field_Rations_Box_Canteen_AAF: Box_IND_Support_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_AXE_Field_Rations_Author";
		displayName = "$STR_AXE_Field_Rations_Box_Canteen_AAF";
		editorCategory = "EdCat_Supplies";
		editorSubcategory = "EdSubcat_Food";
		vehicleClass = "Ammo";
		icon = "AXE_iconCrateDefault";
		maximumLoad = 250;
		ace_cookoff_probability = 0;
		ace_cargo_canLoad = 1;
		ace_cargo_size = 1;
		ace_dragging_canCarry = 1;
		ace_dragging_carryDirection = 90;
		ace_dragging_carryPosition[] = {0,1,1};
		ace_dragging_canDrag = 1;
		ace_dragging_dragDirection = 0;
		ace_dragging_dragPosition[] = {0,1.2,0};
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_Canteen,40);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Field_Rations_Action_Box_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
	// CANTEEN BOX [LDF]
	
	class Box_EAF_Support_F;
	
	class AXE_Field_Rations_Box_Canteen_LDF: Box_EAF_Support_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_AXE_Field_Rations_Author";
		displayName = "$STR_AXE_Field_Rations_Box_Canteen_LDF";
		editorCategory = "EdCat_Supplies";
		editorSubcategory = "EdSubcat_Food";
		vehicleClass = "Ammo";
		icon = "AXE_iconCrateDefault";
		maximumLoad = 250;
		ace_cookoff_probability = 0;
		ace_cargo_canLoad = 1;
		ace_cargo_size = 1;
		ace_dragging_canCarry = 1;
		ace_dragging_carryDirection = 90;
		ace_dragging_carryPosition[] = {0,1,1};
		ace_dragging_canDrag = 1;
		ace_dragging_dragDirection = 0;
		ace_dragging_dragPosition[] = {0,1.2,0};
		class TransportBackpacks {};
		class TransportItems {
			MACRO_ADDITEM(ACE_Canteen,40);
		};
		class TransportMagazines {};
		class TransportWeapons {};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "$STR_ACE_Interaction_MainAction";
				distance = 2;
				condition = "true";
				statement = "";
				selection = "";
				icon = "";
				class AXE_OpenBox {
					displayName = "$STR_AXE_Field_Rations_Action_Box_Open";
					condition = "(alive _target) && {(getNumber (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'disableInventory')) == 0}";
					statement = "_player action ['Gear', _target]";
					showDisabled = 0;
					icon = "";
				};
			};
		};
	};
	
};
