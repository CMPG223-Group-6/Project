using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class QuestionnaireForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If questionnaire has already been completed, // do not allow the user to return to this page
            if (Session["QuestionnaireCompleted"] != null && (bool)Session["QuestionnaireCompleted"] == true) 
            {
                Response.Redirect("Checkout.aspx"); 
            }
        }

        protected void btnQuestionaireComplete_Click(object sender, EventArgs e)
        {
            lblMessage1.Text = "";
            lblMessage2.Text = "";
            lblMessage3.Text = "";
            lblMessage4.Text = "";
            lblMessage5.Text = "";
            lblMessage6.Text = "";
            lblMessage7.Text = "";

            bool allAnswered = true;

            // Check Question 1
            if (!rbQ1Yes.Checked && !rbQ1No.Checked)
            {
                lblMessage1.Text = "Please answer this question .<br/>";
                allAnswered = false;
            }

            // Check Question 2
            if (!rbQ2Yes.Checked && !rbQ2No.Checked)
            {
                lblMessage2.Text = "Please answer this question.<br/>";
                allAnswered = false;
            }

            // Check Question 3
            if (!rbQ3Yes.Checked && !rbQ3No.Checked)
            {
                lblMessage3.Text = "Please answer this question.<br/>";
                allAnswered = false;
            }

            // Check Question 4
            if (!rbQ4Yes.Checked && !rbQ4No.Checked)
            {
                lblMessage4.Text = "Please answer this question.<br/>";
                allAnswered = false;
            }

            // Check Question 5
            if (!rbQ5Yes.Checked && !rbQ5No.Checked)
            {
                lblMessage5.Text = "Please answer this question.<br/>";
                allAnswered = false;
            }

            // Check Question 6
            if (!rbQ6Yes.Checked && !rbQ6No.Checked)
            {
                lblMessage6.Text = "Please answer this question.<br/>";
                allAnswered = false;
            }

            // Check Question 7
            if (!rbQ7Yes.Checked && !rbQ7No.Checked)
            {
                lblMessage7.Text = "Please answer this question.<br/>";
                allAnswered = false;
            }

            // If all 7 questions have been answered
            if (allAnswered)
            {
                // Remember that the questionnaire has been completed
                Session["QuestionnaireCompleted"] = true;

                Response.Redirect("Checkout.aspx");
            }

           
        }
    }
}