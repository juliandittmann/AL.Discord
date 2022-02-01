codeunit 50103 "jdi Discord Test Setup"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestWidgetBotSetupCreation()
    var
        WidgetbotSetup: Codeunit "jdi Discord Widgetbot Setup";
        WidgetBotSetupJObject: JsonObject;

        ChannelId: Text;
        ServerId: Text;

        ServerIdJToken: JsonToken;
        ChannelIdJToken: JsonToken;
        HeightJToken: JsonToken;
        WidthJToken: JsonToken;
    begin
        //Set Basic Permission
        LibraryLowerPermissions.SetO365Basic();

        //Create Test Data
        ServerId := LibraryRandom.RandText(50);
        ChannelId := LibraryRandom.RandText(50);

        //Create WidgetBot Setup JsonObject
        WidgetBotSetupJObject := WidgetbotSetup.CreateWidgetBotSetup(ServerId, ChannelId);

        //Assert WidgetBot Setup JsonObject is complete
        Assert.IsTrue(WidgetBotSetupJObject.Get('serverid', ServerIdJToken), 'serverid token should exist.');
        Assert.IsTrue(WidgetBotSetupJObject.Get('channelid', ChannelIdJToken), 'channelid token should exist.');
        Assert.IsTrue(WidgetBotSetupJObject.Get('height', HeightJToken), 'heigth token should exist.');
        Assert.IsTrue(WidgetBotSetupJObject.Get('width', WidthJToken), 'serverid token should exist.');

        //Assert WidgetBot Setup JsonObject values are correcty set
        Assert.AreEqual(ServerId, ServerIdJToken.AsValue().AsText(), 'serverids should be equal.');
        Assert.AreEqual(ChannelId, ChannelIdJToken.AsValue().AsText(), 'channelids should be equal.');
        Assert.AreEqual('100%', HeightJToken.AsValue().AsText(), 'height should be equal.');
        Assert.AreEqual('98%', WidthJToken.AsValue().AsText(), 'width should be equal.');
    end;

    var
        Assert: Codeunit Assert;
        LibraryRandom: codeunit "Library - Random";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";

}