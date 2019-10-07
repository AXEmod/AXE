class CfgFunctions {
	
	class AXE_Curator {
		
		tag = "axe_curator";
		
		class Curator {
			file = "\axe_curator\functions";
			class initialize {};
			class initSettings {};
		};
		
		class Common {
			file = "\axe_curator\functions\common";
			class client {};
			class server {};
		};
		
		class Server {
			file = "\axe_curator\functions\server";
			class server_registerEvents {};
		};
		
		class Client {
			file = "\axe_curator\functions\client";
			class client_registerChat {};
			class client_registerEvents {};
			class client_registerKeys {};
			class client_registerModules {};
		};
		
	};
	
};
