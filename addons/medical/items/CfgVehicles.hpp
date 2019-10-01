class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	class Item_Base_F;
	
	// MEDICAL ITEMS
	
	class AXE_Item_Stethoscope: Item_Base_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_AXE_Medical_Items_Author";
		displayName = "$STR_AXE_Item_Medical_Stethoscope_DisplayName";
		editorPreview = "\axe_medical\items\data\previews\stethoscope.jpg";
		vehicleClass = "Items";
		class TransportItems {
			MACRO_ADDITEM(AXE_Stethoscope,1);
		};
	};
	
};
