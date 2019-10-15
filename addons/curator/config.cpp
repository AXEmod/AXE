#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_Curator {
		name = "$STR_AXE_Curator_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_common"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_Curator_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_Curator_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgDebriefing.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
