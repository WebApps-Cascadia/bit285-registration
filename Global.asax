<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data"%>
<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Was getting a javascript error during validation
        //ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        
        // From Assignment 1. Kept as reference
        //DataTable dt = new DataTable();
    
        //dt.Columns.Add(new DataColumn("session_id", System.Type.GetType("System.String")));
        //dt.Columns.Add(new DataColumn("userid", System.Type.GetType("System.String")));
        //dt.Columns.Add(new DataColumn("firstname", System.Type.GetType("System.String")));
        //dt.Columns.Add(new DataColumn("lastname", System.Type.GetType("System.String")));
        //dt.Columns.Add(new DataColumn("login_time", System.Type.GetType("System.DateTime")));
        //dt.Columns.Add(new DataColumn("ip_address", System.Type.GetType("System.String")));
    
        //// store the DataTable as an Application variable
        //Application["visitorTable"] = dt;
    }

    // browser's first visit to the page, (session starts)
    void Session_Start(Object s, EventArgs e)
    {
        // Store the user name as a session variable
        Session["currusername"] = "";
    }
    
    // session ends
    void Session_End(Object s, EventArgs e)
    {   
        Session.Abandon();
    }

    
    
</script>