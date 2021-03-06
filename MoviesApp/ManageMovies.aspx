﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMovies.aspx.cs" Inherits="MoviesApp.ManageMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage movies</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="padding-top: 3em;">
            <h3 style="text-align: center;"><b>Manage movies</b></h3>
        
            <asp:HyperLink CssClass="btn btn-light" ID="HyperLink1" runat="server" NavigateUrl="/Movies">&lt; Home</asp:HyperLink>
            <br />
            <br />
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="MoviesGridSqlDataSource">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="Synopsis" HeaderText="Synopsis" SortExpression="Synopsis" />
                    <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="MoviesGridSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MoviesListConnectionString %>" DeleteCommand="DELETE FROM [Movie] WHERE [Id] = @original_Id AND [Title] = @original_Title AND [Duration] = @original_Duration AND (([Synopsis] = @original_Synopsis) OR ([Synopsis] IS NULL AND @original_Synopsis IS NULL)) AND [Director] = @original_Director AND [Category] = @original_Category" InsertCommand="INSERT INTO [Movie] ([Id], [Title], [Duration], [Synopsis], [Director], [Category]) VALUES (@Id, @Title, @Duration, @Synopsis, @Director, @Category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Movie]" UpdateCommand="UPDATE [Movie] SET [Title] = @Title, [Duration] = @Duration, [Synopsis] = @Synopsis, [Director] = @Director, [Category] = @Category WHERE [Id] = @original_Id AND [Title] = @original_Title AND [Duration] = @original_Duration AND (([Synopsis] = @original_Synopsis) OR ([Synopsis] IS NULL AND @original_Synopsis IS NULL)) AND [Director] = @original_Director AND [Category] = @original_Category">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Title" Type="String" />
                    <asp:Parameter Name="original_Duration" Type="Int32" />
                    <asp:Parameter Name="original_Synopsis" Type="String" />
                    <asp:Parameter Name="original_Director" Type="Int32" />
                    <asp:Parameter Name="original_Category" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Duration" Type="Int32" />
                    <asp:Parameter Name="Synopsis" Type="String" />
                    <asp:Parameter Name="Director" Type="Int32" />
                    <asp:Parameter Name="Category" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Duration" Type="Int32" />
                    <asp:Parameter Name="Synopsis" Type="String" />
                    <asp:Parameter Name="Director" Type="Int32" />
                    <asp:Parameter Name="Category" Type="Int32" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Title" Type="String" />
                    <asp:Parameter Name="original_Duration" Type="Int32" />
                    <asp:Parameter Name="original_Synopsis" Type="String" />
                    <asp:Parameter Name="original_Director" Type="Int32" />
                    <asp:Parameter Name="original_Category" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="MoviesGridSqlDataSource">
                <EditItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    Duration:
                    <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                    <br />
                    Synopsis:
                    <asp:TextBox ID="SynopsisTextBox" runat="server" Text='<%# Bind("Synopsis") %>' />
                    <br />
                    Director:
                    <asp:TextBox ID="DirectorTextBox" runat="server" Text='<%# Bind("Director") %>' />
                    <br />
                    Category:
                    <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Id
                    <asp:TextBox ID="IdTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Id") %>' />
                    <br />
                    Title
                    <asp:TextBox ID="TitleTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    Duration
                    <asp:TextBox ID="DurationTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Duration") %>' />
                    <br />
                    Synopsis
                    <asp:TextBox ID="SynopsisTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Synopsis") %>' />
                    <br />
                    Director
                    <asp:TextBox ID="DirectorTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Director") %>' />
                    <br />
                    Category
                    <asp:TextBox ID="CategoryTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Category") %>' />
                    <br />
                    <asp:LinkButton CssClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CssClass="btn btn-success" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New Movie" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
