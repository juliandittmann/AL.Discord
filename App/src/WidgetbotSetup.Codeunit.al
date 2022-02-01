codeunit 52500 "jdi Discord Widgetbot Setup"
{
    procedure CreateWidgetBotSetup(ServerId: Text; ChannelId: Text): JsonObject
    begin
        exit(CreateWidgetBotSetup(ServerId, ChannelId, '100%', '98%'));
    end;

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