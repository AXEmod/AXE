#include "\axe_main\script_macros.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Common {
		name = "$STR_AXE_Common_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_main",
			"axe_hints"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Common_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Common_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
