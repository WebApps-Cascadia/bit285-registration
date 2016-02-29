<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        Session["LoggedIn"] = false;
        Session["User"] = "Guest";

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        string updateLogin =
            "UPDATE UserData SET loggedIn=@false WHERE userName=@username";

        SqlConnection conn =
            new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);

        conn.Open();

        SqlCommand cmd = new SqlCommand(updateLogin, conn);
        cmd.Parameters.AddWithValue("@false", false);
        cmd.Parameters.AddWithValue("@username", ((string) Session["User"]));
        cmd.ExecuteNonQuery();

        conn.Close();

        Session.Abandon();
    }
       
</script>
