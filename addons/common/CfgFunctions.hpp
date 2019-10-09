class CfgFunctions {
	
	class AXE_Common {
		
		tag = "axe_common";
		
		class Common {
			file = "\axe_common\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class AXE_Functions {
		
		tag = "axe";
		
		class Addons {
			file = "\axe_common\functions\addons";
			class getAddonAuthor {};
			class getAddonAuthors {};
			class getAddonName {};
			class getAddonRequiredAddons {};
			class getAddonRequiredVersion {};
			class getAddonUnits {};
			class getAddonURL {};
			class getAddonVersion {};
			class getAddonVersionArray {};
			class getAddonVersionString {};
			class getAddonWeapons {};
			class isAddon {};
		};
		
		class Common {
			file = "\axe_common\functions\common";
			class addItem {};
			class attachToRel {};
			class createLitter {};
			class createLitterServer {};
			class isAdmin {};
			class isCurator {};
			class isInBuilding {};
		};
		
		class Diagnostic {
			file = "\axe_common\functions\diagnostics";
			class diagLog {};
			class diagLogGlobal {};
			class diagLogServer {};
			class isDebug {};
			class log {};
			class logGlobal {};
			class logServer {};
		};
		
		class SafeMode {
			file = "\axe_common\functions\safemode";
			class weaponFiremodeSound {};
			class weaponLock {};
			class weaponUnlock {};
		};
		
		class Settings {
			file = "\axe_common\functions\settings";
			class getKeybindString {};
			class needRestart {};
			class needRestartLocal {};
		};
		
		class Sounds {
			file = "\axe_common\functions\sounds";
			class getSoundDuration {};
			class getSoundPath {};
			class isSpeaking {};
			class loop3d {};
			class loop3dGlobal {};
			class play3d {};
			class play3dGlobal {};
			class playSound {};
			class playSoundGlobal {};
			class playSound3d {};
			class say3d {};
			class say3dGlobal {};
			class speak3d {};
			class speak3dGlobal {};
			class stop3d;
			class stop3dGlobal;
		};
		
		class Videos {
			file = "\axe_common\functions\videos";
			class playVideo {};
			class playVideoOnce {};
			class videoKeyDown {};
		};
		
	};
	
};
