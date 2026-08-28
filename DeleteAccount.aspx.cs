using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class DeleteAccount : System.Web.UI.Page
    {
        int Tourist_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tourist_ID"] != null)
            {
                Tourist_ID = (int)Session["Tourist_ID"];
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {

        }

        protected void btnProceed_Click1(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx");
        }
    }
}