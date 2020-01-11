#include "..\script_component.hpp"

class CfgPatches {
	
	class AXE_Backpacks_Kitbag {
		name = "$STR_AXE_Backpacks_Kitbag_Title";
		addonRootClass = "AXE_Backpacks";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_backpacks",
			"a3_weapons_f_ammoboxes"
		};
		units[] = {
			"AXE_Kitbag_01_BLACK",
			"AXE_Kitbag_01_BLACK_MEDIC",
			"AXE_Kitbag_01_BW_D",
			"AXE_Kitbag_01_BW_D_MEDIC",
			"AXE_Kitbag_01_BW_W",
			"AXE_Kitbag_01_BW_W_MEDIC",
			"AXE_Kitbag_01_COYOTE",
			"AXE_Kitbag_01_COYOTE_MEDIC",
			"AXE_Kitbag_01_GREEN_DARK",
			"AXE_Kitbag_01_GREEN_DARK_MEDIC",
			"AXE_Kitbag_01_GREEN_DGTL",
			"AXE_Kitbag_01_GREEN_DGTL_MEDIC",
			"AXE_Kitbag_01_GREEN_RNGR",
			"AXE_Kitbag_01_GREEN_RNGR_MEDIC",
			"AXE_Kitbag_01_HEX_CAMO",
			"AXE_Kitbag_01_HEX_CAMO_MEDIC",
			"AXE_Kitbag_01_HEX_GREEN",
			"AXE_Kitbag_01_HEX_GREEN_MEDIC",
			"AXE_Kitbag_01_MARPAT_D",
			"AXE_Kitbag_01_MARPAT_D_MEDIC",
			"AXE_Kitbag_01_MARPAT_W",
			"AXE_Kitbag_01_MARPAT_W_MEDIC",
			"AXE_Kitbag_01_MTP",
			"AXE_Kitbag_01_MTP_MEDIC",
			"AXE_Kitbag_01_OCP",
			"AXE_Kitbag_01_OCP_MEDIC",
			"AXE_Kitbag_01_TROPIC",
			"AXE_Kitbag_01_TROPIC_MEDIC",
			"AXE_Kitbag_01_UCP",
			"AXE_Kitbag_01_UCP_MEDIC",
			"AXE_Kitbag_01_WDL",
			"AXE_Kitbag_01_WDL_MEDIC",
			"AXE_Kitbag_01_WDL2",
			"AXE_Kitbag_01_WDL2_MEDIC"
		};
		weapons[] = {};
		author = "$STR_AXE_Backpacks_Kitbag_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Backpacks_Kitbag_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgVehicles.hpp"
