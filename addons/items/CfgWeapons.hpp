class CfgWeapons {
	
	class CBA_MiscItem;
	class CBA_MiscItem_ItemInfo;
	class ACE_ItemCore: CBA_MiscItem {};
	
	// TAGS/CARDS
	
	class AXE_ClothingCard: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_ClothingCard_DisplayName";
		descriptionShort = "$STR_AXE_Item_ClothingCard_Description";
		editorPreview = "\axe_items\data\previews\ClothingCard.jpg";
		model = "\z\ace\addons\dogtags\data\ace_dogtag.p3d";
		picture = "\z\ace\addons\dogtags\data\dogtagSingle.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	class AXE_WeaponCard: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_WeaponCard_DisplayName";
		descriptionShort = "$STR_AXE_Item_WeaponCard_Description";
		editorPreview = "\axe_items\data\previews\WeaponCard.jpg";
		model = "\z\ace\addons\dogtags\data\ace_dogtag.p3d";
		picture = "\z\ace\addons\dogtags\data\dogtagSingle.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	// PROTEST
	
	class AXE_ProtestSign: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_ProtestSign_DisplayName";
		descriptionShort = "$STR_AXE_Item_ProtestSign_Description";
		editorPreview = "\axe_items\data\previews\ProtestSign.jpg";
		model = "\A3\Structures_F_EPB\Items\Documents\Poster_04_F.p3d";
		picture = "\axe_items\data\ui\protestsign_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 30;
		};
	};
	
	// INTEL
	
	class AXE_File_V1: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_File_V1_DisplayName";
		descriptionShort = "$STR_AXE_Item_File_V1_Description";
		editorPreview = "\axe_items\data\previews\File_V1.jpg";
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\axe_items\data\ui\file_v1_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	class AXE_File_V2: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_File_V2_DisplayName";
		descriptionShort = "$STR_AXE_Item_File_V2_Description";
		editorPreview = "\axe_items\data\previews\File_V2.jpg";
		model = "\A3\Structures_F\Items\Documents\File2_F.p3d";
		picture = "\axe_items\data\ui\file_v2_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	class AXE_File_V3: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_File_V3_DisplayName";
		descriptionShort = "$STR_AXE_Item_File_V3_Description";
		editorPreview = "\axe_items\data\previews\File_V3.jpg";
		model = "\A3\Structures_F\Items\Documents\FilePhotos_F.p3d";
		picture = "\axe_items\data\ui\file_v3_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	class AXE_File_V4: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_File_V4_DisplayName";
		descriptionShort = "$STR_AXE_Item_File_V4_Description";
		editorPreview = "\axe_items\data\previews\File_V4.jpg";
		model = "\A3\Structures_F\Items\Documents\File2_F.p3d";
		picture = "\axe_items\data\ui\file_v4_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	class AXE_File_V5: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_File_V5_DisplayName";
		descriptionShort = "$STR_AXE_Item_File_V5_Description";
		editorPreview = "\axe_items\data\previews\File_V5.jpg";
		model = "\A3\Structures_F_EPC\Items\Documents\Document_01_F.p3d";
		picture = "\axe_items\data\ui\file_v5_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	class AXE_MoneyPile: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_MoneyPile_DisplayName";
		descriptionShort = "$STR_AXE_Item_MoneyPile_Description";
		editorPreview = "\axe_items\data\previews\MoneyPile.jpg";
		model = "\A3\Structures_F\Items\Valuables\Money_F.p3d";
		picture = "\axe_items\data\ui\money_pile_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 3;
		};
	};
	
	class AXE_Notepad: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Notepad_DisplayName";
		descriptionShort = "$STR_AXE_Item_Notepad_Description";
		editorPreview = "\axe_items\data\previews\Notepad.jpg";
		model = "\A3\Structures_F\Items\Documents\Notepad_F.p3d";
		picture = "\axe_items\data\ui\notepad_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 1;
		};
	};
	
	class AXE_Wallet: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Wallet_DisplayName";
		descriptionShort = "$STR_AXE_Item_Wallet_Description";
		editorPreview = "\axe_items\data\previews\Wallet.jpg";
		model = "\a3\Props_F_Orange\Items\Documents\Wallet_01_F.p3d";
		picture = "\axe_items\data\ui\wallet_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 3;
		};
	};
	
	// ELECTRONICS
	
	class AXE_Battery: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Battery_DisplayName";
		descriptionShort = "$STR_AXE_Item_Battery_Description";
		editorPreview = "\axe_items\data\previews\Battery.jpg";
		model = "\A3\Structures_F_EPA\Items\Electronics\Battery_F.p3d";
		picture = "\axe_items\data\ui\battery_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_Battery_Car: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Battery_Car_DisplayName";
		descriptionShort = "$STR_AXE_Item_Battery_Car_Description";
		editorPreview = "\axe_items\data\previews\CarBattery_V2.jpg";
		model = "\A3\Structures_F_Bootcamp\Items\Electronics\CarBattery_02_F.p3d";
		picture = "\axe_items\data\ui\battery_car_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 40;
		};
	};
	
	class AXE_Battery_Truck: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Battery_Truck_DisplayName";
		descriptionShort = "$STR_AXE_Item_Battery_Truck_Description";
		editorPreview = "\axe_items\data\previews\CarBattery_V1.jpg";
		model = "\A3\Structures_F_Bootcamp\Items\Electronics\CarBattery_01_F.p3d";
		picture = "\axe_items\data\ui\battery_truck_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 60;
		};
	};
	
	class AXE_Camera_V1: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Camera_V1_DisplayName";
		descriptionShort = "$STR_AXE_Item_Camera_V1_Description";
		editorPreview = "\axe_items\data\previews\Camera_V1.jpg";
		model = "\A3\Structures_F_Heli\Items\Electronics\Camera_01_F.p3d";
		picture = "\axe_items\data\ui\camera_v1_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_HandyCam: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_HandyCam_DisplayName";
		descriptionShort = "$STR_AXE_Item_HandyCam_Description";
		editorPreview = "\axe_items\data\previews\HandyCam.jpg";
		model = "\A3\Structures_F\Items\Electronics\HandyCam_F.p3d";
		picture = "\axe_items\data\ui\handycam_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_MobilePhone_Old: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_MobilePhoneOld_DisplayName";
		descriptionShort = "$STR_AXE_Item_MobilePhoneOld_Description";
		editorPreview = "\axe_items\data\previews\MobilePhone_Old.jpg";
		model = "\A3\Structures_F\Items\Electronics\MobilePhone_old_F.p3d";
		picture = "\axe_items\data\ui\mobilephone_old_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_MobilePhone_Smart: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_MobilePhoneSmart_DisplayName";
		descriptionShort = "$STR_AXE_Item_MobilePhoneSmart_Description";
		editorPreview = "\axe_items\data\previews\MobilePhone_Smart.jpg";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_items\data\textures\smartphone_01_co.paa"};
		hiddenSelectionsMaterials[] = {"\A3\Structures_F\Items\Electronics\Data\electronics_screens.rvmat"};
		model = "\A3\Structures_F\Items\Electronics\MobilePhone_smart_F.p3d";
		picture = "\axe_items\data\ui\mobilephone_smart_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		selectionDamage = "zbytek";
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_Tablet_V1: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Tablet_V1_DisplayName";
		descriptionShort = "$STR_AXE_Item_Tablet_V1_Description";
		editorPreview = "\axe_items\data\previews\Tablet_V1.jpg";
		model = "\A3\Structures_F_Heli\Items\Electronics\Tablet_01_F.p3d";
		picture = "\axe_items\data\ui\tablet_v1_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	class AXE_Tablet_V2: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Tablet_V2_DisplayName";
		descriptionShort = "$STR_AXE_Item_Tablet_V2_Description";
		editorPreview = "\axe_items\data\previews\Tablet_V2.jpg";
		model = "\A3\Props_F_Exp_A\Military\Equipment\Tablet_02_F.p3d";
		picture = "\axe_items\data\ui\tablet_v2_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	// TOOLS
	
	class AXE_Axe_V1: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Axe_V1_DisplayName";
		descriptionShort = "$STR_AXE_Item_Axe_V1_Description";
		editorPreview = "\axe_items\data\previews\Axe_V1.jpg";
		model = "\A3\Structures_F\Items\Tools\Axe_F.p3d";
		picture = "\axe_items\data\ui\axe_v1_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 20;
		};
	};
	
	class AXE_Axe_V2: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Axe_V2_DisplayName";
		descriptionShort = "$STR_AXE_Item_Axe_V2_Description";
		editorPreview = "\axe_items\data\previews\Axe_V2.jpg";
		model = "\A3\Structures_F\Items\Tools\Axe_fire_F.p3d";
		picture = "\axe_items\data\ui\axe_v2_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 20;
		};
	};
	
	class AXE_Bucket: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Bucket_DisplayName";
		descriptionShort = "$STR_AXE_Item_Bucket_Description";
		editorPreview = "\axe_items\data\previews\Bucket.jpg";
		model = "\A3\Structures_F\Items\Vessels\Bucket_F.p3d";
		picture = "\axe_items\data\ui\bucket_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 20;
		};
	};
	
	class AXE_CanOpener: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_CanOpener_DisplayName";
		descriptionShort = "$STR_AXE_Item_CanOpener_Description";
		editorPreview = "\axe_items\data\previews\CanOpener.jpg";
		model = "\A3\Structures_F_EPA\Items\Tools\CanOpener_F.p3d";
		picture = "\axe_items\data\ui\canopener_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 3;
		};
	};
	
	class AXE_Crowbar: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Crowbar_DisplayName";
		descriptionShort = "$STR_AXE_Item_Crowbar_Description";
		editorPreview = "\axe_items\data\previews\Crowbar.jpg";
		model = "\a3\Props_F_Orange\Items\Tools\Crowbar_01_F.p3d";
		picture = "\axe_items\data\ui\crowbar_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	class AXE_DrillAku: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_DrillAku_DisplayName";
		descriptionShort = "$STR_AXE_Item_DrillAku_Description";
		editorPreview = "\axe_items\data\previews\DrillAku.jpg";
		model = "\A3\Structures_F\Items\Tools\DrillAku_F.p3d";
		picture = "\axe_items\data\ui\drillaku_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	class AXE_DuctTape: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_DuctTape_DisplayName";
		descriptionShort = "$STR_AXE_Item_DuctTape_Description";
		editorPreview = "\axe_items\data\previews\DuctTape.jpg";
		model = "\A3\Structures_F_EPA\Items\Tools\DuctTape_F.p3d";
		picture = "\axe_items\data\ui\ducttape_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_File: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_File_DisplayName";
		descriptionShort = "$STR_AXE_Item_File_Description";
		editorPreview = "\axe_items\data\previews\File.jpg";
		model = "\A3\Structures_F\Items\Tools\File_F.p3d";
		picture = "\axe_items\data\ui\file_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_FireExtinguisher: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_FireExtinguisher_DisplayName";
		descriptionShort = "$STR_AXE_Item_FireExtinguisher_Description";
		editorPreview = "\axe_items\data\previews\FireExtinguisher.jpg";
		model = "\A3\Structures_F_EPA\Items\Tools\FireExtinguisher_F.p3d";
		picture = "\axe_items\data\ui\fireextinguisher_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 30;
		};
	};
	
	class AXE_Hammer: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Hammer_DisplayName";
		descriptionShort = "$STR_AXE_Item_Hammer_Description";
		editorPreview = "\axe_items\data\previews\Hammer.jpg";
		model = "\A3\Structures_F\Items\Tools\Hammer_F.p3d";
		picture = "\axe_items\data\ui\hammer_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 25;
		};
	};
	
	class AXE_MetalWire: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_MetalWire_DisplayName";
		descriptionShort = "$STR_AXE_Item_MetalWire_Description";
		editorPreview = "\axe_items\data\previews\MetalWire.jpg";
		model = "\A3\Structures_F_EPA\Items\Tools\MetalWire_F.p3d";
		picture = "\axe_items\data\ui\metalwire_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 2;
		};
	};
	
	class AXE_MultiMeter: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_MultiMeter_DisplayName";
		descriptionShort = "$STR_AXE_Item_MultiMeter_Description";
		editorPreview = "\axe_items\data\previews\MultiMeter.jpg";
		model = "\A3\Structures_F\Items\Tools\MultiMeter_F.p3d";
		picture = "\axe_items\data\ui\multimeter_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	class AXE_Pliers: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Pliers_DisplayName";
		descriptionShort = "$STR_AXE_Item_Pliers_Description";
		editorPreview = "\axe_items\data\previews\Pliers.jpg";
		model = "\A3\Structures_F\Items\Tools\Pliers_F.p3d";
		picture = "\axe_items\data\ui\pliers_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_Rope: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Rope_DisplayName";
		descriptionShort = "$STR_AXE_Item_Rope_Description";
		editorPreview = "\axe_items\data\previews\Rope.jpg";
		model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
		picture = "\axe_items\data\ui\rope_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	class AXE_Saw: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Saw_DisplayName";
		descriptionShort = "$STR_AXE_Item_Saw_Description";
		editorPreview = "\axe_items\data\previews\Saw.jpg";
		model = "\A3\Structures_F\Items\Tools\Saw_F.p3d";
		picture = "\axe_items\data\ui\saw_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	class AXE_Screwdriver_V1: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Screwdriver_V1_DisplayName";
		descriptionShort = "$STR_AXE_Item_Screwdriver_V1_Description";
		editorPreview = "\axe_items\data\previews\Screwdriver_V1.jpg";
		model = "\A3\Structures_F\Items\Tools\Screwdriver_V1_F.p3d";
		picture = "\axe_items\data\ui\screwdriver_v1_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_Screwdriver_V2: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Screwdriver_V2_DisplayName";
		descriptionShort = "$STR_AXE_Item_Screwdriver_V2_Description";
		editorPreview = "\axe_items\data\previews\Screwdriver_V2.jpg";
		model = "\A3\Structures_F\Items\Tools\Screwdriver_V2_F.p3d";
		picture = "\axe_items\data\ui\screwdriver_v2_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
	
	class AXE_Shovel: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Shovel_DisplayName";
		descriptionShort = "$STR_AXE_Item_Shovel_Description";
		editorPreview = "\axe_items\data\previews\Shovel.jpg";
		model = "\A3\Structures_F_EPA\Items\Tools\Shovel_F.p3d";
		picture = "\axe_items\data\ui\shovel_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 20;
		};
	};
	
	class AXE_Wrench: ACE_ItemCore {
		scope = 2;
		author = "$STR_AXE_Items_Author";
		displayName = "$STR_AXE_Item_Wrench_DisplayName";
		descriptionShort = "$STR_AXE_Item_Wrench_Description";
		editorPreview = "\axe_items\data\previews\Wrench.jpg";
		model = "\A3\Structures_F\Items\Tools\Wrench_F.p3d";
		picture = "\axe_items\data\ui\wrench_ca.paa";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 20;
		};
	};
	
};
