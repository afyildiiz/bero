using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rentx.View.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)

        {

            if (Session["userId"] != null)
            {
                Sign.Text = "Sign Out";
                 }
            else
            {
                Sign.Text = "Sign In";
                
            }
            if (Session["userId"] != null)
            {
                bttnProfile.Visible = true;

            }

        }
       

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
               
                Response.Redirect("Login.aspx");
            }
            else
            {
              
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
           

        }

        protected void Profile_Click(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                
                Response.Redirect("Contact.aspx");
            }
        }
    }
}