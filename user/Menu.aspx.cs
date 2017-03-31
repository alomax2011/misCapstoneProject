using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this._cookieRetrieveInfo.Text = "Your Person ID is: " +
            Convert.ToString(RetrieveID()) + " and your Role ID is: " +
            Convert.ToString(RetrieveRole());
        //based on the role, permit the user to see the appropriate menu, note
        //51, 99 are my role numbers, use those in your database
        switch (RetrieveRole())
        {
            case 1: //admin
                this._pnlAdminMenu.Visible = true;
                this._pnlStudentMenu.Visible = true;
                break;
            default:// this would be the typical user
                this._pnlStudentMenu.Visible = true;
                break;
        }
    }
    protected void _profile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/Profile.aspx");
    }
    protected void _lstContactsAddModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/lstContacts.aspx");
    }
    protected void _companyAddModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/company.aspx");
    }
    protected int RetrieveID()
	{
		// this checks to see if a cookie exists and returns the PersonID
		int iTempID = 0;
		if (Request.Cookies["userInfo"] != null)  //note the != represents Not Equal To
		{
            iTempID = Convert.ToInt32(Server.HtmlEncode(Request.Cookies["userInfo"]["personID"]));
		} 
		return iTempID;
	}
    protected int RetrieveRole()
    {
        int iTempID = 0;
        if (Request.Cookies["userInfo"] != null)
        {
            iTempID = Convert.ToInt32(Server.HtmlEncode(Request.Cookies["userInfo"]["roleID"]));
        }
        return iTempID;
    }
    protected void _listingMajorsAddModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/listingMajors.aspx");
    }
    protected void _listingLocation_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/listingsLocationView.aspx");
    }
    protected void _manageFavorites_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/favorites.aspx");
    }
    protected void _listing_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/listing.aspx");
    }
    protected void _majors_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/majors.aspx");
    }
    protected void _listByMajor_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/listingsReportMajors.aspx");
    }
    protected void _listingByJobType_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/listingsReportFullTime.aspx");
    }
}