<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.Master" AutoEventWireup="true" CodeBehind="novoVinho.aspx.cs" Inherits="projectoVinhos.utilizador.novoVinho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Novo Vinho</title>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Novo Vinho</h1>
    <table class="w-50">
            <tr>
                <td class="legenda" colspan="2">
                    <asp:SqlDataSource ID="SqlVinhos" runat="server"
                        ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>"
                        SelectCommand="SELECT [Id], [Nome], [Foto], [Regiao], [Produtor], [Enologo], [Tipo], [Volume], [TeorAlcoolico], [Ano], [Utilizador] FROM [Vinho] ORDER BY [Nome]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="legenda">Nome &nbsp; </td>
                <td>
                    <asp:TextBox runat="server" ID="textVinho" width="350px" />
                </td>
            </tr>
            <tr>
                <td class="legenda">Produtor &nbsp; </td>
                <td>
                    <asp:DropDownList ID="listProdutor" runat="server" Width="250px" DataSourceID="SqlProdutores"
                        DataTextField="Nome" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlProdutores" runat="server"
                        ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>"
                        SelectCommand="SELECT [Id], [Nome] FROM [Produtor] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="legenda">Enologo &nbsp; </td>
                <td>
                    <asp:DropDownList ID="listEnologo" runat="server" Width="250px" DataSourceID="SqlEnologos"
                        DataTextField="Nome" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlEnologos" runat="server"
                        ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>"
                        SelectCommand="SELECT [Id], [Nome] FROM [Enologo] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="legenda"">Tipo de vinho &nbsp; </td>
                <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="250px" DataSourceID="SqlTipos"
                    DataTextField="Nome" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlTipos" runat="server"
                        ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>"
                        SelectCommand="SELECT [Id], [Nome] FROM [Tipo] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="legenda">Região &nbsp; </td>
                <td>
                    <asp:DropDownList ID="listRegiao" runat="server" Width="250px" DataSourceID="SqlRegioes"
                        DataTextField="Nome" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlRegioes" runat="server"
                        ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>"
                        SelectCommand="SELECT [Id], [Nome] FROM [Regiao] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="legenda">Ano</td>
                <td class="controlo">
                    <asp:TextBox runat="server" ID="textAno" class="form-control me-2"
                        Style="width: 100px; display: inline;" />
                    <asp:RangeValidator ErrorMessage="Número entre 1900 e 2999." ControlToValidate="textAno"
                        runat="server" Type="Integer" MinimumValue="1800" MaximumValue="2999" Display="Dynamic"
                        ForeColor="#CC0000" />
                    <asp:RequiredFieldValidator ErrorMessage="Obrigatório" ControlToValidate="textAno" runat="server"
                        Display="Dynamic" ForeColor="#CC0000" />

                </td>

            </tr>
            <tr>
                <td class="legenda">Teor Alcoólico</td>
                <td class="controlo">
                    <asp:TextBox runat="server" ID="textTeor" class="form-control me-2"
                        Style="width: 100px; display: inline;" />
                    <asp:RequiredFieldValidator ErrorMessage="Obrigatório" ControlToValidate="textTeor" runat="server"
                        Display="Dynamic" ForeColor="#CC0000" />
                </td>
            </tr>
            <tr>
                <td class="legenda">Volume</td>
                <td class="controlo">
                    <asp:TextBox runat="server" ID="textVolume" class="form-control me-2"
                        Style="width: 100px; display: inline;" />
                    <asp:RequiredFieldValidator ErrorMessage="Obrigatório" ControlToValidate="textTeor" runat="server"
                        Display="Dynamic" ForeColor="#CC0000" />
                </td>
            </tr>
            <tr>
                <td class="legenda">Forografia</td>
                <td>
                    <asp:FileUpload ID="uploadFoto" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="legenda">Casta &nbsp; </td>
                <td>
                    <asp:DropDownList ID="listCasta" runat="server" Width="250px" DataSourceID="SqlCastas"
                        DataTextField="Nome" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlCastas" runat="server"
                        ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>"
                        SelectCommand="SELECT [Id], [Nome] FROM [Casta] ORDER BY [Nome]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="text-center" colspan="2">

                    <asp:Button Text="Novo Vinho" runat="server" ID="buttonInserirVinho"
                        OnClick="buttonInserirVinho_Click" />

                </td>
            </tr>
        </table>
        <br />

</asp:Content>
