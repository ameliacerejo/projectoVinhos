<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="projectoVinhos.home" %>

<asp:Content ContentPlaceHolderID="head" ID="head1" runat="server">
    <title>Home page</title>
    <style>
        table {
            width: 100%;
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

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:DataList ID="listVinhos" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CssClass="mt-5">
            <ItemTemplate>
                <table style="margin-bottom: 60px;">
                    <tr>
                        <td rowspan="5" style="height: 200px; width: 140px; text-align: center; vertical-align: middle;">
                            <a href="vinho.aspx?id=<%# Eval("Id") %>">
                                <asp:Image ImageUrl='<%# Eval("Foto") %>' runat="server" ID="vinhoFoto" Height="220" />
                            </a>
                        </td>
                        <td style="height: 60px;"></td>
                    </tr>
                    <tr>
                        <td style="height: 50px; width: 180px;">
                            <a href="vinho.aspx?id=<%# Eval("Id") %>" class="link" style="text-decoration: none;">
                                <asp:Label ID="vinhoNome" runat="server" Style="font-size: 12pt; font-weight: bold;"
                                    Text='<%# Eval("Nome") %>' CssClass="link" />
                            </a>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td>
                            <asp:Label ID="vinhoProdutor" runat="server" Text='<%# Eval("Produtor") %>' />
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td>
                            <asp:Label ID="vinhoRegiao" runat="server" Text='<%# Eval("Regiao") %>' /></td>
                    </tr>
                    <tr style="height: 25px;">
                        <td>
                            <asp:Label ID="vinhoTipo" runat="server" Text='<%# Eval("TipoVinho") %>' /></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>" SelectCommand="SELECT * FROM [Vinho] ORDER BY [Id] DESC"></asp:SqlDataSource>
<asp:LinkButton ID="linkPrimeira" runat="server" OnClick="linkPrimeira_Click">Primeira</asp:LinkButton>
<asp:LinkButton ID="linkAnterior" runat="server" OnClick="linkAnterior_Click">Anterior</asp:LinkButton>
<asp:LinkButton ID="linkSeguinte" runat="server" OnClick="linkSeguinte_Click">Seguinte</asp:LinkButton>
<asp:LinkButton ID="linkUltima" runat="server" OnClick="linkUltima_Click">Última</asp:LinkButton>
    <br />

    </asp:Content>
