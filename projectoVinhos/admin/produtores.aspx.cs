using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos.admin
{
    public partial class produtores : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-SDIJ3SGB\SQLEXPRESS;Initial Catalog=Vinhos;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetProdutores();
        }

        protected void gridProdutores_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Width = 125;
            e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[2].Width = 300;
            e.Row.Cells[3].Visible = false;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Text = Server.HtmlDecode(e.Row.Cells[2].Text);
                e.Row.Cells[3].Text = Server.HtmlDecode(e.Row.Cells[3].Text);

            }
        }

        void GetProdutores()
        {
            SqlCommand command = new SqlCommand
            ("SELECT Id, Nome, Morada, CodigoPostal, Localidade, Telefone, Email, URL FROM Produtor ORDER BY Nome ASC", connection);
            SqlDataReader reader;
            DataTable table = new DataTable();
            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();
            gridProdutores.DataSource = table;
            gridProdutores.DataBind();
        }

        protected void linkAdicionar_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand(
                "INSERT Produtor(Nome, Morada, CodigoPostal, Localidade, Telefone, Email, URL) VALUES(@nome, @morada, @codigopostal, @localidade, @telefone, @email, @url)", connection
            );
            command.Parameters.AddWithValue("@nome", textNome.Text);
            command.Parameters.AddWithValue("@morada", textMorada.Text);
            command.Parameters.AddWithValue("@codigopostal", textCodigoPostal.Text);
            command.Parameters.AddWithValue("@localidade", textLocalidade.Text);
            command.Parameters.AddWithValue("@telefone", textTelefone.Text);
            command.Parameters.AddWithValue("@email", textEmail.Text);
            command.Parameters.AddWithValue("@url", textURL.Text);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            GetProdutores();
        }

        protected void linkActualizar_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand(
                "UPDATE Produtor SET Nome= @nome, Morada = @morada, CodigoPostal = @codigopostal, Localidade = @localidade, Telefone = @telefone, Email = @email, URL = @url WHERE Id=@id", connection);
            command.Parameters.AddWithValue("@nome", textNome.Text);
            command.Parameters.AddWithValue("@morada", textMorada.Text);
            command.Parameters.AddWithValue("@codigopostal", textCodigoPostal.Text);
            command.Parameters.AddWithValue("@localidade", textLocalidade.Text);
            command.Parameters.AddWithValue("@telefone", textTelefone.Text);
            command.Parameters.AddWithValue("@email", textEmail.Text);
            command.Parameters.AddWithValue("@url", textURL.Text);
            command.Parameters.AddWithValue("@id", gridProdutores.SelectedRow.Cells[1].Text);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            GetProdutores();
        }

        protected void linkEliminar_Click(object sender, EventArgs e)
        {
            if (gridProdutores.SelectedRow != null)
            {
                string id = gridProdutores.SelectedRow.Cells[1].Text;
                int contador = 0; // ContarProdutoresVinho(id);  /*faz sentido?*/
                if (contador == 0)
                {
                    SqlCommand command = new SqlCommand(
                        "DELETE Produtor WHERE Id=@id", connection);
                    command.Parameters.AddWithValue("@id", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    GetProdutores();
                }
                else
                    Response.Write("<script>alert('O produtor" + gridProdutores.SelectedRow.Cells[2].Text + "não pode ser eliminado; tem" + contador + "vinhos associados.')</script>");
            }
            else
                Response.Write("<script>alert('Seleciona a linha a eliminar.');</script>");
        }
        protected void gridProdutores_SelectedIndexChanged(object sender, EventArgs e)
        {
            textNome.Text = gridProdutores.SelectedRow.Cells[2].Text;
            textMorada.Text = gridProdutores.SelectedRow.Cells[3].Text;
        }
    }
}