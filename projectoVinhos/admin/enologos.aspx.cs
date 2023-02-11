using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos.admin
{
    public partial class enologos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonInsert_Click(object sender, EventArgs e)
        {
            formEnologo.Visible = true;
            formEnologo.ChangeMode(FormViewMode.Insert);
        }

        protected void formEnologo_ItemCreated(object sender, EventArgs e)
        {
            formEnologo.Visible = false;
        }

        protected void gridEnologos_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            //tratar erro - Este énologo não pode ser eliminado
            Response.Write("<script>Alert('Este enólogo não pode ser eliminado.');<z/script>");       
        }
    }
}