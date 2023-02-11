using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos
{
    public partial class vinho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
                GetVinho(Request.QueryString["id"].ToString());
        }

        void GetVinho(string id)
        {
            SqlConnection connection = new SqlConnection
            (@"data source=.\sqlexpress; initial catalog=vinhos; " +
            "integrated security = true;");
            SqlCommand command = new SqlCommand();
            command.CommandText = "usp_GetVinhoById";
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = connection;
            command.Parameters.AddWithValue("@id", id);
            SqlDataReader reader;
            connection.Open();
            reader = command.ExecuteReader();
            while (reader.Read())
            {
                vinhoNome.Text = reader[1].ToString();
                vinhoFoto.ImageUrl = reader[2].ToString();
                vinhoProdutor.Text = reader[3].ToString();
                vinhoRegiao.Text = reader[4].ToString();
                vinhoTipo.Text = reader[5].ToString();
            }
            connection.Close();
        }

    }
}