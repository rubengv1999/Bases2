<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bases2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    

    <asp:Label ID="Label1" runat="server" Text="Seleccione el motor de bases de datos"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>SQL Server</asp:ListItem>
        <asp:ListItem>Oracle</asp:ListItem>
    </asp:DropDownList>

    

    <asp:Button ID="ButtonServer" runat="server" Text="OK" />

    

</asp:Content>
