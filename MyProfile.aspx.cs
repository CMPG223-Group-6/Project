using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tourist_FirstName"] != null && Session["Tourist_LastName"] != null)
            {
                lblNameDisplay0.Text = Session["Tourist_FirstName"] + " " + Session["Tourist_LastName"];
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteAccount.aspx");
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {

        }
    }
}