<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="MoviesApp.Movies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movies</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="margin-top: 3em;">
            <h2 style="text-align: center;"><b>Movies</b></h2>
            <br />
            <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary" style="float: right;" runat="server" NavigateUrl="/ManageMovies">Manage movies</asp:HyperLink>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="MoviesListSqlDataSource" DataKeyNames="Id">
                <AlternatingItemTemplate>
                    <tr  style="text-align: center;">
                        <td style="text-align: center;">
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SynopsisLabel" runat="server" Text='<%# Eval("Synopsis") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DirectorLabel" runat="server" Text='<%# Eval("Director") %>' />
                        </td>
                        
                        <td>
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                        </td>
                        <td>
                            <asp:HyperLink ID="CustomHyperLink2" runat="server" NavigateUrl=<%# "/MovieDetails?movieId=" + Eval("Id") %>>Details</asp:HyperLink>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SynopsisTextBox" runat="server" Text='<%# Bind("Synopsis") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DirectorTextBox" runat="server" Text='<%# Bind("Director") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SynopsisTextBox" runat="server" Text='<%# Bind("Synopsis") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DirectorTextBox" runat="server" Text='<%# Bind("Director") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="text-align: center;">
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td style="text-align: center;">
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td style="text-align: center;">
                            <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                        </td>
                        <td style="text-align: center;">
                            <asp:Label ID="SynopsisLabel" runat="server" Text='<%# Eval("Synopsis") %>' />
                        </td>
                        <td style="text-align: center;">
                            <asp:Label ID="DirectorLabel" runat="server" Text='<%# Eval("Director") %>' />
                        </td>
                        <td style="text-align: center;">
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                        </td>
                        <td style="text-align: center;">
                            <asp:HyperLink ID="CustomHyperLink1" runat="server" NavigateUrl=<%# "/MovieDetails?movieId=" + Eval("Id") %>>Details</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width: 3em; text-align: center;">Id</th>
                                        <th runat="server" style="text-align: center;">Title</th>
                                        <th runat="server" style="width: 5em; text-align: center;">Duration</th>
                                        <th runat="server" style="text-align: center;">Synopsis</th>
                                        <th runat="server" style="width: 5em; text-align: center;">Director</th>
                                        <th runat="server" style="width: 5em; text-align: center;">Category</th>
                                        <th runat="server" style="width: 5em; text-align: center;"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SynopsisLabel" runat="server" Text='<%# Eval("Synopsis") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DirectorLabel" runat="server" Text='<%# Eval("Director") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="MoviesListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesListConnectionString %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
                
                <br />
                <br />
                <br />
                <h5><b>Directors</b></h5>
                <asp:HyperLink ID="HyperLink2" CssClass="btn btn-primary" style="float: right;" runat="server" NavigateUrl="/ManageDirectors">Manage directors</asp:HyperLink>
            
                <asp:ListView ID="ListView2" runat="server" DataKeyNames="Id" DataSourceID="DirectorsListSqlDataSource">
                <AlternatingItemTemplate>
                    <tr style="text-align: center;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:HyperLink ID="CustomHyperLink3" runat="server" NavigateUrl=<%# "/DirectorDetails?directorId=" + Eval("Id") %>>Details</asp:HyperLink>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="text-align: center;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:HyperLink ID="CustomHyperLink4" runat="server" NavigateUrl=<%# "/DirectorDetails?directorId=" + Eval("Id") %>>Details</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="text-align: center;">
                                        <th runat="server" style="width: 3em;">Id</th>
                                        <th runat="server" style="width: 10em;">Name</th>
                                        <th runat="server" style="width: 10em;">LastName</th>
                                        <th runat="server" style="width: 5em;"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="DirectorsListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesListConnectionString %>" SelectCommand="SELECT * FROM [Director]"></asp:SqlDataSource>
            
            <br />
            <br />
            <br />
            <h5><b>Categories</b></h5>
            <asp:HyperLink ID="HyperLink3" CssClass="btn btn-primary" style="float: right;" runat="server" NavigateUrl="/ManageCategories">Manage categories</asp:HyperLink>
            <asp:ListView ID="ListView3" runat="server" DataKeyNames="Id" DataSourceID="CategoriesListSqlDataSource">
                <AlternatingItemTemplate>
                    <tr style="text-align: center;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:HyperLink ID="CustomHyperLink5" runat="server" NavigateUrl=<%# "/CategoryDetails?categoryId=" + Eval("Id") %>>Details</asp:HyperLink>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="text-align: center;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td>
                            <asp:HyperLink ID="CustomHyperLink5" runat="server" NavigateUrl=<%# "/CategoryDetails?categoryId=" + Eval("Id") %>>Details</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="text-align: center;">
                                        <th scope="col" runat="server" style="width: 3em;">Id</th>
                                        <th scope="col" runat="server" style="width: 10em;">Name</th>
                                        <th scope="col" runat="server" style="width: 5em;"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="CategoriesListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesListConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        </div>
    </form>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
