/// <summary>
/// Discord Demo App
/// </summary>
page 52549 "jdi Discord Demo App"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    Caption = 'Discord';

    layout
    {
        area(Content)
        {
            usercontrol("WidgetBot"; "jdi Discord Widgetbot")
            {
                ApplicationArea = all;

                trigger ControlAddinLoaded()
                var
                    WidgetBotSetup: Codeunit "jdi Discord Widgetbot Setup";
                    WidgetBotSetupJObject: JsonObject;
                begin
                    WidgetBotSetupJObject := WidgetBotSetup.CreateWidgetBotSetup('930840323440119858', '930840323440119861');
                    CurrPage.WidgetBot.CreateControl(WidgetBotSetupJObject);
                end;
            }
        }
    }
}