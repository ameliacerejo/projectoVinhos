using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectoVinhos
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void loginUtilizador_LoggingIn(object sender, LoginCancelEventArgs e)
        {

        }

        protected void loginUtilizador_LoggedIn(object sender, EventArgs e)
        {
            //Validar utilizador - Membership
            MembershipUser user = Membership.GetUser(loginUtilizador.UserName);
            //Se Login do administrador, reencaminha para a respectiva área de gestão
            if (loginUtilizador.UserName == "admin")
                Response.Redirect("admin/area_gestao.aspx");
            //Login de utilizador - colocar UserID em Session
            Session["id_utilizador"] = user.ProviderUserKey.ToString();
            Response.Redirect("utilizador/area_pessoal.aspx");
        }
    }
}