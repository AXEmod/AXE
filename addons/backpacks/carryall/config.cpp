#include "..\script_component.hpp"

class CfgPatches {
	
	class AXE_Backpacks_Carryall {
		name = "$STR_AXE_Backpacks_Carryall_Title";
		addonRootClass = "AXE_Backpacks";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_weapons_f_ammoboxes",
			"axe_backpacks"
		};
		units[] = {
			"AXE_Carryall_01_BLACK",
			"AXE_Carryall_01_BLACK_MEDIC",
			"AXE_Carryall_01_BW_D",
			"AXE_Carryall_01_BW_D_MEDIC",
			"AXE_Carryall_01_BW_W",
			"AXE_Carryall_01_BW_W_MEDIC",
			"AXE_Carryall_01_COYOTE",
			"AXE_Carryall_01_COYOTE_MEDIC",
			"AXE_Carryall_01_GREEN_DARK",
			"AXE_Carryall_01_GREEN_DARK_MEDIC",
			"AXE_Carryall_01_GREEN_DGTL",
			"AXE_Carryall_01_GREEN_DGTL_MEDIC",
			"AXE_Carryall_01_GREEN_RNGR",
			"AXE_Carryall_01_GREEN_RNGR_MEDIC",
			"AXE_Carryall_01_HEX_CAMO",
			"AXE_Carryall_01_HEX_CAMO_MEDIC",
			"AXE_Carryall_01_HEX_GREEN",
			"AXE_Carryall_01_HEX_GREEN_MEDIC",
			"AXE_Carryall_01_MARPAT_D",
			"AXE_Carryall_01_MARPAT_D_MEDIC",
			"AXE_Carryall_01_MARPAT_W",
			"AXE_Carryall_01_MARPAT_W_MEDIC",
			"AXE_Carryall_01_MTP",
			"AXE_Carryall_01_MTP_MEDIC",
			"AXE_Carryall_01_OCP",
			"AXE_Carryall_01_OCP_MEDIC",
			"AXE_Carryall_01_UCP",
			"AXE_Carryall_01_UCP_MEDIC",
			"AXE_Carryall_01_WDL",
			"AXE_Carryall_01_WDL_MEDIC",
			"AXE_Carryall_01_WDL2",
			"AXE_Carryall_01_WDL2_MEDIC"
		};
		weapons[] = {};
		author = "$STR_AXE_Backpacks_Carryall_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Backpacks_Carryall_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgVehicles.hpp"
