<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.Master" AutoEventWireup="true" CodeBehind="enologos.aspx.cs" Inherits="projectoVinhos.admin.enologos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Enológos</title>
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
    <main class="container m-5">
	<h3>Enólogos</h3>
        <asp:GridView runat="server" ID="gridEnologos" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="Id" DataSourceID="sqlEnologos" ForeColor="#333333" GridLines="None" OnRowDeleted="gridEnologos_RowDeleted">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Instragram" HeaderText="Instragram" SortExpression="Instragram" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="sqlEnologos" runat="server" ConnectionString="<%$ ConnectionStrings:VinhosConnectionString %>" DeleteCommand="DELETE FROM [Enologo] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Enologo] ([Nome], [Instragram]) VALUES (@Nome, @Instragram)" SelectCommand="SELECT * FROM [Enologo] ORDER BY [Nome]" UpdateCommand="UPDATE [Enologo] SET [Nome] = @Nome, [Instragram] = @Instragram WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="Instragram" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="Instragram" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <br />
    <asp:Button ID="buttonInsert" runat="server" Text="Novo enólogo" OnClick="buttonInsert_Click" />
    <br />
</main>
    <asp:FormView ID="formEnologo" runat="server" DataKeyNames="Id" DataSourceID="sqlEnologos" Visible="false" OnItemCreated="formEnologo_ItemCreated">
        <EditItemTemplate>
            Id:
            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Nome:
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            Instragram:
            <asp:TextBox ID="InstragramTextBox" runat="server" Text='<%# Bind("Instragram") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Nome:
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            Instragram:
            <asp:TextBox ID="InstragramTextBox" runat="server" Text='<%# Bind("Instragram") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Nome:
            <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
            Instragram:
            <asp:Label ID="InstragramLabel" runat="server" Text='<%# Bind("Instragram") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
