/**
* Fred Jaworski
* Assignment 2
* 2/26/2016
*
* Code for processing new account information
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class NewAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		
	}

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl, true); // A Down-and-dirty trick to reset the page
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
	    string userName = txtUserName.Text;

	    if (String.IsNullOrWhiteSpace(userName))
	    {
		    userName = txtFirstName.Text[0] + txtLastName.Text;
	    }

		SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);

		conn.Open();
        string checkuser = "SELECT count(*) FROM UserData WHERE UserName=@username";
        int temp = 0;
        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@username", userName);
        temp = Convert.ToInt32(com.ExecuteScalar());
        if (temp > 0)
        {
            lblSuccess.Visible = true;
            lblSuccess.Text = "User already exists! Try different user name.";
        }
        else
        {
            try
            {
	            Session["LoggedIn"] = true;
	            Session["User"] = userName;

	            string insertQuery = 
					"INSERT INTO UserData " + 
					"(firstName, lastName, emailUpdates, email, userName, password, lastLogin, programID, loggedIn, ipAddress) " +
					"VALUES (@first, @last, @emailUp, @email, @user, @pass, @lastLog, @program, @loggedIn, @ip)";

                SqlCommand com1 = new SqlCommand(insertQuery, conn);
	            com1.Parameters.AddWithValue("@first", txtFirstName.Text);
	            com1.Parameters.AddWithValue("@last", txtLastName.Text);
	            com1.Parameters.AddWithValue("@emailUp", chkEmailUpdates.Checked);
				com1.Parameters.AddWithValue("@email", txtEmail.Text);
				com1.Parameters.AddWithValue("@user", userName);
                com1.Parameters.AddWithValue("@pass", txtPassword.Text);
	            com1.Parameters.AddWithValue("@lastLog", DateTime.Now);
	            com1.Parameters.AddWithValue("@program", txtProgramID.Text);
	            com1.Parameters.AddWithValue("@loggedIn", true);
	            com1.Parameters.AddWithValue("@ip", HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]);

                com1.ExecuteNonQuery(); // Used for Insert, Update, Delete SQL Statements
	            conn.Close();
                Response.Redirect("Welcome.aspx");
            }
            catch (Exception ex)
            {
                lblSuccess.Text = "Error: " + ex.ToString();
            }
        }
    }
}