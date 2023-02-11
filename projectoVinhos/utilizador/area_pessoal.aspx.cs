using projectoVinhos.admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos.utilizador
{
    public partial class area_pessoal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetVinhos();

        }
        void GetVinhos()
        {
            SqlConnection connection = new SqlConnection(
            @"Data Source=.\sqlexpress02;Initial Catalog=Vinhos;Integrated Security=SSPI");
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText =
            "SELECT Vinho.Id, Vinho.Nome, Tipo.Nome AS Tipo, Regiao.Nome AS Região " +
            "FROM Vinho INNER JOIN Regiao ON Vinho.Regiao = Regiao.Id " +
            "INNER JOIN Tipo ON Vinho.Tipo = Tipo.Id " +
            "WHERE(Vinho.Utilizador = @id_utilizador) " +
            "ORDER BY Vinho.Nome";
            command.Parameters.AddWithValue("@id_utilizador", Session["id_utilizador"].ToString());
            SqlDataReader reader;
            DataTable table = new DataTable();
            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();
            gridVinhos.DataSource = table;
            gridVinhos.DataBind();
        }

        protected void buttonNovoVinho_Click(object sender, EventArgs e)
        {
            Response.Redirect("novoVinho.aspx");
        }


        protected void buttonEditarVinho_Click(object sender, EventArgs e)
        {
            if (gridVinhos.SelectedRow != null)
            {
                Session["vinho"] = gridVinhos.SelectedRow.Cells[1].Text;
                Response.Redirect("editarVinho.aspx");
            }
        }


    }
}