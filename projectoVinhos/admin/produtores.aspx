<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.Master" AutoEventWireup="true" CodeBehind="produtores.aspx.cs" Inherits="projectoVinhos.admin.produtores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Produtores</title>
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
    <div>
    <h2><b>Produtores</b></h2>
        <br />
        <br />
        <br />
        <div>
         <asp:GridView ID="gridProdutores" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridProdutores_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
             <Columns>
                 <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                 <asp:BoundField DataField="Morada" HeaderText="Morada" SortExpression="Morada" />
                 <asp:BoundField DataField="CodigoPostal" HeaderText="CodigoPostal" SortExpression="CodigoPostal" />
                 <asp:BoundField DataField="Localidade" HeaderText="Localidade" SortExpression="Localidade" />
                 <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
                 <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                 <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
             </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>" SelectCommand="SELECT [Id], [Nome], [Morada], [CodigoPostal], [Localidade], [Telefone], [Email], [URL] FROM [Produtor] ORDER BY [Nome]"></asp:SqlDataSource>
            <br />
            <br />
            Nome:
            <asp:TextBox ID="textNome" runat="server" Width="300" CssClass="form-control"></asp:TextBox>
            <br />
            Morada:<br />
            <asp:TextBox ID="textMorada" runat="server" Width="300" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            Codigo Postal:<br />
            <asp:TextBox ID="textCodigoPostal" runat="server" Width="300" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            Localidade:<br />
            <asp:TextBox ID="textLocalidade" runat="server" Width="300" CssClass="form-control"></asp:TextBox>
                        <br />
            <br />
            Telefone:
            <br />
            <br />
            <asp:TextBox ID="textTelefone" runat="server" Width="300" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            Email:<br />
            <asp:TextBox ID="textEmail" runat="server" Width="300" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate ="textEmail" runat="server" ErrorMessage="Inserir email válido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            URL:
            <asp:TextBox ID="textURL" runat="server" Width="300" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="linkAdicionar" runat="server" CssClass="link-primary" OnClick="linkAdicionar_Click">Adicionar</asp:LinkButton>
            <asp:LinkButton ID="linkActualizar" runat="server" CssClass="link-primary ms-4" OnClick="linkActualizar_Click">Atualizar</asp:LinkButton>
            <asp:LinkButton ID="linkEliminar" runat="server" CssClass="link-primary ms-4" OnClick="linkEliminar_Click">Eliminar</asp:LinkButton>
            <br />
         </div>

        </div>
</asp:Content>
