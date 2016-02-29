/**
* Fred Jaworski
* Assignment 2
* 2/26/2016
*
* Redirects to login page if user is not logged in
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		bool LoggedIn = (bool)Session["LoggedIn"];

		if (!LoggedIn)
		{
			Response.Redirect("Login.aspx");
		}

	    lblWelcome.Text =
		    "Welcome, " + ((string) Session["User"]) + "! How's it going?";
    }
}