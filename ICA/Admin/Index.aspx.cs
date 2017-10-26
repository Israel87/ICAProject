using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        string emailinSession = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {

                Response.Redirect("~/ICA/signIn.aspx");
            }
            else
            {
                //_userSession = Session["UserID"].ToString();
                emailinSession = Session["UserEmail"].ToString();


            }
        }
    }
}