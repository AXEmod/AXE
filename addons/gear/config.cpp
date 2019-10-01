#include "\axe_main\script_macros.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Gear {
		name = "$STR_AXE_Gear_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_common"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Gear_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Gear_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
