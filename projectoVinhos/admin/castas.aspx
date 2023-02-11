<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.Master" AutoEventWireup="true" CodeBehind="castas.aspx.cs" Inherits="projectoVinhos.admin.castas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Castas</title>
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
        .auto-style1 {
            display: block;
            width: 100%;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: .375rem;
            transition: none;
            border: 1px solid #ced4da;
            margin-top: 0;
            background-color: #fff;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="container">
        <h3>Castas</h3>
        <div class="row-cols-auto">
            <table class="w-100">
                <tr>
                    <td>
    <asp:GridView ID="gridCastas" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" CssClass="mt-4" DataKeyNames="Id" 
        DataSourceID="SqlDataSource1" GridLines="None" OnRowDataBound="gridCastas_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="Caracteristicas" HeaderText="Caracteristicas" SortExpression="Caracteristicas" />
        </Columns>
        <SelectedRowStyle BackColor="#990000" Font-Bold="True" />
    </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td >

        Nome: <asp:TextBox ID="textNomeCasta" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td >

        Características: <asp:TextBox ID="textCaracteristicasCasta" runat="server" CssClass="form-control" Height="100px" TextMode="MultiLine" Width="300px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td >

    <asp:LinkButton ID="linkAdicionarCasta" runat="server" CssClass="link-primary" OnClick="linkAdicionarCasta_Click">Adiciona casta</asp:LinkButton>
&nbsp;<asp:LinkButton ID="linkActualizarCasta" runat="server" CssClass="link-primary ms-4" OnClick="linkActualizarCasta_Click">Actualizar casta</asp:LinkButton>
&nbsp;<asp:LinkButton ID="linkEliminarCasta" runat="server" CssClass="link-primary ms-4" OnClick="linkEliminarCasta_Click">Eliminar casta</asp:LinkButton>
                    </td>
                </tr>
            </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>" SelectCommand="SELECT [Id], [Nome], [Caracteristicas] FROM [Casta] ORDER BY [Nome]"></asp:SqlDataSource>
       </div>
        <div class="row text-center">

&nbsp;&nbsp;&nbsp;<br />
            </div>
        </main>

</asp:Content>
