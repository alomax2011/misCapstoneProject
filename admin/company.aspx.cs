using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_company : System.Web.UI.Page
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
        this._message.Text = "Company was updated";
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        this._message.Text = "Company edit was cancelled";
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "Company was deleted";
    }
    protected void _submit_Click(object sender, EventArgs e)
    {
        // first check the page passed the error checking
            if (Page.IsValid)
            {
                // this will insert a new record into the database

                //build a link the the name/pwd/user for your particular database

                //note below the [mis413...] should be the name of your connection string, open your webconfig file and find the connection string name
                string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S16ListDERConnectionString"].ConnectionString;

                //build a connection to the database
                SqlConnection conn = new SqlConnection(dbConn);

                //use the above connection to execute a particular stored procedure [substitue your validTableInsert stored procedure name below]
                using (SqlCommand cmd = new SqlCommand("[companyInsert]", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
        
                    //build the parameters (input items) that the stored procedures needs
        
                    cmd.Parameters.AddWithValue("@companyName", this._companyName1.Text);
                    cmd.Parameters.AddWithValue("@street", this._street1.Text);
                    cmd.Parameters.AddWithValue("@city", this._city1.Text);
                    cmd.Parameters.AddWithValue("@state", this._state1.Text);
                    cmd.Parameters.AddWithValue("@zip", this._zip1.Text);
 
                    // add more parameters as needed by your stored procedure
        
                    // open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record
        
                    try
                    {
                        conn.Open();
                        int intResponse = Convert.ToInt16(cmd.ExecuteScalar());
                        if (intResponse == 0)
                        {
                            this._message.Text = "Company already existed - Not Added";
                        }
                        else
                        {
                            this._message.Text = "New company was Added";
                        } 
                        // following line refreshes your grid for the new record
                        this.GridView1.DataBind();
                    }
                    //if there are any errors with the store procedure, display them in the message label
                    catch (SqlException ex)
                    {
                        this._message.Text = "Error on inserting into the Company Table " + ex.Message;
                    }
                }
            }
            this._pnlAdd.Visible = false;
            this.GridView1.Visible = true;
            this._addStart.Visible = true;
            
    }
    protected void _addStart_Click(object sender, EventArgs e)
    {
        // toggle panel
        this._pnlAdd.Visible = true;
        this._addStart.Visible = false;
        this.GridView1.Visible = false;
        
        //clear textboxes
        this._companyName1.Text = "";
        this._street1.Text = "";
        this._city1.Text = "";
        this._state1.Text = "";
        this._zip1.Text = "";
    }
    protected void _cancel_Click(object sender, EventArgs e)
    {
        this.GridView1.Visible = true;
        this._addStart.Visible = true;
        this._pnlAdd.Visible = false;
    }
}