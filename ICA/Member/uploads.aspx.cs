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
        // Initial variables to be instantiated.
        ICA.Model.Util utilities = new Model.Util();
        string emailinSession = "";
        int biodataidInSession;
        string _firstname = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {

                Response.Redirect("/ICA/signIn.aspx");
            }
            else
            {
            
                emailinSession = Session["UserEmail"].ToString();

                biodataidInSession = Convert.ToInt32(Session["BiodataID"]);
               
            }

        }

        protected void upload3_Click(object sender, EventArgs e)
        {
            int biodataid = biodataidInSession;
         
            try
            {
                // first file upload for probably image files.
                //(FileUpload1.FileName.EndsWith("jpg"))
                if (FileUpload1.FileName.EndsWith("jpg"))
                {
                    string fileName = Server.MapPath("..") + "/Content/Credentials/MemberUploads/UploadOne/" + biodataid + ".jpg";
                    FileUpload1.SaveAs(fileName);
                    uploadnotification.Text = utilities.ShowSuccess("File Uploaded successfully.");
                }
                else
                {
                    uploadnotification.Text = utilities.ShowError("Wrong File Format uploaded, please upload only .jpg files.");
                }

                // second file upload for probably resume and any pdf content.
                if (FileUpload2.FileName.EndsWith("pdf"))
                {
                    string fileNameII = Server.MapPath("..") + "/Content/Credentials/MemberUploads/UploadTwo/" + biodataid + ".pdf";
                    FileUpload2.SaveAs(fileNameII);
                    uploadnotificationII.Text = utilities.ShowSuccess("File Uploaded successfully.");
                }
                else
                {
                    uploadnotificationII.Text = utilities.ShowError("Wrong File Format uploaded, please upload only .pdf files.");
                }

                // third file upload for excel files.
            //    if (FileUpload3.FileName.EndsWith(".xls"))
            //    {
            //        string fileNameIII = Server.MapPath("..") + "/Credentials/MemberUploads/UploadThree/" + biodataid + ".xls";
            //        FileUpload3.SaveAs(fileNameIII);
            //        uploadnotification.Text = utilities.ShowSuccess("File Uploaded successfully.");
            //    }
            //    else
            //    {
            //        uploadnotification.Text = utilities.ShowError("Wrong File Format uploaded, please upload only .xls files.");
            //    }
            }
            catch (Exception ex)
            {

            }
        }
    }
}