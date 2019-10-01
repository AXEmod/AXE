class CfgWeapons {
	
	class CBA_MiscItem;
	class CBA_MiscItem_ItemInfo;
	class ACE_ItemCore: CBA_MiscItem {};
	
	// MEDICAL ITEMS
	
	class AXE_Stethoscope: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Medical_Items_Author";
		displayName = "$STR_AXE_Item_Medical_Stethoscope_DisplayName";
		descriptionShort = "$STR_AXE_Item_Medical_Stethoscope_Description";
		editorPreview = "\axe_medical\items\data\previews\stethoscope.jpg";
		picture = "\axe_medical\items\data\ui\stethoscope_ca.paa";
		model = "\A3\Props_F_Orange\Humanitarian\Camps\Stethoscope_01_F.p3d";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
};
