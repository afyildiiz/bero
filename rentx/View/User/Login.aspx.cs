using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rentx.View.User
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
           
                Response.Redirect("Home.aspx");
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text.Trim() == "Admin" & txtPassword.Text.Trim() == "123")
            {
                Session["admin"] = txtEmail.Text.Trim();
                Response.Redirect("../Admin/Dashboard.aspx");
            }
            else
            {
                con = new SqlConnection(Connect.GetConnectionString());
                cmd = new SqlCommand("UserPro", con);
                cmd.Parameters.AddWithValue("@Action", "LOGIN");
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    Session["username"] = txtEmail.Text.Trim();
                    Session["userId"] = dt.Rows[0]["UserId"];
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    errormsg.Visible = true;
                    errormsg.Text = "Invalid Credentials..!";
                    errormsg.CssClass = "alert alert-danger";
                }
            }
        }
    }
}