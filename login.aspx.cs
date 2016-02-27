// Liz Fallin
// BIT 285
// Assignment 2
// login.aspx 
//
// Allows the user to log in. Allows successful login if there is exactly
// one matching username/password combination in the database

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Create an SQL query which will see if the given user name/password is in the database

        // Create connection
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);

        // Create and execute query, based on user-defined parameters
        conn.Open();
        string checkuser = "SELECT count(*) FROM UserData WHERE UserName=@username AND Password=@password";
        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@username", txtLoginUser.Text);
        com.Parameters.AddWithValue("@password", txtLoginPassword.Text);
        int temp = Convert.ToInt32(com.ExecuteScalar());
        conn.Close();

        // If there is exactly one username/password combination which matches the information given by the user
        if (temp == 1)
        {
            // User has been validated
            //Session["New"] = txtLoginUser.Text;
            lblPasswordStatus.Visible = true;
            lblPasswordStatus.Text = "Credentials are validated!";

            // Update last login time, logged in flag, and current ip address
            conn.Open();

            // Get the ip address. If this can't be accessed, set a "not found" message
            string newipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (newipaddress == null)
                newipaddress = "not found";

            // Update the user's account with current login time, login flag, and ip address
            string updateQuery = "UPDATE UserData SET last_login = @last_login, logged_in = @logged_in, ipaddress = @ipaddress WHERE username = @username AND password = @password";
            SqlCommand com1 = new SqlCommand(updateQuery, conn);
            com1.Parameters.Add(new SqlParameter("@last_login", DateTime.Now));
            com1.Parameters.Add(new SqlParameter("@logged_in", true));
            com1.Parameters.Add(new SqlParameter("@ipaddress", newipaddress));
            com1.Parameters.Add(new SqlParameter("@username", txtLoginUser.Text));
            com1.Parameters.Add(new SqlParameter("@password", txtLoginPassword.Text));
            
            com1.ExecuteNonQuery(); // Used for Insert, Update, Delete SQL Statements
            conn.Close();

            // Set the username as a session variable
            Session["currusername"] = txtLoginUser.Text;

            // Go to welcome page
            Response.Redirect("Welcome.aspx");

        }
        else
        {
            // Zero, or >1, user/password combinations found. Invalid credentials
            lblPasswordStatus.Visible = true;
            lblPasswordStatus.Text = "Invalid credentials!Try again.";
        }   
    }
}