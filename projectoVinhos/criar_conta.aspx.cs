using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos
{
    public partial class criar_conta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string data = DateTime.Now.AddYears(-18).ToShortDateString();
                validarDataNascimento.ErrorMessage =
                "Defina data igual ou anterior a " + data;
                validarDataNascimento.Type = ValidationDataType.Date;
                validarDataNascimento.Operator = ValidationCompareOperator.LessThan;
                validarDataNascimento.ValueToCompare = data;
            }


        }

        //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    if ((args.Value.Length >=5) && (args.Value.Length<=20)) 
        //        args.IsValid= true;
        //    else
        //        args.IsValid = false;
        //}

        protected void butonCriarConta_Click(object sender, EventArgs e)
        {
            {
                //Criar conta - Membership
                Membership.CreateUser(textUserName.Text, textPassword.Text, textEmail.Text);
                //obter o UserID
                MembershipUser user = Membership.GetUser(textUserName.Text);
                object user_id = user.ProviderUserKey;

                //adicionar utilizador à role Utilizador

                Roles.AddUserToRole(textUserName.Text, "Utilizador");

                //Criar Utilizador (vinhos)
                SqlConnection connection = new SqlConnection(
                ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "INSERT Utilizador VALUES(@user_id , @nome, @email, @data)";
                command.Parameters.AddWithValue("@nome", textNome.Text);
                command.Parameters.AddWithValue("@email", textEmail.Text);
                command.Parameters.AddWithValue("@data", DateTime.Parse(textData.Text));
                command.Parameters.AddWithValue("@user_id", user_id.ToString());
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("login.aspx");
            }
        }
    }
}