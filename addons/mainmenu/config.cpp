#include "script_component.hpp"
#include "BIS_AddonInfo.hpp"

class CfgPatches {
	
	class AXE_MainMenu {
		name = "$STR_AXE_MainMenu_Title";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"axe_main"
		};
		units[] = {};
		weapons[] = {};
		author = "$STR_AXE_MainMenu_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_AXE_MainMenu_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgAddons.hpp"
#include "CfgCommands.hpp"

#include "gui\versionInfo.hpp"
