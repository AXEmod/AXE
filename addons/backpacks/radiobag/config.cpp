#include "..\script_component.hpp"

class CfgPatches {
	
	class AXE_Backpacks_RadioBag {
		name = "$STR_AXE_Backpacks_RadioBag_Title";
		addonRootClass = "AXE_Backpacks";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_supplies_f_enoch_bags",
			"axe_backpacks"
		};
		units[] = {
			"AXE_RadioBag_01_BLACK",
			"AXE_RadioBag_01_DIGI",
			"AXE_RadioBag_01_EAF",
			"AXE_RadioBag_01_GHEX",
			"AXE_RadioBag_01_HEX",
			"AXE_RadioBag_01_MTP",
			"AXE_RadioBag_01_TROPIC",
			"AXE_RadioBag_01_OUCAMO",
			"AXE_RadioBag_01_WDL"
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
