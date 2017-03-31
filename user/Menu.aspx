<%@ Page Title="Menu" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
 <asp:Label ID="Label1" runat="server" Text="ListServ Menu Items"></asp:Label>
 </h1>
<br/><br/>

<asp:Panel ID="_pnlAdminMenu" runat="server" Visible="False">
 <h4>
    <asp:Label ID="Label3" runat="server" Text="Administrative Actions"></asp:Label>
 </h4>
 <ul>
 <li>
 <asp:Label ID="Label4" runat="server" Text="Login Screen"></asp:Label>&nbsp;- CP 6 - Both </li>
     <li>
         Roles - Add/Modify - CP&nbsp; - Neither</li>
     <li>
         <asp:LinkButton ID="_listing" runat="server" OnClick="_listing_Click">Add/Modify Listing</asp:LinkButton>
         &nbsp;-&nbsp; CP 8 - Ed</li>
     <li>
         <asp:LinkButton ID="_lstContactsAddModify" runat="server" OnClick="_lstContactsAddModify_Click">Add/Modify Listing Contact</asp:LinkButton>
         &nbsp;-&nbsp; Completed for CP7 by Andrew</li>
     <li>
         <asp:LinkButton ID="_profile" runat="server" OnClick="_profile_Click">Add/Modify Profile</asp:LinkButton>
         &nbsp;-&nbsp; CP 7&nbsp;- Ed</li>
     <li>
         <asp:LinkButton ID="_majors" runat="server" OnClick="_majors_Click">Add/Modify Majors</asp:LinkButton>
         &nbsp;-&nbsp; CP 5 - Ed</li>
     <li>
         <asp:LinkButton ID="_companyAddModify" runat="server" OnClick="_companyAddModify_Click">Add/Modify Company</asp:LinkButton>
         &nbsp;-&nbsp; CP 5 - Andrew</li>
     <li>
         <asp:LinkButton ID="_listingMajorsAddModify" runat="server" OnClick="_listingMajorsAddModify_Click">Add/Modify Listing Majors</asp:LinkButton>
         &nbsp;-&nbsp; CP 9 - Andrew</li>
 </ul>
 </asp:Panel>

<asp:Panel ID="_pnlStudentMenu" runat="server" Visible="False">
<h4>
 <asp:Label ID="Label6" runat="server" Text="Student Actions"></asp:Label></h4>
 <ul>
 <li>
 <asp:Label ID="Label7" runat="server" Text="Login Screen"></asp:Label></li>
     <li>
 <asp:Label ID="Label12" runat="server" Text="View Profile"></asp:Label></li>
     <li>
 <asp:Label ID="Label13" runat="server" Text="Edit Profile Information"></asp:Label></li>
     <li>
         <asp:LinkButton ID="_listByMajor" runat="server" OnClick="_listByMajor_Click">View Listings by Major</asp:LinkButton>
         &nbsp;-&nbsp; CP 9 - Ed
     </li>
     <li>
         <asp:LinkButton ID="_listingByJobType" runat="server" OnClick="_listingByJobType_Click">View Listings by Internship/Full Time</asp:LinkButton>
         &nbsp;-&nbsp; CP 9 - Ed
     </li>
     <li>
         <asp:LinkButton ID="_listingLocation" runat="server" OnClick="_listingLocation_Click">View Listings by Location</asp:LinkButton>
         &nbsp;-&nbsp; CP 9 - Andrew</li>
     <li>
 <asp:Label ID="Label17" runat="server" Text="Sort Listings by Keywords - Future Enhancement"></asp:Label></li>
 
     <li>
         <asp:LinkButton ID="_manageFavorites" runat="server" OnClick="_manageFavorites_Click">Add/Modify Favorites</asp:LinkButton>
         &nbsp;-&nbsp; CP 8 & 9 - Andrew</li>
 </ul>
</asp:Panel>
    <asp:Label ID="_cookieRetrieveInfo" runat="server"></asp:Label>
</asp:Content>

