codeunit 50101 "jdi Template Test Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        TestToolHelper: Codeunit "jdi Template Test Helper";
    begin
        TestToolHelper.Create('DEFAULT', '50100..50199', true);
    end;
}