<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bases2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="LabelDatabase" runat="server" Text=""></asp:Label>

    <br />
    <br />

    <asp:Label ID="Label0" runat="server" Text="Ingrese su cédula: "></asp:Label>

    <asp:TextBox ID="TextBoxCedula" runat="server" style="width: 128px"></asp:TextBox>

    <asp:Button ID="ButtonCedula" runat="server" Text="OK" OnClick="ButtonCedula_Click" />
    
    <asp:Panel ID="PanelChange" runat="server" Visible="false">
        <br />
        <table style="width:100%;">
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label10" runat="server" Text="Ubicación Actual: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxUbicacion" runat="server" Width="384px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label1" runat="server" Text="Cambiar Provincia: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListProvincia_SelectedIndexChanged">                    
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label8" runat="server" Text="Cambiar Cantón: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCanton" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCanton_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label9" runat="server" Text="Cambiar Distrito: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListDistrito" runat="server" OnSelectedIndexChanged="DropDownListDistrito_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label2" runat="server" Text="Sexo: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListSexo" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Masculino</asp:ListItem>
                        <asp:ListItem>Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label11" runat="server" Text="Fecha de Caducidad: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFechaCaducacion" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label3" runat="server" Text="Cambiar Fecha de Caducidad: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID="CalendarCaducacion" runat="server" OnSelectionChanged="CalendarCaducacion_SelectionChanged"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label4" runat="server" Text="Junta: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxJunta" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label5" runat="server" Text="Nombre: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label6" runat="server" Text="Primer Apellido: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPrimerApellido" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" class="text-center">
                    <asp:Label ID="Label7" runat="server" Text="Segundo Apellido: " style="font-size: large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxSegundoApellido" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <strong>
        <asp:Button ID="ButtonChange" runat="server" OnClick="ButtonChange_Click" style="font-size: large; font-weight: bold; color: #FFFFFF; background-color: #000099" Text="Cambiar" />
        </strong>
    </asp:Panel>

    

</asp:Content>
