class CfgSettings {
	
	class CBA {
		
        class Caching {
            compile = 0;
            xeh = 0;
            functions = 0;
        };
		
		class Versioning {
			class AXE {
				class dependencies {
					CBA[] = { "cba_main", REQUIRED_CBA_VERSION, "(true)" };
					ACE[] = { "ace_main", REQUIRED_ACE_VERSION, "(true)" };
				};
			};
		};
		
	};
	
};
