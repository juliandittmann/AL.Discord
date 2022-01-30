codeunit 50100 "jdi Template Test Helper"
{
    procedure Create(TestSuiteName: code[10]; TestCodeunitFilter: Text; EmptyTestSuite: Boolean)
    var
        ALTestSuite: Record "AL Test Suite";
        TestMethodLine: Record "Test Method Line";
        TempAllObjWithCaption: Record AllObjWithCaption temporary;

        TestSuiteMgt: Codeunit "Test Suite Mgt.";
    begin
        TryInsertTestSuite(TestSuiteName, ALTestSuite);

        TestMethodLine.Setrange("Test Suite", TestSuiteName);
        if EmptyTestSuite then
            TestMethodLine.DeleteAll(true);

        if GetTestCodeunits(TestCodeunitFilter, TempAllObjWithCaption) then
            TestSuiteMgt.GetTestMethods(ALTestSuite, TempAllObjWithCaption);

    end;

    local procedure TryInsertTestSuite(TestSuiteName: code[10]; var ALTestSuite: Record "AL Test Suite")
    begin
        if ALTestSuite.Get(TestSuiteName) then
            exit;

        ALTestSuite.Init();
        ALTestSuite.Validate(Name, TestSuiteName);
        ALTestSuite.Validate(Description, TestSuiteName);
        ALTestSuite.Insert(true);
    end;

    local procedure GetTestCodeunits(TestCodeunitFilter: Text; VAR ToAllObjWithCaption: Record AllObjWithCaption): Boolean;
    var
        FromAllObjWithCaption: Record AllObjWithCaption;
    begin
        FromAllObjWithCaption.Setrange("Object Type", ToAllObjWithCaption."Object Type"::Codeunit);
        FromAllObjWithCaption.SetFilter("Object ID", TestCodeunitFilter);
        FromAllObjWithCaption.Setrange("Object Subtype", 'Test');
        if FromAllObjWithCaption.Find('-') then
            repeat
                ToAllObjWithCaption := FromAllObjWithCaption;
                ToAllObjWithCaption.Insert();
            until FromAllObjWithCaption.Next() = 0;

        exit(ToAllObjWithCaption.Find('-'));
    end;
}