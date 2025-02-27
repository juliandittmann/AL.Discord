[![ CI/CD](https://github.com/juliandittmann/AL.Discord/actions/workflows/CICD.yaml/badge.svg)](https://github.com/juliandittmann/AL.Discord/actions/workflows/CICD.yaml)

[![license](https://img.shields.io/badge/license-MIT-yellow.svg)](LICENSE)

![Discord Logo](assets/discord_banner.png) 

# Discord for Dynamics 365 Business Central

Integrate Discord chat features in Dynamics 365 Business Central with [widgetbot](https://widgetbot.io/).

## Setup Discord Server

Do the following steps:

1. Follow the [tutorial](https://docs.widgetbot.io/tutorial/) 
2. Recieve the serverid and a channelid

## Connect to the Discord server from Dynamics 365 Business Central

Use the provided control addin.

You can find an [example](https://github.com/juliandittmann/AL.Discord/blob/main/Demo/src/App.Page.al) in the demo app folder

```
usercontrol("WidgetBot"; "jdi Discord Widgetbot")
{
    ApplicationArea = all;

    trigger ControlAddinLoaded()
    var
        WidgetBotSetup: Codeunit "jdi Discord Widgetbot Setup";
        WidgetBotSetupJObject: JsonObject;
    begin
        WidgetBotSetupJObject := WidgetBotSetup.CreateWidgetBotSetup('<serverid>', '<channelid>');
        CurrPage.WidgetBot.CreateControl(WidgetBotSetupJObject);
    end;
}
```
