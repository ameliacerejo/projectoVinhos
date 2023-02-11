<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.Master" AutoEventWireup="true" CodeBehind="criar_conta.aspx.cs" Inherits="projectoVinhos.criar_conta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Criar Conta</title>
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
            <h3 class="text-center">Criar Conta
            </h3>
            <br /> <br />
            <table class="auto-style1">
                <tr>
                    <td class="text-end">Nome </td>
                    <td>
                        <asp:TextBox ID="textNome"  runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textNome" Display="Dynamic" ErrorMessage="Nome obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-end">Email </td>
                    <td>
                        <asp:TextBox ID="textEmail" TextMode="Email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textEmail" Display="Dynamic" ErrorMessage="Email obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Email inválido" ForeColor="#6666FF" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-end">Data de nascimento </td>
                    <td>
                        <asp:TextBox ID="textData" TextMode="Date" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textData" Display="Dynamic" ErrorMessage="Data de Nascimento obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="validarDataNascimento" runat="server" ControlToValidate="textData" Display="Dynamic" ErrorMessage="&lt; 18 anos" Operator="DataTypeCheck"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-end">Username </td>
                    <td>
                        <asp:TextBox ID="textUserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="textUserName" Display="Dynamic" ErrorMessage="Username obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-end">Password </td>
                    <td>
                        <asp:TextBox ID="textPassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="textPassword" Display="Dynamic" ErrorMessage="Password obrigatória" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="buttonCriarConta" runat="server" Text="Criar Conta" OnClick="butonCriarConta_Click"/>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="login" runat="server" 
                            NavigateUrl="~/login.aspx">
                            Login</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>

</asp:Content>
