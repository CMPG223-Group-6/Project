using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class CardDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentSummary.aspx");
        }

        protected void txtCVV_TextChanged(object sender, EventArgs e)
        {

        }
    }
}