using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICA.Member
{
    public partial class uploads : System.Web.UI.Page
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

        protected void upload3_Click(object sender, EventArgs e)
        {
            try
            {
                //if (FileUpload1.FileName.EndsWith("jpg"))
                //{
                //    string fileName = Server.MapPath("~") + "/Credentials/MemberUploads/UploadOne" + biodataid + ".jpg";
                //    FileUpload1.SaveAs(fileName);
                //}

                // if (FileUpload2.FileNameII.EndsWith("pdf"))
                //{
                //    string fileNameII = Server.MapPath("~") + "/Credentials/MemberUploads/UploadTwo" + biodataid + ".jpg";
                //    FileUpload2.SaveAs(fileNameII);
                //}
                //if (FileUpload3.FileNameIII.EndsWith("jpg"))
                //{
                //    string fileNameIII = Server.MapPath("~") + "/Credentials/MemberUploads/UploadThree" + biodataid + ".jpg";
                //    FileUpload3.SaveAs(fileNameIII);
                //}
            }
            catch (Exception ex)
            {

            }
        }
    }
}