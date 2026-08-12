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
                pnlFAQ1.Visible = false;
                pnlFAQ2.Visible = false;
                pnlFAQ3.Visible = false;
                pnlFAQ4.Visible = false;
                pnlFAQ5.Visible = false;
            }
        }

        protected void btnFaq1_Click(object sender, EventArgs e)
        {
            pnlFAQ1.Visible = !pnlFAQ1.Visible;

            pnlFAQ2.Visible = false;
            pnlFAQ3.Visible = false;
            pnlFAQ4.Visible = false;
            pnlFAQ5.Visible = false;
        }

        protected void btnFaq2_Click(object sender, EventArgs e)
        {
            pnlFAQ2.Visible = !pnlFAQ2.Visible;

            pnlFAQ1.Visible = false;
            pnlFAQ3.Visible = false;
            pnlFAQ4.Visible = false;
            pnlFAQ5.Visible = false;
        }

        protected void btnFaq3_Click(object sender, EventArgs e)
        {
            pnlFAQ3.Visible = !pnlFAQ3.Visible;

            pnlFAQ2.Visible = false;
            pnlFAQ1.Visible = false;
            pnlFAQ4.Visible = false;
            pnlFAQ5.Visible = false;
        }

        protected void btnFaq4_Click(object sender, EventArgs e)
        {
            pnlFAQ4.Visible = !pnlFAQ4.Visible;

            pnlFAQ2.Visible = false;
            pnlFAQ3.Visible = false;
            pnlFAQ1.Visible = false;
            pnlFAQ5.Visible = false;
        }

        protected void btnFaq5_Click(object sender, EventArgs e)
        {
            pnlFAQ5.Visible = !pnlFAQ5.Visible;

            pnlFAQ2.Visible = false;
            pnlFAQ3.Visible = false;
            pnlFAQ4.Visible = false;
            pnlFAQ1.Visible = false;
        }
    }
}