using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Lifetime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rdoStaff_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void rdoTourist_CheckedChanged(object sender, EventArgs e)
        {
        }

        protected void lbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("TouristSignUp.aspx");
        }

        protected void lbtnForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("TouristForgotPassword.aspx");
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnLoginValid_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string domain = "@zims.com";
            string Gmail = "gmail.com";
            string acza = "ac.za";
            string outlook = "outlook.com";
            string yahoo = "yahoo.com";
            // Check if the email contains the domain (case-insensitive)
            if (email.ToLower().EndsWith(domain.ToLower()))
            {
                //Valid if the entered password matches the hardcoded password.
                //before you redirect
                Response.Redirect("StaffMenu.aspx");
            }
            else if (email.ToLower().EndsWith(Gmail.ToLower()) || email.ToLower().EndsWith(acza.ToLower()) || email.ToLower().EndsWith(outlook.ToLower()) || email.ToLower().EndsWith(yahoo.ToLower()))
            {
                //When email domain is correct:
                //1. Check email exists in table(database)
                //2. Check password at that email
                //3. If both are correct you can redirect to tourist form

                Response.Redirect("TouristMenu.aspx");
            }
            else
            {
                lblInvalid.Text = "Incorrect Email address or Password.";
                txtPassword.Text = "";
                txtEmail.Text = "";
            }
        }
    }
}