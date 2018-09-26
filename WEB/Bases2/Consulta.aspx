<%@ Page Title="Consulta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="Bases2.Consulta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="LabelDatabase" runat="server" Text=""></asp:Label>

    <br />
    <br />

    <asp:Label ID="Label0" runat="server" Text="Ingrese su cédula: "></asp:Label>

    <asp:TextBox ID="TextBoxCedula" runat="server" style="width: 128px"></asp:TextBox>

    <asp:Button ID="ButtonCedula" runat="server" Text="OK" OnClick="ButtonCedula_Click" />
    <asp:Panel ID="PanelChange" runat="server" Visible="false">
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Ubicación Actual: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxUbicacion" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Cambiar Provincia: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListProvincia_SelectedIndexChanged">                    
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Cambiar Cantón: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCanton" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCanton_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Cambiar Distrito: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListDistrito" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Sexo: "></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListSexo" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Fecha de Caducidad: "></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID="CalendarCaducacion" runat="server"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Junta: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxJunta" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Nombre: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Primer Apellido: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPrimerApellido" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Segundo Apellido: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxSegundoApellido" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="ButtonChange" runat="server" Text="Cambiar" />
    </asp:Panel>
</asp:Content>

