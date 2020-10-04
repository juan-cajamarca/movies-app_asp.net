<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageDirectors.aspx.cs" Inherits="MoviesApp.ManageDirectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage directors</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="padding-top: 3em;">
            <h3 style="text-align: center;"><b>Manage directors</b></h3>
        
            <asp:HyperLink CssClass="btn btn-light" ID="HyperLink1" runat="server" NavigateUrl="/Movies">&lt; Home</asp:HyperLink>
            <br /><br />
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="DirectorsGridSqlDataSource">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DirectorsGridSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MoviesListConnectionString %>" DeleteCommand="DELETE FROM [Director] WHERE [Id] = @original_Id AND [Name] = @original_Name AND [LastName] = @original_LastName" InsertCommand="INSERT INTO [Director] ([Id], [Name], [LastName]) VALUES (@Id, @Name, @LastName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Director]" UpdateCommand="UPDATE [Director] SET [Name] = @Name, [LastName] = @LastName WHERE [Id] = @original_Id AND [Name] = @original_Name AND [LastName] = @original_LastName">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="DirectorsGridSqlDataSource">
                <EditItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    LastName:
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Id
                    <asp:TextBox ID="IdTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Id") %>' />
                    <br />
                    Name
                    <asp:TextBox ID="NameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    LastName
                    <asp:TextBox ID="LastNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("LastName") %>' />
                    <br /><br />
                    <asp:LinkButton CssClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CssClass="btn btn-success" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New director" />
                </ItemTemplate>
            </asp:FormView>
        </div>
        <script src="Scripts/jquery-3.4.1.js"></script>
        <script src="Scripts/bootstrap.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </form>
</body>
</html>
