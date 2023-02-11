<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.master" AutoEventWireup="true"
    CodeBehind="area_pessoal.aspx.cs" Inherits="projectoVinhos.utilizador.area_pessoal" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Área de pessoal</title>
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

        <h1 class="text-center">Área Pessoal</h1>

        <asp:GridView runat="server" ID="gridVinhos" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333"
            GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id"
            DataSourceID="SqlVinhos" PageSize="8">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id"
                    Visible="False" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Foto" HeaderText="Foto" SortExpression="Foto" />
                <asp:BoundField DataField="Regiao" HeaderText="Regiao" SortExpression="Regiao" Visible="False" />
                <asp:BoundField DataField="Produtor" HeaderText="Produtor" SortExpression="Produtor" Visible="False" />
                <asp:BoundField DataField="Enologo" HeaderText="Enologo" SortExpression="Enologo" Visible="False" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" Visible="False" />
                <asp:BoundField DataField="Volume" HeaderText="Volume" SortExpression="Volume" />
                <asp:BoundField DataField="TeorAlcoolico" HeaderText="TeorAlcoolico" SortExpression="TeorAlcoolico" />
                <asp:BoundField DataField="Ano" HeaderText="Ano" SortExpression="Ano" />
                <asp:BoundField DataField="Utilizador" HeaderText="Utilizador" SortExpression="Utilizador"
                    Visible="False" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NextPreviousFirstLast" NextPageText="Seguinte" PreviousPageText="Anterior" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
            DataKeyNames="Id" DataSourceID="SqlOsVinhos">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                    SortExpression="Id" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Foto" HeaderText="Foto" SortExpression="Foto" />
                <asp:BoundField DataField="Região" HeaderText="Região" SortExpression="Região" />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                <asp:BoundField DataField="Enólogo" HeaderText="Enólogo" SortExpression="Enólogo" />
                <asp:BoundField DataField="Produtor" HeaderText="Produtor" SortExpression="Produtor" />
                <asp:BoundField DataField="Casta" HeaderText="Casta" SortExpression="Casta" />
                <asp:BoundField DataField="Utilizador" HeaderText="Utilizador" SortExpression="Utilizador" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlOsVinhos" runat="server"
            ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>"
            SelectCommand="SELECT Vinho.Id, Vinho.Nome, Vinho.Foto, Regiao.Nome AS Região, Tipo.Nome AS Tipo, Enologo.Nome AS Enólogo, Produtor.Nome AS Produtor, Casta.Nome AS Casta, Vinho.Utilizador FROM Casta INNER JOIN Enologo ON Casta.Id = Enologo.Id INNER JOIN Produtor ON Casta.Id = Produtor.Id INNER JOIN Regiao ON Casta.Id = Regiao.Id INNER JOIN Tipo ON Casta.Id = Tipo.Id INNER JOIN Vinho ON Enologo.Id = Vinho.Enologo AND Produtor.Id = Vinho.Produtor AND Regiao.Id = Vinho.Regiao AND Tipo.Id = Vinho.Tipo WHERE (Vinho.Utilizador = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="user_id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

        <br />

        <table class="w-50">
            <tr>
                <td class="text-center" colspan="2">

                    <asp:Button Text="Novo Vinho" runat="server" ID="buttonNovoVinho" OnClick="buttonNovoVinho_Click" />
                    <asp:Button Text="Editar Vinho" runat="server" ID="buttonEditarVinho" style="margin-left: 30px"/>
                </td>
            </tr>
        </table>
        <br />

    </asp:Content>