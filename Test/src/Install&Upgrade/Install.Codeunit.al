/// <summary>
/// jdi Discord Test Helper
/// </summary>
codeunit 50101 "jdi Discord Test Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        TestToolHelper: Codeunit "jdi Discord Test Helper";
    begin
        TestToolHelper.Create('DEFAULT', '50100..50199', true);
    end;
}