using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblTouristEmail.Visible = false;
                lblStaffHeadingLogin.Visible = false;
                lblTouristPassword.Visible = false;
                lblStaffEmail.Visible = false;
                lblTouristHeading.Visible = false;
                lblTouristID.Visible = false;
                txtStaffPassword.Visible = false;
                txtTouristPassword.Visible = false;
                txtTouristID.Visible = false;
                btnStaffLogin.Visible = false;
                btnTouristLogin.Visible = false;
                lbtnSignUp.Visible = false;
                lbtnForgotPassword.Visible = false;
                lblStaffPassword.Visible = false;
                txtStaffEmail.Visible = false;
                txtTouristEmail.Visible = false;
            }
        }

        protected void btnLoginStaff_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnLoginTourist_Click(object sender, EventArgs e)
        {
            
        }

        protected void rdoStaff_CheckedChanged(object sender, EventArgs e)
        {
            if(rdoStaff.Checked)
            {
                lblStaffEmail.Visible = true;
                lblStaffHeadingLogin.Visible = true;
                lblStaffPassword.Visible = true;
                btnStaffLogin.Visible = true;
                txtStaffEmail.Visible = true;
                txtStaffPassword.Visible = true;

                lblTouristID.Visible = false;
                lblTouristHeading.Visible = false;
                btnTouristLogin.Visible = false;
                lbtnSignUp.Visible = false;
                txtTouristID.Visible = false;
                lbtnForgotPassword.Visible = false;
            }

        }

        protected void rdoTourist_CheckedChanged(object sender, EventArgs e)
        {
            if(rdoTourist.Checked)
            {
                lblTouristID.Visible = true;
                lblTouristEmail.Visible = true;
                lblTouristHeading.Visible = true;
                lblTouristPassword.Visible = true;
                btnTouristLogin.Visible = true;
                lbtnSignUp.Visible = true;
                txtTouristEmail.Visible = true;
                txtTouristPassword.Visible = true;
                txtTouristID.Visible = true;
                lbtnForgotPassword.Visible = true;

                lblStaffEmail.Visible = false;
                lblStaffHeadingLogin.Visible = false;
                lblStaffPassword.Visible = false;
                btnStaffLogin.Visible = false;
                txtStaffEmail.Visible = false;
                txtStaffPassword.Visible = false;
            }
        }

        protected void lbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("TouristSignUp.aspx");
        }

        protected void lbtnForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("TouristForgotPassword.aspx");
        }
    }
}