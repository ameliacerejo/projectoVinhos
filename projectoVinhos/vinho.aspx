<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.master" AutoEventWireup="true" CodeBehind="vinho.aspx.cs" Inherits="projectoVinhos.vinho" %>
<asp:Content ContentPlaceHolderID="head" runat ="server" ID="head">
    <title>Vinho</title>
     <style>
        table {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        tr {
            height: 60px;
            vertical-align: middle;
        }

        .legenda {
            width: 250px;
            text-align: right;
            padding-right: 10px;
        }

        .controlo {
            width: 750px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" CssClass="mt-5">
    <table class="w-50" style="margin-bottom: 60px;">
    <tr>
        <td style="height: 50px; width: 180px;">
            <asp:Label ID="vinhoNome" runat="server" Text="Vinho" Style="font-size: 12pt; font-weight: bold;"></asp:Label>
        </td>
    </tr>
    <tr>
        <td rowspan="3" style="height: 450px; width: 280px; text-align: center; vertical-align: middle;">
            <asp:Image ID="vinhoFoto" runat="server" Width="100%" />
        </td>
        <td style="height: 30px;">
            <asp:Label ID="vinhoProdutor" runat="server" Text="Produtor"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="height: 30px;">
            <asp:Label ID="vinhoRegiao" runat="server" Text="Região"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="height: 25px;">
            <asp:Label ID="vinhoTipo" runat="server" Text="Tipo"></asp:Label>
        </td>
    </tr>
</table>

</asp:Content>
