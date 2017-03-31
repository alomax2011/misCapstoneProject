using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void _clear_Click(object sender, EventArgs e)
    {
        this._firstname.Text = "";
        this._lastName.Text = "";
        this._email.Text = "";
        this._role.SelectedIndex = 0;
        this._returnResults.Text = "";
    }

    protected void _submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            this._returnResults.Text = "Thank you " + 
            this._firstname.Text + " " + 
            this._lastName.Text + "<br/>We are showing your email as: " + 
            this._email.Text + "<br /> Your role is: " + this._role.SelectedItem.Text;
        }
    }
}