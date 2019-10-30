#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Backpacks {
		name = "$STR_AXE_Backpacks_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_weapons_f",
			"axe_main"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Backpacks_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Backpacks_URL";
		VERSION_CONFIG;
	};
	
};
