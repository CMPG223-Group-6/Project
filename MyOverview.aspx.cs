using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class MyOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Tourist_LastName"] != null && Session["Tourist_FirstName"] != null)
            {
                lblNameDisplay.Text = Session["Tourist_FirstName"] + " " + Session["Tourist_LastName"];
            }
        }

        protected void gdvDisplayEvents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}