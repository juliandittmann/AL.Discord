/// <summary>
/// WidgetBot Setup Codeunit
/// </summary>
codeunit 52500 "jdi Discord Widgetbot Setup"
{
    /// <summary>
    /// Create WidgetBot Setup JSON Object
    /// </summary>
    /// <param name="ServerId"></param>
    /// <param name="ChannelId"></param>
    /// <returns></returns>
    procedure CreateWidgetBotSetup(ServerId: Text; ChannelId: Text): JsonObject
    begin
        exit(CreateWidgetBotSetup(ServerId, ChannelId, '100%', '98%'));
    end;

    /// <summary>
    /// Create WidgetBot Setup JSON Object
    /// </summary>
    /// <param name="ServerId"></param>
    /// <param name="ChannelId"></param>
    /// <param name="Height"></param>
    /// <param name="Width"></param>
    /// <returns></returns>
    procedure CreateWidgetBotSetup(ServerId: Text; ChannelId: Text; Height: Text; Width: Text): JsonObject
    var
        WidgetBotJObject: JsonObject;
    begin
        WidgetBotJObject.Add('serverid', ServerId);
        WidgetBotJObject.Add('channelid', ChannelId);
        WidgetBotJObject.Add('height', Height);
        WidgetBotJObject.Add('width', Width);
        exit(WidgetBotJObject);
    end;
}