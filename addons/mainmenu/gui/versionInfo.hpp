class RscControlsGroupNoHScrollbars;
class RscHTML;
class RscText;
class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay {
	
    class controls {
		
        class InfoMods: RscControlsGroupNoHScrollbars {
            class Controls;
        };
		
        class InfoNews: InfoMods {
            class Controls: Controls {
                class Background;
                class BackgroundIcon;
                class Icon;
                class News;
                class Notification;
                class Button;
            };
        };
		
        class AXE_InfoNews: InfoNews {
			
            idc = 90090;
            y = "safezoneY + safezoneH - (4 * 2 + 1) * (pixelH * pixelGrid * 2) - 5 * (4 * pixelH)";
			
            class Controls: Controls {
				
                class Background: Background {};
                class BackgroundIcon: BackgroundIcon {};
                class Icon: Icon {
                    text = "$STR_AXE_Addon_Logo";
                };
				
                class CurrentVersionInfo: RscText {
                    idc = 90091;
                    style = 1;
                    text = "";
                    sizeEx = "(pixelH * pixelGrid * 1.5)";
                    font = "RobotoCondensedLight";
                    shadow = 1;
                    colorBackground[] = {0,0,0,0};
                    x = 0;
                    y = 0;
                    w = "(10 - 1.25 * 2) * (pixelW * pixelGrid * 2)";
                    h = "1 * (pixelH * pixelGrid * 2)";
                    onLoad = "(_this select 0) ctrlEnable false;";
                };
				
                class HTTPVersionInfo: RscHTML {
                    idc = 90092;
                    shadow = 0;
                    class H1 {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                        font = "RobotoCondensedLight";
                        fontBold = "RobotoCondensedLight";
                        align = "right";
                    };
                    class H2: H1 {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                    };
                    class P: H1 {
                        sizeEx = "(pixelH * pixelGrid * 1.5)";
                    };
                    x = 0;
                    y = "1 * (pixelH * pixelGrid * 2)";
                    w = "(10 - 1.25 * 2) * (pixelW * pixelGrid * 2)";
                    h = "1 * (pixelH * pixelGrid * 2)";
                    onLoad = "(_this select 0) ctrlEnable false;";
                };
				
                class Button: Button {
                    tooltip = "$STR_AXE_VersionInfo_Tooltip";
                    url = "$STR_AXE_Addon_URL_Releases";
                };
				
            };
			
        };
		
    };
	
};
