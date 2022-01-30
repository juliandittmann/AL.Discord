page 52500 "jdi Discord App"
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
                begin
                    CurrPage.WidgetBot.CreateControl('930840323440119858', '930840323440119861');
                end;
            }
        }
    }
}