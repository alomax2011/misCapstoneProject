using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_listingMajors : System.Web.UI.Page
{
    bool isSelected = false;
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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Select":
                // Response.Write("Selected");
                isSelected = true;
                break;
            case "Edit":
                // Response.Write("Edit");
                break;
            case "Delete":
                // Response.Write("Delete");
                break;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int primaryKey = Convert.ToInt16(GridView1.SelectedDataKey.Value);
        Session["listingID"] = primaryKey;
        // Response.Write(GridView1.SelectedValue.ToString());
        //make panel visible
        this._pnlAdd.Visible = true;
        this._majorsUpdate.Visible = true;
        this._cancel.Visible = true;
        getMajorsOneJob(primaryKey);
        this._message.Text = "";
    }

    protected void getMajorsOneJob(int iPK)
    {

        this._validMajors.DataBind();
        // open your webconfig file and find the connection string name
        string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S16ListDERConnectionString"].ConnectionString;
        //build a connection to the database
        SqlConnection conn = new SqlConnection(dbConn);
        //use the above connection to execute a particular stored procedure [substitue your personInsert stored procedure name]
        using (SqlCommand cmd = new SqlCommand("[listingMajorsOneListing]", conn))
        {
            
            cmd.CommandType = CommandType.StoredProcedure;
            //build the parameters (input items) that the stored procedures needs
            //initially build the 2 parameters needed with fake data that represents the data type, i.e. if string would put, a instead of, 0
            cmd.Parameters.AddWithValue("@listingID", iPK);

            //now begin to loop through the grid,
            try
            {
                conn.Open();
                SqlDataReader dtrReader = cmd.ExecuteReader();
                
;                if (dtrReader.HasRows)
                {
                    
                    dtrReader.Read();
                    do
                    {

                        
                        foreach (ListItem item in this._validMajors.Items)
                        {
                            if (item.Value == Convert.ToString(dtrReader["majorID"]))
                            {
                                item.Selected = true;
                                break;
                            }
                        }
                    } while (dtrReader.Read());

                }
            }
            catch (SqlException ex)
            {
                this._message.Text = "Error on updating majors " + ex.Message;
            }
        }

    }

    protected void _majorsUpdate_Click(object sender, EventArgs e)
    {
        //loop thru checkbox list -- and update db wither checked or unchecked

        // open your webconfig file and find the connection string name
        string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S16ListDERConnectionString"].ConnectionString;
        //build a connection to the database
        SqlConnection conn = new SqlConnection(dbConn);
        //use the above connection to execute a particular stored procedure [substitue your personInsert stored procedure name]
        using (SqlCommand cmd = new SqlCommand("[listingMajorsModify]", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            //build the parameters (input items) that the stored procedures requires
            //note below that iPK is the personID of the person who has signed into the
            //system, you can retrieve this from the cookie set on the login page
            //look back on your menu page to see how to retrieve data from the cookie
            cmd.Parameters.AddWithValue("@listingID", Session["listingID"]);
            // add more parameters as needed by your stored procedure
            cmd.Parameters.AddWithValue("@majorID", 1);
            cmd.Parameters.AddWithValue("@majorSelected", 1);

            try
            {
                conn.Open();
                foreach (ListItem item in this._validMajors.Items)
                {

                    // gets the PK for the Major ID selected
                    cmd.Parameters["@majorID"].Value = item.Value;
                    cmd.Parameters["@majorSelected"].Value = item.Selected;

                    cmd.ExecuteNonQuery();

                }

                this._message.Text = "Majors were updated";
            }
            //if there are any errors with the store procedure, display them in the
            catch (SqlException ex)
            {
                this._message.Text = "Error on Inserting New Majors " + ex.Message;
            }
        }
        this._pnlAdd.Visible = false;
        this.GridView1.Visible = true;
        this._cancel.Visible = false;
        this._majorsUpdate.Visible = false;


    }

    protected void _cancel_Click(object sender, EventArgs e)
    {
        this._pnlAdd.Visible = false;
        this.GridView1.Visible = true;
        this._majorsUpdate.Visible = false;
        this._cancel.Visible = false;
    }
}