using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos.utilizador
{
    SqlConnection connection = new SqlConnection
                (@"Data Source=.\SQLEXPRESS;Initial Catalog=Vinhos;Integrated Security=SSPI");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void buttonInserirVinho_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection
            (@"Data Source=.\SQLEXPRESS;Initial Catalog=Vinhos;Integrated Security=SSPI");


        SqlCommand command = new SqlCommand();
        command.CommandText = "INSERT Vinho (Nome, Regiao, Produtor, Enologo, Tipo, Volume, TeorAlcoolico, Ano) " +
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

    protected void buttonApagarVinho_Click(object sender, EventArgs e)
    {
        if (gridVinhos.SelectedRow != null)
        {
            string id = gridVinhos.SelectedRow.Cells[1].Text;
            int contador = ContarVinhos(id);
            if (contador == 0)
            {

                SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=Vinhos;Integrated Security=SSPI");

                SqlCommand command = new SqlCommand();
                command.CommandText = "DELETE Vinho (Nome, Regiao, Produtor, Enologo, Tipo, Volume, TeorAlcoolico, Ano) " +
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
        int ContarVinhos(string idVinho)
        {
            SqlCommand command = new SqlCommand
                ("SELECT COUNT(*) FROM Vinho WHERE Vinho = @idVinho", connection);
            command.Parameters.AddWithValue("@idVinho", idVinho);
            connection.Open();
            int contadorVinhos = (int)command.ExecuteScalar();
            connection.Close();
            return contadorVinhos;
        }
    }
}