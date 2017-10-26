using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Member
{
    public partial class makePayment : System.Web.UI.Page
    {
        string emailinSession = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
}