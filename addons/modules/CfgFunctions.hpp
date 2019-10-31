class CfgFunctions {
	
	class AXE_Modules {
		
		tag = "axe_modules";
		
		class Modules {
			file = "\axe_modules\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class AXE_Functions {
		
		tag = "axe";
		
		class Modules_Sound {
			file = "\axe_modules\functions\sound";
			class moduleAmbientSound {};
			class moduleTriggerSound {};
		};
		
		class Modules_Speech {
			file = "\axe_modules\functions\speech";
			class moduleGlobalSpeech {};
			class moduleGlobalSpeechMenu {};
			class moduleGlobalSpeechPlay {};
			class moduleTriggerSpeech {};
		};
		
	};
	
};
