using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Default : System.Web.UI.Page
{
    PersonInfo person = new PersonInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        //block users who are not admins
        //retrieve the session variable set on the login page
        //yes you could have used the cookie also, demonstrating additional features
        person = (PersonInfo)Session["person"];
        if (person.RoleID != 1)
        {
            Response.Redirect("~/user/menu.aspx");
        }
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        this._message.Text = "Major Description was updated";
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "Major Description was deleted";
    }
    protected void _submit_Click(object sender, EventArgs e)
    {
         // first check the page passed the error checking

// first check the page passed the error checking
 if (Page.IsValid)
 {
 // this will insert a new record into the database
 //build a link the the name/pwd/user for your particular database
 //note below the [mis413...] should be the name of your connection string, open your webconfig file and find the connection string name
 string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S16ListDERConnectionString"].
ConnectionString;
 //build a connection to the database
 SqlConnection conn = new SqlConnection(dbConn);
 //use the above connection to execute a particular stored procedure [substitue your validTableInsert stored procedure name below]
 using (SqlCommand cmd = new SqlCommand("[validMajorsInsert]",
conn))
 {
 cmd.CommandType = CommandType.StoredProcedure;
 //build the parameters (input items) that the stored procedures needs
 cmd.Parameters.AddWithValue("@majorDescription", this._major.Text);
 // add more parameters as needed by your stored procedure
 // open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record
 try
{
 conn.Open();
 int intResponse = Convert.ToInt16(cmd.ExecuteScalar());
 if (intResponse == 0)
{
 this._message.Text = "Major already existed - Not Added";
 }
else
{
this._message.Text = "New Major was Added";
 } // following line refreshes your grid for the new record
 this._gridMajors.DataBind();
 }
 //if there are any errors with the store procedure, display them in the message label
 catch (SqlException ex)
 {
 this._message.Text = "Error on inserting into the Valid Majors Table " + ex.Message;
 }
 {
 this._pnlAdd.Visible = false;
 this._gridMajors.Visible = true;
 this._addStart.Visible = true;
 }
 }
 }
 }

    protected void _addStart_Click(object sender, EventArgs e)
    {
        this._pnlAdd.Visible = true;
        this._gridMajors.Visible = false;
        this._major.Text = "";
        this._message.Text = "";
        this._addStart.Visible = false;
      
    }

    protected void _cancel_Click(object sender, EventArgs e)
    {
        this._pnlAdd.Visible = false;
        this._gridMajors.Visible = true;
        this._addStart.Visible = true;
        this._message.Text = "";

    }
    protected void _gridMajors_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

