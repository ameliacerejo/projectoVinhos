<%@ Page Title="" Language="C#" MasterPageFile="~/primeira.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="projectoVinhos.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <style>
        table {
            width: 500px;
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
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="container m-5 text-center">

            <asp:Login ID="loginUtilizador" runat="server" OnLoggingIn="loginUtilizador_LoggingIn" OnLoggedIn="loginUtilizador_LoggedIn"
                CreateUserText="Criar conta"
                CreateUserUrl="~/criar_conta.aspx"
                DestinationPageUrl="~/gestao/dados.aspx">
            </asp:Login>

        </div>


</asp:Content>
