using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rentx.View.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            getUsers();
        }

        protected void UserV_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void UserV_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                con = new SqlConnection(Connect.GetConnectionString());
                cmd = new SqlCommand("UserPro", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@UserId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errormsg.Visible = true;
                    errormsg.Text = "User deleted successfully!";
                    errormsg.CssClass = "alert alert-success";
                    getUsers();
                }
                catch (Exception ex)
                {
                    errormsg.Visible = true;
                    errormsg.Text = "Error- " + ex.Message;
                    errormsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }
        private void getUsers()
        {
            con = new SqlConnection(Connect.GetConnectionString());
            cmd = new SqlCommand("UserPro", con);
            cmd.Parameters.AddWithValue("@Action", "DISPLAYUSERS");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            UserV.DataSource = dt;
            UserV.DataBind();

        }
    }
}