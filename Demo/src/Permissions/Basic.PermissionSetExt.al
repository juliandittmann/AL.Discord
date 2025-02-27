/// <summary>
/// This permission set extension is used to add the jdi Discord DemoUser permission set to the D365 BASIC permission set.
/// </summary>
permissionsetextension 52549 "jdi Discord Demo Basic" extends "D365 BASIC"
{
    IncludedPermissionSets = "jdi Discord Demo User";
}