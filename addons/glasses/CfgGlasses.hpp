class CfgGlasses {
	
	class None;
	class G_Blindfold_01_base_F;
	class G_Blindfold_01_black_F;
	
	class AXE_Blindfold_Black: G_Blindfold_01_black_F {
		_generalMacro = "AXE_Blindfold_Black";
		scope = 2;
		scopeCurator = 2;
		scopeArsenal = 2;
		author = "$STR_AXE_Glasses_Author";
		displayName = "$STR_AXE_Glasses_Blindfold_Black_DisplayName";
		descriptionShort = "$STR_AXE_Glasses_Blindfold_Black_Description";
		picture = "\a3\characters_f_enoch\facewear\data\ui\icon_g_blindfold_01_black_f_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\a3\characters_f_enoch\facewear\data\g_blindfold_01_black_co.paa"};
		model = "\a3\characters_f_enoch\facewear\g_blindfold_01_f.p3d";
		mass = 0.5;
		ACE_Color[] = {0,0,0};
		ACE_DustPath = "\z\ace\addons\goggles\textures\fx\dust\%1.paa";
		ACE_Overlay = "\axe_glasses\data\hud\blindfold_black_ca.paa";
		ACE_OverlayCracked = "\axe_glasses\data\hud\blindfold_black_ca.paa";
		ACE_OverlayDirt = "a3\ui_f\data\igui\rsctitles\healthtextures\dust_upper_ca.paa";
		ACE_Protection = 1;
		ACE_Resistance = 1;
		ACE_TintAmount = 2;
	};
	
	class G_Blindfold_01_white_F;
	
	class AXE_Blindfold_White: G_Blindfold_01_white_F {
		_generalMacro = "AXE_Blindfold_White";
		scope = 2;
		scopeCurator = 2;
		scopeArsenal = 2;
		author = "$STR_AXE_Glasses_Author";
		displayName = "$STR_AXE_Glasses_Blindfold_White_DisplayName";
		descriptionShort = "$STR_AXE_Glasses_Blindfold_White_Description";
		picture = "\a3\characters_f_enoch\facewear\data\ui\icon_g_blindfold_01_white_f_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\a3\characters_f_enoch\facewear\data\g_blindfold_01_white_co.paa"};
		model = "\a3\characters_f_enoch\facewear\g_blindfold_01_f.p3d";
		mass = 0.5;
		ACE_Color[] = {1,1,1};
		ACE_DustPath = "\z\ace\addons\goggles\textures\fx\dust\%1.paa";
		ACE_Overlay = "\axe_glasses\data\hud\blindfold_white_ca.paa";
		ACE_OverlayCracked = "\axe_glasses\data\hud\blindfold_white_ca.paa";
		ACE_OverlayDirt = "a3\ui_f\data\igui\rsctitles\healthtextures\dust_upper_ca.paa";
		ACE_Protection = 1;
		ACE_Resistance = 1;
		ACE_TintAmount = 2;
	};
	
	class AXE_Blindfold_White_Blood: G_Blindfold_01_white_F {
		_generalMacro = "AXE_Blindfold_White_Blood";
		scope = 2;
		scopeCurator = 2;
		scopeArsenal = 2;
		author = "$STR_AXE_Glasses_Author";
		displayName = "$STR_AXE_Glasses_Blindfold_White_Blood_DisplayName";
		descriptionShort = "$STR_AXE_Glasses_Blindfold_White_Blood_Description";
		picture = "\axe_glasses\data\ui\blindfold_white_blood_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_glasses\data\textures\blindfold_white_blood_co.paa"};
		model = "\a3\characters_f_enoch\facewear\g_blindfold_01_f.p3d";
		mass = 0.5;
		ACE_Color[] = {1,1,1};
		ACE_DustPath = "\z\ace\addons\goggles\textures\fx\dust\%1.paa";
		ACE_Overlay = "\axe_glasses\data\hud\blindfold_white_ca.paa";
		ACE_OverlayCracked = "\axe_glasses\data\hud\blindfold_white_ca.paa";
		ACE_OverlayDirt = "a3\ui_f\data\igui\rsctitles\healthtextures\dust_upper_ca.paa";
		ACE_Protection = 1;
		ACE_Resistance = 1;
		ACE_TintAmount = 2;
	};
	
};
