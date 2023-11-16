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
    public partial class Signup : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

        }





        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            
            int UserId = Convert.ToInt32(Request.QueryString["id"]);
            con = new SqlConnection(Connect.GetConnectionString());
            cmd = new SqlCommand("UserPro", con);
            cmd.Parameters.AddWithValue("@Action", UserId == 0 ? "SIGNUP" : "UPDATE");
            cmd.Parameters.AddWithValue("@UserId", UserId);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@PostCode", txtZipcode.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@IdNumber", txtIdno.Text.Trim());

            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                actionName = UserId == 0 ? "signed up" : "updated";
                lblMsg.Visible = true;
                lblMsg.Text = "User " + actionName + " succesfully!";
                lblMsg.CssClass = "alert alert-success";
                clear();
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constarint")) 
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = txtEmail.Text.Trim() + " already exist!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
        }
        void clear()
        {
            txtName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtZipcode.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtIdno.Text = string.Empty;
            UserId.Value = "0";        

        }
    }
}