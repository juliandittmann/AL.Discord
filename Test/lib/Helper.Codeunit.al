/// <summary>
/// This codeunit is used to create a test suite and add test methods to it.
/// </summary>
codeunit 50100 "jdi Discord Test Helper"
{
    /// <summary>
    /// This function is used to create a test suite and add test methods to it.
    /// </summary>
    /// <param name="TestSuiteName"></param>
    /// <param name="TestCodeunitFilter"></param>
    /// <param name="EmptyTestSuite"></param>
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

    /// <summary>
    /// This function is used to try to insert a test suite.
    /// </summary>
    /// <param name="TestSuiteName"></param>
    /// <param name="ALTestSuite"></param>
    local procedure TryInsertTestSuite(TestSuiteName: code[10]; var ALTestSuite: Record "AL Test Suite")
    begin
        if ALTestSuite.Get(TestSuiteName) then
            exit;

        ALTestSuite.Init();
        ALTestSuite.Validate(Name, TestSuiteName);
        ALTestSuite.Validate(Description, TestSuiteName);
        ALTestSuite.Insert(true);
    end;

    /// <summary>
    /// This function is used to get test codeunits.
    /// </summary>
    /// <param name="TestCodeunitFilter"></param>
    /// <param name="ToAllObjWithCaption"></param>
    /// <returns></returns>
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