// Liz Fallin
// BIT 285
// Assignment 2
// newaccount.aspx 
//
// Allows the user to create a new account. Offers suggested passwords,
// based on user's name, birth year, and favorite color
// *** TODO When a password is selected, populate the password text box ***

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
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);

        conn.Open();
        string checkuser = "SELECT count(*) FROM UserData WHERE UserName= @username";
        int temp = 0;
        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.Add(new SqlParameter("@username", txtUsername.Text.Trim()));
        temp = Convert.ToInt32(com.ExecuteScalar());
        if (temp > 0)
        {
            lblSuccess.Visible = true;
            lblSuccess.Text = "User Already Exists! Try different name.";
        }
        else
        {
            try
            {
                string insertQuery = 
                    "INSERT INTO UserData (username, firstname, lastname, password, email, email_updates, logged_in) VALUES (@username, @firstname, @lastname, @password, @email, @email_updates, @logged_in)";
                SqlCommand com1 = new SqlCommand(insertQuery, conn);
                com1.Parameters.Add(new SqlParameter("@username", txtUsername.Text));
                com1.Parameters.Add(new SqlParameter("@firstname", txtFirstName.Text));
                com1.Parameters.Add(new SqlParameter("@lastname", txtLastName.Text));
                com1.Parameters.Add(new SqlParameter("@password", txtPassword.Text));
                com1.Parameters.Add(new SqlParameter("@email", txtEmail.Text));
                com1.Parameters.Add(new SqlParameter("@email_updates", chkEmailOptIn.Checked));
                com1.Parameters.Add(new SqlParameter("@logged_in", true));
                com1.ExecuteNonQuery(); // Used for Insert, Update, Delete SQL Statements
                conn.Close();
                Response.Redirect("login.aspx");
            }
            catch (Exception ex)
            {
                lblSuccess.Text = "Error: " + ex.ToString();
            }
        }
    }




    protected void btnSuggPwds_Click(object sender, EventArgs e)
    {
        // Set the password generation labels, text boxes, and buttons to visible
        lblFavoriteColor.Visible = true;
        lblBirthYear.Visible = true;
        txtFirstName.Visible = true;
        txtLastName.Visible = true;
        txtFavoriteColor.Visible = true;
        txtBirthYear.Visible = true;
        btnGenerate.Visible = true;
    }
    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        // Create five strings, based on the values in the three text boxes
        // Each string must be at least 8 chars long
        // White space will be removed before use
        // Random characters will be used to pad the three strings

        // ArrayList aList = new ArrayList();
        string[] aList = new string[5];

        // Create string of random chars,
        // to be used in passwords as needed for padding
        Random r = new Random();
        string rString = "";
        int rNum = 0;

        // Create a string of random lower case letters, to pad the three strings
        for (int i = 0; i < 15; i++)
        {
            rNum = r.Next(0, 26); // Zero to 25
            rString = rString + (char)('a' + rNum);
        }

        // Delete any white space in the strings
        string lastName = txtLastName.Text.Replace(" ", "");
        string birthYear = txtBirthYear.Text.Replace(" ", ""); ;
        string favoriteColor = txtFavoriteColor.Text.Replace(" ", ""); ;

        // Append five random characters to the strings, to ensure that there are 
        // at least five chars in each one for the password suggestions below
        lastName += rString.Substring(0, 5);
        birthYear += rString.Substring(5, 5);
        favoriteColor += rString.Substring(10, 5);

        // Create a string which is the reverse of Birth Year
        char[] yearArray = birthYear.ToCharArray();
        Array.Reverse(yearArray);
        string reverseYear = new string(yearArray);

        // Create proposed passwords, using a combination of last name, birth year, favorite color, and random chars
        // Because each string has a minimum of five chars (see padding above), use up to five chars in combinations.
        aList[0] = (birthYear.Substring(0, 5) + lastName.Substring(0, 5));
        aList[1] = (lastName.Substring(0, 5) + birthYear.Substring(2, 2) + favoriteColor.Substring(0, 5));
        aList[2] = (reverseYear.Substring(0, 4) + lastName.Substring(0, 4) + favoriteColor.Substring(0, 2));
        aList[3] = (favoriteColor.Substring(0, 5) + lastName.Substring(0, 5));
        aList[4] = (lastName.Substring(3, 2) + birthYear.Substring(0, 4) + favoriteColor.Substring(3, 2));

        // Set the data source, and bind to the drop down list
        ddlPasswords.DataSource = aList;
        ddlPasswords.DataBind();

        // Make the dropdown list visible
        ddlPasswords.Visible = true;

    }

    protected void lboxPasswords_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlPasswords_SelectedIndexChanged(object sender, EventArgs e)
    {
        // TODO: Select an item and populate the password text box
        txtPassword.Text = Convert.ToString(ddlPasswords.SelectedValue);

    }


   protected void btnReturnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }


   protected void Button1_Click(object sender, EventArgs e)
   {
   }
 
}