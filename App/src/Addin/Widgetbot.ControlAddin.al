controladdin "jdi Discord Widgetbot"
{
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =
        'https://code.jquery.com/jquery-3.3.1.min.js',
        './src/Addin/Script/Widgetbot.js',
        './src/Addin/Script/Interface.js',
        './src/Addin/Script/Utility.js';

    StartupScript =
        './src/Addin/Script/Startup.js';

    event ControlAddinLoaded();
    procedure CreateControl(WidgetBotSetupJObject: JsonObject);
}