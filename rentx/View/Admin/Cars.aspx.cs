using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rentx.View.Admin
{
    public partial class Cars : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCars();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int CarId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connect.GetConnectionString());
            cmd = new SqlCommand("CarPro", con);
            cmd.Parameters.AddWithValue("@Action", CarId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@CarId", CarId);
            cmd.Parameters.AddWithValue("@PlateNo", txtPlateNo.Text.Trim());
            cmd.Parameters.AddWithValue("@Make", txtMake.Text.Trim());
            cmd.Parameters.AddWithValue("@Model", txtModel.Text.Trim());
            cmd.Parameters.AddWithValue("@Color", txtColor.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@DailyPrice", txtDailyPrice.Text.Trim());
            cmd.Parameters.AddWithValue("@isStatus", cbIsAvailable.Checked);
            if (fuCarImage.HasFile)
            {
                if (Utils.IsValidExtension(fuCarImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuCarImage.FileName);
                    imagePath = "Assets/Img/" + obj.ToString() + fileExtension;
                    fuCarImage.PostedFile.SaveAs(Server.MapPath("~/Assets/Img/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    errormsg.Visible = true;
                    errormsg.Text = "Please select one of these extension : .jpg , .png , .jpeg ";
                    errormsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = CarId == 0 ? "added" : "updated";
                    errormsg.Visible = true;
                    errormsg.Text = "Car " + actionName + " succesfully!";
                    errormsg.CssClass = "alert alert-success";
                  

                    clear();


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

        private void getCars()
        {
            con = new SqlConnection(Connect.GetConnectionString());
            cmd = new SqlCommand("CarPro", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            lCar.DataSource = dt;
            lCar.DataBind();

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        void clear()
        {
            txtPlateNo.Text = string.Empty;
            txtMake.Text = string.Empty;
            txtModel.Text = string.Empty;
            txtColor.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtDailyPrice.Text = string.Empty;
            cbIsAvailable.Checked = false;
            hdnId.Value = "0";
            btnAdd.Text = "Add";
            imgCars.ImageUrl = String.Empty;
        }

        protected void lCar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            errormsg.Visible = false;
            if (e.CommandName == "edit")
            {
                con = new SqlConnection(Connect.GetConnectionString());
                cmd = new SqlCommand("CarPro", con);
                cmd.Parameters.AddWithValue("@Action", "GETID");
                cmd.Parameters.AddWithValue("@CarId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);

                txtPlateNo.Text = dt.Rows[0]["PlateNo"].ToString();
                txtMake.Text = dt.Rows[0]["Make"].ToString();
                txtModel.Text = dt.Rows[0]["Model"].ToString();
                txtColor.Text = dt.Rows[0]["Color"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
                txtDailyPrice.Text = dt.Rows[0]["DailyPrice"].ToString();
                cbIsAvailable.Checked = Convert.ToBoolean(dt.Rows[0]["isStatus"]);
                imgCars.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../../Assets/Img/no-image.png" : "../../" + dt.Rows[0]["ImageUrl"].ToString();
                imgCars.Height = 80;
                imgCars.Width = 80;
                hdnId.Value = dt.Rows[0]["CarId"].ToString();
                btnAdd.Text = "Update";
                LinkButton btn = e.Item.FindControl("EditBttn") as LinkButton;
                btn.CssClass = "badge badge-warning";
            
            }
            else if (e.CommandName == "delete")
            {
                con = new SqlConnection(Connect.GetConnectionString());
                cmd = new SqlCommand("CarPro", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("CarId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    errormsg.Visible = true;
                    errormsg.Text = "Car deleted successfully!";
                    errormsg.CssClass = "alert alert-success";
                    getCars();
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

        protected void lCar_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label stat = e.Item.FindControl("lblStatus") as Label;
                if (stat.Text == "True")
                {
                    stat.Text = "Available";
                    stat.CssClass = "badge badge-success";
                }else
                {
                    stat.Text = "Not Available";
                    stat.CssClass = "badge badge-danger";
                }


            }
        }
    }
}