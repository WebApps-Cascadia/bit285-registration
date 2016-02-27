// Liz Fallin
// BIT 285
// Assignment 2
// login.aspx 
//
// Welcomes the user. Displays table of all users in the database
// and their last login time. If they are currently logged in,
// display their ip address

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Welcome string
        lblWelcome.Text = "Welcome, " + (string)Session["currusername"];
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {

    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Creates a command to change the login-related fields.
        // Login = false
        // IP Address = ""

        // Create connection string
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        
        // Open connection and create update
        conn.Open();
        string updateQuery = "UPDATE UserData SET logged_in = @logged_in, ipaddress = @ipaddress WHERE username = @username";
        SqlCommand com1 = new SqlCommand(updateQuery, conn);
        com1.Parameters.Add(new SqlParameter("@logged_in", false));
        com1.Parameters.Add(new SqlParameter("@ipaddress", ""));
        com1.Parameters.Add(new SqlParameter("@username", (string)Session["currusername"]));
            
        // Execute and close
        com1.ExecuteNonQuery(); // Used for Insert, Update, Delete SQL Statements
        conn.Close();

        // Go to login page
        Response.Redirect("login.aspx");

    }
}
