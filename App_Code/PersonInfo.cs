using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PersonInfo
/// </summary>
public class PersonInfo
{
    public int PersonID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public int RoleID { get; set; }

	    public PersonInfo()
	    {
		    //
		    // TODO: Add constructor logic here
		    //
	    }
}