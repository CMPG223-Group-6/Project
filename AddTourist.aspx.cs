using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Project
{
    public partial class AddTourist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string surname = txtSurname.Text;
            string phone = txtPhoneNo.Text;
            string email = txtEmail.Text;
            string date = txtDate.Text;
            string country = ddlCountries.SelectedValue;
            
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainTourists.aspx");
        }
    }
}