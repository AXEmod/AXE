class Extended_PreInit_EventHandlers {
	
	class AXE_Curator_EH_initSettings {
		init = "call AXE_Curator_fnc_initSettings";
	};
	
};

class Extended_PostInit_EventHandlers {
	
	class AXE_Curator_EH_initialize {
		serverInit = "call AXE_curator_fnc_initServer";
		clientInit = "call AXE_curator_fnc_initClient";
		init = "call AXE_curator_fnc_initialize";
	};
	
};
