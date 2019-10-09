#include "\axe_main\script_macros.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Teleport {
		name = "$STR_AXE_Teleport_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_common"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Teleport_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Teleport_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
