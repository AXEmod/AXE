class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// CARRYALL BASE
	
	class B_Carryall_Base;
	
	class AXE_Carryall_01_Base: B_Carryall_Base {
		scope = 1;
		scopeArsenal = 0;
		scopeCurator = 0;
		author = "$STR_AXE_Backpacks_Carryall_Author";
		// maximumLoad = 320;
		// mass = 60;
		maximumLoad = 360;
		mass = 48.5;
		transportMaxBackpacks = 1;
		transportMaxMagazines = 30;
		transportMaxWeapons = 2;
		class TransportItems {};
		class TransportMagazines {};
		class TransportWeapons {};
		isBackpack = 1;
	};
	
	// CARRYALL BLACK
	
	class AXE_Carryall_01_BLACK: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_BLACK";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_black.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_black_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_black_co.paa"};
	};
	
	class AXE_Carryall_01_BLACK_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_BLACK_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_black.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_black_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_black_medic_co.paa"};
	};
	
	// CARRYALL BW D
	
	class AXE_Carryall_01_BW_D: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_BW_D";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_bw_d.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_bw_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_bw_d_co.paa"};
	};
	
	class AXE_Carryall_01_BW_D_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_BW_D_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_bw_d.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_bw_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_bw_d_medic_co.paa"};
	};
	
	// CARRYALL BW W
	
	class AXE_Carryall_01_BW_W: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_BW_W";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_bw_w.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_bw_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_bw_w_co.paa"};
	};
	
	class AXE_Carryall_01_BW_W_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_BW_W_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_bw_w.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_bw_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_bw_w_medic_co.paa"};
	};
	
	// CARRYALL COYOTE
	
	class AXE_Carryall_01_COYOTE: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_COYOTE";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_coyote.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_coyote_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_coyote_co.paa"};
	};
	
	class AXE_Carryall_01_COYOTE_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_COYOTE_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_coyote.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_coyote_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_coyote_medic_co.paa"};
	};
	
	// CARRYALL GREEN DARK
	
	class AXE_Carryall_01_GREEN_DARK: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_GREEN_DARK";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_green_dark.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_green_dark_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_green_dark_co.paa"};
	};
	
	class AXE_Carryall_01_GREEN_DARK_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_GREEN_DARK_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_green_dark.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_green_dark_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_green_dark_medic_co.paa"};
	};
	
	// CARRYALL GREEN DIGITAL
	
	class AXE_Carryall_01_GREEN_DGTL: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_GREEN_DGTL";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_green_dgtl.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_green_dgtl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_green_dgtl_co.paa"};
	};
	
	class AXE_Carryall_01_GREEN_DGTL_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_GREEN_DGTL_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_green_dgtl.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_green_dgtl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_green_dgtl_medic_co.paa"};
	};
	
	// CARRYALL GREEN RANGER
	
	class AXE_Carryall_01_GREEN_RNGR: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_GREEN_RNGR";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_green_rngr.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_green_rngr_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_green_rngr_co.paa"};
	};
	
	class AXE_Carryall_01_GREEN_RNGR_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_GREEN_RNGR_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_green_rngr.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_green_rngr_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_green_rngr_medic_co.paa"};
	};
	
	// CARRYALL HEX CAMO
	
	class AXE_Carryall_01_HEX_CAMO: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_HEX_CAMO";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_hex_camo.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_hex_camo_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_hex_camo_co.paa"};
	};
	
	class AXE_Carryall_01_HEX_CAMO_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_HEX_CAMO_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_hex_camo.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_hex_camo_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_hex_camo_medic_co.paa"};
	};
	
	// CARRYALL HEX GREEN
	
	class AXE_Carryall_01_HEX_GREEN: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_HEX_GREEN";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_hex_green.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_hex_green_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_hex_green_co.paa"};
	};
	
	class AXE_Carryall_01_HEX_GREEN_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_HEX_GREEN_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_hex_green.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_hex_green_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_hex_green_medic_co.paa"};
	};
	
	// CARRYALL MARPAT D
	
	class AXE_Carryall_01_MARPAT_D: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_MARPAT_D";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_marpat_d.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_marpat_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_marpat_d_co.paa"};
	};
	
	class AXE_Carryall_01_MARPAT_D_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_MARPAT_D_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_marpat_d.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_marpat_d_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_marpat_d_medic_co.paa"};
	};
	
	// CARRYALL MARPAT W
	
	class AXE_Carryall_01_MARPAT_W: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_MARPAT_W";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_marpat_w.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_marpat_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_marpat_w_co.paa"};
	};
	
	class AXE_Carryall_01_MARPAT_W_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_MARPAT_W_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_marpat_w.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_marpat_w_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_marpat_w_medic_co.paa"};
	};
	
	// CARRYALL MTP
	
	class AXE_Carryall_01_MTP: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_MTP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_mtp.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_mtp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_mtp_co.paa"};
	};
	
	class AXE_Carryall_01_MTP_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_MTP_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_mtp.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_mtp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_mtp_medic_co.paa"};
	};
	
	// CARRYALL OCP
	
	class AXE_Carryall_01_OCP: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_OCP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_ocp.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_ocp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_ocp_co.paa"};
	};
	
	class AXE_Carryall_01_OCP_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_OCP_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_ocp.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_ocp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_ocp_medic_co.paa"};
	};
	
	// CARRYALL UCP
	
	class AXE_Carryall_01_UCP: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_UCP";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_ucp.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_ucp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_ucp_co.paa"};
	};
	
	class AXE_Carryall_01_UCP_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_UCP_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_ucp.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_ucp_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_ucp_medic_co.paa"};
	};
	
	// CARRYALL WOODLAND
	
	class AXE_Carryall_01_WDL: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_WDL";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_wdl.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_wdl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_wdl_co.paa"};
	};
	
	class AXE_Carryall_01_WDL_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_WDL_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_wdl.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_wdl_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_wdl_medic_co.paa"};
	};
	
	// CARRYALL WOODLAND 2
	
	class AXE_Carryall_01_WDL2: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_WDL2";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_wdl.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_wdl2_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_wdl2_co.paa"};
	};
	
	class AXE_Carryall_01_WDL2_MEDIC: AXE_Carryall_01_Base {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		displayName = "$STR_AXE_Backpacks_Carryall_01_WDL2_MEDIC";
		descriptionShort = "";
		editorPreview = "\axe_backpacks\carryall\data\previews\carryall_wdl.jpg";
		picture = "\axe_backpacks\carryall\data\ui\carryall_wdl2_ca.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\axe_backpacks\carryall\data\textures\carryall_wdl2_medic_co.paa"};
	};
	
};
