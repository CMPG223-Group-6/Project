using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ZooInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblFaq1.Visible = false;
                lblFaq2.Visible = false;
                lblFaq3.Visible = false;
                lblFaq4.Visible = false;
                lblFaq5.Visible = false;
            }
        }

        protected void btnFaq1_Click(object sender, EventArgs e)
        {
            lblFaq1.Visible = !lblFaq1.Visible;

            lblFaq2.Visible = false;
            lblFaq3.Visible = false;
            lblFaq4.Visible = false;
            lblFaq5.Visible = false;
        }

        protected void btnFaq2_Click(object sender, EventArgs e)
        {
            lblFaq2.Visible = !lblFaq2.Visible;

            lblFaq1.Visible = false;
            lblFaq3.Visible = false;
            lblFaq4.Visible = false;
            lblFaq5.Visible = false;
        }

        protected void btnFaq3_Click(object sender, EventArgs e)
        {
            lblFaq3.Visible = !lblFaq3.Visible;

            lblFaq2.Visible = false;
            lblFaq1.Visible = false;
            lblFaq4.Visible = false;
            lblFaq5.Visible = false;
        }

        protected void btnFaq4_Click(object sender, EventArgs e)
        {
            lblFaq4.Visible = !lblFaq4.Visible;

            lblFaq2.Visible = false;
            lblFaq3.Visible = false;
            lblFaq1.Visible = false;
            lblFaq5.Visible = false;
        }

        protected void btnFaq5_Click(object sender, EventArgs e)
        {
            lblFaq5.Visible = !lblFaq5.Visible;

            lblFaq2.Visible = false;
            lblFaq3.Visible = false;
            lblFaq4.Visible = false;
            lblFaq1.Visible = false;
        }
    }
}