using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ValidateUser : System.Web.UI.Page
    {

        string validEmail = "admin@zims.com";
        string validPassword = "ZimsAdmin";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtEmail.Text = "";
            txtPassword.Text = "";
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            if (email == validEmail && password == validPassword)
            {
                Response.Redirect("MaintainEventsTypes.aspx");
            }
            else
            {
                lblError.Text = "Invalid email or password. Please try again.";
            }
        }
    }
}