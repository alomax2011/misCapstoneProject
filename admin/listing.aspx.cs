using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class admin_listing : System.Web.UI.Page
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
        this._pnlAddListing.Visible = false;
    }

    protected void fullTime_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void _jobTitleDrop_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void _submit_Click(object sender, EventArgs e)
    {
        this._pnlListingGrid.Visible = true;

        if (Page.IsValid)
        {

            // this will insert a new record into the database
            //build a link the the name/pwd/user for your particular database
            //note below the [mis413...] should be the name of your connection string, open your webconfig file and find the connection string name
            string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S16ListDERConnectionString"].ConnectionString;
            //build a connection to the database
            SqlConnection conn = new SqlConnection(dbConn);
            //use the above connection to execute a particular stored procedure [substitue your validTableInsert stored procedure name below]
            using (SqlCommand cmd = new SqlCommand("[listingInsert]",
           conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //build the parameters (input items) that the stored procedures needs
                cmd.Parameters.AddWithValue("@companyID", this._companyDropDown.Text);
                cmd.Parameters.AddWithValue("@jobTitle", this._jobTitleDrop.Text);
                cmd.Parameters.AddWithValue("@jobDuties", this._jobDuties.Text);
                cmd.Parameters.AddWithValue("@jobRequirements", this._jobRequirements.Text);
                cmd.Parameters.AddWithValue("@applicationInstructions", this._applicationInstructions.Text);
                cmd.Parameters.AddWithValue("@fullTime", this._fullTime.Checked);
                cmd.Parameters.AddWithValue("@internship", this._internship.Checked);
                cmd.Parameters.AddWithValue("@location", this._location.Text);
                cmd.Parameters.AddWithValue("@applicationDeadline", this._applicationDeadline.Text);


                // add more parameters as needed by your stored procedure
                // open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record

                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());
                    if (intResponse == 0)
                    {
                        this._message.Text = "Listing Added";
                    }
                    else
                    {
                        this._message.Text = "New Listing Added";
                    } // following line refreshes your grid for the new record
                    this._listingGrid.DataBind();
                }

                //if there are any errors with the store procedure, display them in the message label
                catch (SqlException ex)
                {
                    this._message.Text = "Error on inserting into the Listing Table " + ex.Message;
                }
            }
        }
    }
    protected void _clear_Click(object sender, EventArgs e)
    {
        this._jobDuties.Text = "";
        this._jobRequirements.Text = "";
        this._applicationInstructions.Text = "";
        this._location.Text = "";
        this._fullTime.Checked = false;
        this._internship.Checked = false;
        this._pnlAddListing.Visible = false;
        this._pnlListingGrid.Visible = true;

    }
    protected void _addListing_Click(object sender, EventArgs e)
    {
        this._jobDuties.Text = "";
        this._jobRequirements.Text = "";
        this._applicationInstructions.Text = "";
        this._location.Text = "";
        this._fullTime.Checked = false;
        this._internship.Checked = false;
        this._pnlListingGrid.Visible = false;
        this._pnlAddListing.Visible = true;
    }
    protected void _listingGrid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        this._message.Text = "This listing has been updated";
    }
    protected void _listingGrid_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "This listing has been deleted";
    }
    protected void _listingGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        this._message.Text = "This listing has NOT been updated";
    }
}