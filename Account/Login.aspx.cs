using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using ajlProject2;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
            // RegisterHyperLink.NavigateUrl = "Register";
            // OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                // RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //build a boolean to tell me all is ok
                Boolean isOK = false;

                //build a link the the name/pwd/user for your particular database

                //note below the [mis413...] should be the name of your connection string, open your webconfig file and find the connection string name
                string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S16ListDERConnectionString"].ConnectionString;

                //build a connection to the database
                SqlConnection conn = new SqlConnection(dbConn);

                //use the above connection to execute a particular stored procedure [substitue your validTableInsert stored procedure name below]
                using (SqlCommand cmd = new SqlCommand("[ajlLogin]", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    //build the parameters (input items) that the stored procedures needs

                    cmd.Parameters.AddWithValue("@email", this.Email.Text);
                    cmd.Parameters.AddWithValue("@pwd", this.Password.Text);

                    // add more parameters as needed by your stored procedure

                    // open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record

                    try
                    {
                        conn.Open();
                        SqlDataReader dtrReader = cmd.ExecuteReader();
                        // see if any data was returned from the stored procedure, if no data than not a valid user or password
                        if (dtrReader.HasRows)
                        {
                            //read the first record
                            dtrReader.Read();
                            HttpCookie aCookie = new HttpCookie("userInfo");
                            aCookie.Values["firstName"] = (string)dtrReader["firstName"];
                            aCookie.Values["lastName"] = (string)dtrReader["lastName"];
                            aCookie.Values["email"] = (string)dtrReader["email"];
                            aCookie.Values["personID"] = Convert.ToString (dtrReader["personID"]);
                            aCookie.Values["roleID"] = Convert.ToString (dtrReader["roleID"]);
                            aCookie.Expires = DateTime.Now.AddMinutes(20);
                            Response.Cookies.Add(aCookie);
                            isOK = true;
                            string userName = (string)(dtrReader["firstName"]) + " " + (string)(dtrReader["lastName"]);
                            FormsAuthentication.RedirectFromLoginPage(userName, true);
                            //demonstrate the use of a person class and session variables
                            // remember the dtrReader field names must be YOUR field names in your database
                            PersonInfo person = new PersonInfo();
                            person.PersonID = Convert.ToInt32(dtrReader["personID"]);
                            person.FirstName = (string)dtrReader["firstname"];
                            person.LastName = (string)dtrReader["lastname"];
                            person.Email = (string)dtrReader["email"];
                            person.RoleID = Convert.ToInt32(dtrReader["roleID"]);
                            // move the person class to a session variable to use on future pages
                            Session["person"] = person;

                        }
                        else
                        {
                            FailureText.Text = "Invalid username or password.";
                            ErrorMessage.Visible = true;
                        }
                    }
                    //if there are any errors with the store procedure, display them in the message label
                    catch (SqlException ex)
                    {
                        FailureText.Text = "Error on sign in procedure " + ex.Message;
                        ErrorMessage.Visible = true;
                    }
                }
                if (isOK)
                    {
                        Response.Redirect("~/user/Menu.aspx"); 
                    }
            }
            //if (IsValid)
            //{
                //Validate the user password
              //var manager = new UserManager();
              //ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                //if (user != null)
                //{
                    //IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                    //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                //}
                //else
                //{
                    //FailureText.Text = "Invalid username or password.";
                    //ErrorMessage.Visible = true;
                //}
            //}
        }
}