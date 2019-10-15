#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Items {
		name = "$STR_AXE_Items_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_main"
		};
		units[] = {
			"AXE_Item_ClothingCard",
			"AXE_Item_WeaponCard",
			"AXE_Item_ProtestSign",
			"AXE_Item_File_V1",
			"AXE_Item_File_V2",
			"AXE_Item_File_V3",
			"AXE_Item_File_V4",
			"AXE_Item_File_V5",
			"AXE_Item_MoneyPile",
			"AXE_Item_Notepad",
			"AXE_Item_Wallet",
			"AXE_Item_Battery",
			"AXE_Item_Battery_Car",
			"AXE_Item_Battery_Truck",
			"AXE_Item_Camera_V1",
			"AXE_Item_HandyCam",
			"AXE_Item_MobilePhone_Old",
			"AXE_Item_MobilePhone_Smart",
			"AXE_Item_Tablet_V1",
			"AXE_Item_Tablet_V2",
			"AXE_Item_Axe_V1",
			"AXE_Item_Axe_V2",
			"AXE_Item_Bucket",
			"AXE_Item_CanOpener",
			"AXE_Item_Crowbar",
			"AXE_Item_DrillAku",
			"AXE_Item_DuctTape",
			"AXE_Item_File",
			"AXE_Item_FireExtinguisher",
			"AXE_Item_Hammer",
			"AXE_Item_MetalWire",
			"AXE_Item_MultiMeter",
			"AXE_Item_Pliers",
			"AXE_Item_Rope",
			"AXE_Item_Saw",
			"AXE_Item_Screwdriver_V1",
			"AXE_Item_Screwdriver_V2",
			"AXE_Item_Shovel",
			"AXE_Item_Wrench"
		};
		weapons[] = {
			"AXE_ClothingCard",
			"AXE_WeaponCard",
			"AXE_ProtestSign",
			"AXE_File_V1",
			"AXE_File_V2",
			"AXE_File_V3",
			"AXE_File_V4",
			"AXE_File_V5",
			"AXE_MoneyPile",
			"AXE_Notepad",
			"AXE_Wallet",
			"AXE_Battery",
			"AXE_Battery_Car",
			"AXE_Battery_Truck",
			"AXE_Camera_V1",
			"AXE_HandyCam",
			"AXE_MobilePhone_Old",
			"AXE_MobilePhone_Smart",
			"AXE_Tablet_V1",
			"AXE_Tablet_V2",
			"AXE_Axe_V1",
			"AXE_Axe_V2",
			"AXE_Bucket",
			"AXE_CanOpener",
			"AXE_Crowbar",
			"AXE_DrillAku",
			"AXE_DuctTape",
			"AXE_File",
			"AXE_FireExtinguisher",
			"AXE_Hammer",
			"AXE_MetalWire",
			"AXE_MultiMeter",
			"AXE_Pliers",
			"AXE_Rope",
			"AXE_Saw",
			"AXE_Screwdriver_V1",
			"AXE_Screwdriver_V2",
			"AXE_Shovel",
			"AXE_Wrench"
		};
		author = "$STR_AXE_Items_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Items_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
