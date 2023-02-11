using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos.utilizador
{
    public partial class editarVinho : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection
               (@"Data Source=.\SQLEXPRESS;Initial Catalog=Vinhos;Integrated Security=SSPI");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonAlterarVinho_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection
                (@"Data Source=.\SQLEXPRESS;Initial Catalog=Vinhos;Integrated Security=SSPI");


            SqlCommand command = new SqlCommand();
            command.CommandText = "UPDATE Vinho (Nome, Regiao, Produtor, Enologo, Tipo, Volume, TeorAlcoolico, Ano) " +
                "VALUES( @nome, @regiao, @produtor, @enologo, @tipo, @volume, @teorAlcoolico, @ano)";
            command.Parameters.AddWithValue("@nome", textVinho.Text);
            command.Parameters.AddWithValue("@regiao", listRegiao.SelectedValue.ToString());
            command.Parameters.AddWithValue("@produtor", listProdutor.SelectedValue.ToString());
            command.Parameters.AddWithValue("@enologo", listEnologo.SelectedValue.ToString());
            command.Parameters.AddWithValue("@tipo", listTipo.SelectedValue.ToString());
            command.Parameters.AddWithValue("@volume", textVinho.Text);
            command.Parameters.AddWithValue("@teorAlcoolico", textVinho.Text);
            command.Parameters.AddWithValue("@ano", textVinho.Text);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            gridVinhos.DataBind();
        }


    }
}