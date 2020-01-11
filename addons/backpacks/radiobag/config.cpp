#include "..\script_component.hpp"

class CfgPatches {
	
	class AXE_Backpacks_RadioBag {
		name = "$STR_AXE_Backpacks_RadioBag_Title";
		addonRootClass = "AXE_Backpacks";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_backpacks",
			"a3_supplies_f_enoch_bags"
		};
		units[] = {
			"AXE_RadioBag_01_BLACK",
			"AXE_RadioBag_01_BW_D",
			"AXE_RadioBag_01_BW_W",
			"AXE_RadioBag_01_COYOTE",
			"AXE_RadioBag_01_GEOMETRIC",
			"AXE_RadioBag_01_GREEN_DARK",
			"AXE_RadioBag_01_GREEN_DGTL",
			"AXE_RadioBag_01_GREEN_RNGR",
			"AXE_RadioBag_01_HEX_CAMO",
			"AXE_RadioBag_01_HEX_GREEN",
			"AXE_RadioBag_01_MARPAT_D",
			"AXE_RadioBag_01_MARPAT_W",
			"AXE_RadioBag_01_MTP",
			"AXE_RadioBag_01_OCP",
			"AXE_RadioBag_01_TROPIC",
			"AXE_RadioBag_01_UCP",
			"AXE_RadioBag_01_URBAN",
			"AXE_RadioBag_01_WDL",
			"AXE_RadioBag_01_WDL2"
		};
		weapons[] = {};
		author = "$STR_AXE_Backpacks_RadioBag_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Backpacks_RadioBag_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgVehicles.hpp"
