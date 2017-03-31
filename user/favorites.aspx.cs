using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_favorites : System.Web.UI.Page
{
    PersonInfo person = new PersonInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    

    public bool getFavorite(object valueIn)
    {

       
        if (Convert.ToString(valueIn) == "")
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    protected void _updateFav_Click(object sender, EventArgs e)
    {
        //write looping code
        //personid comes from the cookie


        //  cmd.paramaters.addwithvalue("@personID", Person.personID);
       
        
        //build a link the the name/pwd/user for your particular database
        //note below the [mis413...] should be the name of your connection string,
       // open your webconfig file and find the connection string name
        string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S16ListDERConnectionString"].ConnectionString;
        //build a connection to the database
        SqlConnection conn = new SqlConnection(dbConn);
        //use the above connection to execute a particular stored procedure [substitue your personInsert stored procedure name]
        using (SqlCommand cmd = new SqlCommand("[favoritesModify]", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            //build the parameters (input items) that the stored procedures needs
            //initially build the 2 parameters needed with fake data that represents the data type, i.e. if string would put, a instead of, 0
            cmd.Parameters.AddWithValue("@personID", person.PersonID);
            cmd.Parameters.AddWithValue("@listingID", 1);
            cmd.Parameters.AddWithValue("@favid", 0);

            //now begin to loop through the grid,
            try
            {
                int pk = 0;
                int thisRowIndex = 0;
                conn.Open();
                // the following will loop one row at a time, find the value of the favorites checkbox and update the database table
                 CheckBox chk = default(CheckBox);
                foreach (GridViewRow oneRow in this.GridView1.Rows)
                {
                    chk = oneRow.FindControl("_favorites") as CheckBox;
                    thisRowIndex = oneRow.RowIndex;
                    pk = Convert.ToInt32(GridView1.DataKeys[thisRowIndex].Values[0]);
                    //put this line to test if you are looping through the grid
                    //Response.Write(pk + " " + chk.Checked + "<br/>");
                    //remark out the above line and bring in the following line once
                    //you know the loop is working (unremark them)
                    cmd.Parameters["@listingID"].Value = pk;
                    cmd.Parameters["@favid"].Value = chk.Checked;
                    cmd.ExecuteNonQuery();
                 }
                this._message.Text = "Favorites were updated";
            }
            catch (SqlException ex)
            {
                this._message.Text = "Error on updating favorites " + ex.Message;
            }
        }


    }
}