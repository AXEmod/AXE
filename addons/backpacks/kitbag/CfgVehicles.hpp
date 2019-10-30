class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// KITBAG BASE
	
	class B_Kitbag_Base;
	
	class AXE_Kitbag_01_Base: B_Kitbag_Base {
		scope = 1;
		scopeArsenal = 0;
		scopeCurator = 0;
		author = "$STR_AXE_Backpacks_Kitbag_Author";
		// maximumLoad = 280;
		// mass = 50;
		maximumLoad = 320;
		mass = 39.6;
		transportMaxBackpacks = 1;
		transportMaxMagazines = 30;
		transportMaxWeapons = 1;
		class TransportItems {};
		class TransportMagazines {};
		class TransportWeapons {};
		isBackpack = 1;
	};
	
	// KITBAG BLACK
	
	class AXE_Kitbag_01_BLACK: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_BLACK";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_black.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_black_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_black_co.paa"};
	};
	
	class AXE_Kitbag_01_BLACK_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_BLACK_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_black.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_black_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_black_medic_co.paa"};
	};
	
	// KITBAG BW D
	
	class AXE_Kitbag_01_BW_D: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_BW_D";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_bw_d.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_bw_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_bw_d_co.paa"};
	};
	
	class AXE_Kitbag_01_BW_D_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_BW_D_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_bw_d.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_bw_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_bw_d_medic_co.paa"};
	};
	
	// KITBAG BW W
	
	class AXE_Kitbag_01_BW_W: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_BW_W";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_bw_w.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_bw_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_bw_w_co.paa"};
	};
	
	class AXE_Kitbag_01_BW_W_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_AXE_Backpacks_Author";
		displayName = "$STR_AXE_Backpacks_Kitbag_01_BW_W_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_bw_w.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_bw_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_bw_w_medic_co.paa"};
	};
	
	// KITBAG COYOTE
	
	class AXE_Kitbag_01_COYOTE: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_COYOTE";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_coyote.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_coyote_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_coyote_co.paa"};
	};
	
	class AXE_Kitbag_01_COYOTE_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_COYOTE_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_coyote.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_coyote_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_coyote_medic_co.paa"};
	};
	
	// KITBAG GREEN DARK
	
	class AXE_Kitbag_01_GREEN_DARK: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_GREEN_DARK";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_green_dark.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_green_dark_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_green_dark_co.paa"};
	};
	
	class AXE_Kitbag_01_GREEN_DARK_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_GREEN_DARK_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_green_dark.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_green_dark_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_green_dark_medic_co.paa"};
	};
	
	// KITBAG GREEN DIGITAL
	
	class AXE_Kitbag_01_GREEN_DGTL: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_GREEN_DGTL";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_green_dgtl.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_green_dgtl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_green_dgtl_co.paa"};
	};
	
	class AXE_Kitbag_01_GREEN_DGTL_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_GREEN_DGTL_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_green_dgtl.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_green_dgtl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_green_dgtl_medic_co.paa"};
	};
	
	// KITBAG GREEN RANGER
	
	class AXE_Kitbag_01_GREEN_RNGR: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_GREEN_RNGR";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_green_rngr.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_green_rngr_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_green_rngr_co.paa"};
	};
	
	class AXE_Kitbag_01_GREEN_RNGR_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_GREEN_RNGR_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_green_rngr.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_green_rngr_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_green_rngr_medic_co.paa"};
	};
	
	// KITBAG HEX CAMO
	
	class AXE_Kitbag_01_HEX_CAMO: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_HEX_CAMO";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_hex_camo.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_hex_camo_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_hex_camo_co.paa"};
	};
	
	class AXE_Kitbag_01_HEX_CAMO_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_HEX_CAMO_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_hex_camo.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_hex_camo_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_hex_camo_medic_co.paa"};
	};
	
	// KITBAG HEX GREEN
	
	class AXE_Kitbag_01_HEX_GREEN: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_HEX_GREEN";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_hex_green.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_hex_green_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_hex_green_co.paa"};
	};
	
	class AXE_Kitbag_01_HEX_GREEN_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_HEX_GREEN_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_hex_green.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_hex_green_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_hex_green_medic_co.paa"};
	};
	
	// KITBAG MARPAT D
	
	class AXE_Kitbag_01_MARPAT_D: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_MARPAT_D";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_marpat_d.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_marpat_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_marpat_d_co.paa"};
	};
	
	class AXE_Kitbag_01_MARPAT_D_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_MARPAT_D_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_marpat_d.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_marpat_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_marpat_d_medic_co.paa"};
	};
	
	// KITBAG MARPAT W
	
	class AXE_Kitbag_01_MARPAT_W: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_MARPAT_W";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_marpat_w.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_marpat_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_marpat_w_co.paa"};
	};
	
	class AXE_Kitbag_01_MARPAT_W_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_MARPAT_W_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_marpat_w.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_marpat_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_marpat_w_medic_co.paa"};
	};
	
	// KITBAG MTP
	
	class AXE_Kitbag_01_MTP: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_MTP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_mtp.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_mtp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_mtp_co.paa"};
	};
	
	class AXE_Kitbag_01_MTP_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_MTP_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_mtp.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_mtp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_mtp_medic_co.paa"};
	};
	
	// KITBAG OCP
	
	class AXE_Kitbag_01_OCP: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_OCP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_ocp.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_ocp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_ocp_co.paa"};
	};
	
	class AXE_Kitbag_01_OCP_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_OCP_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_ocp.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_ocp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_ocp_medic_co.paa"};
	};
	
	// KITBAG UCP
	
	class AXE_Kitbag_01_UCP: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_UCP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_ucp.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_ucp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_ucp_co.paa"};
	};
	
	class AXE_Kitbag_01_UCP_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_UCP_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_ucp.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_ucp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_ucp_medic_co.paa"};
	};
	
	// KITBAG WOODLAND
	
	class AXE_Kitbag_01_WDL: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_WDL";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_wdl.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_wdl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_wdl_co.paa"};
	};
	
	class AXE_Kitbag_01_WDL_MEDIC: AXE_Kitbag_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Kitbag_01_WDL_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\kitbag\data\previews\kitbag_wdl.jpg";
		picture = "\axe_backpacks\kitbag\data\ui\kitbag_wdl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\kitbag\data\textures\kitbag_wdl_medic_co.paa"};
	};
	
};
