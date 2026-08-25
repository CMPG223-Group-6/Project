using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class MaintainEventsTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEventType.aspx");
        }

        protected void btnChangeEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeEventType.aspx");
        }

        protected void btnDeleteEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteEvent.aspx");
        }
    }
}