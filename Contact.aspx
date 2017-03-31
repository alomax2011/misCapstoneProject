<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Drew Lomax's contact information.</h3>
    <address>
        453 Racine Drive Apt. 308<br />
        Wilmington, NC 28403<br />
        <abbr title="Phone">P:</abbr>
        910.991.5917
    </address>

    <address>
        <strong>Email:</strong>   <a href="mailto:ajl8317@uncw.edu">ajl8317@uncw.edu</a>
    </address>
    <br />
    <br />
    <h3>Ed's contact information</h3>
    <address>
        <abbr title="Phone">P:</abbr>
        919.260.4690
    </address>

    <address>
        <strong>Email:</strong>   <a href="mailto:ewl7528@uncw.edu">ewl7528@uncw.edu</a>
    </address>
</asp:Content>
