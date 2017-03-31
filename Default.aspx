<%@ Page Title="Project Overview" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/UNCW.jpg" AlternateText="UNCW Logo" />
        <h2>MIS ListServ</h2>
        <p class="lead">The purpose of the MIS ListServ project is to make the ListServ easier to register for, view, sort, and use.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Key Deliverables</h2>
            <ul>
                <li>Provide a way for administrators to easily manage listserv users (i.e. add other administrators or students, and delete users).</li>
                <li>Provide a method for administrators to create and update postings. Also, allow administrators to upload listing files to the archive.</li>
                <li>Allow students to easily register their information for the listserv (i.e. Name, email, password, expected year of graduation, and intended major) and also allow students to register through their “my CSB portal.”</li>
                <li>Provide a method for users to easily view and sort the listserv.</li>
                <li>Provide students with a method for saving listings they like to a “favorites” list.</li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Key Users</h2>
            <ul>
                <li>Dr. Thomas Janicki</li>
                <li>UNCW MIS Students</li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Team Members</h2>
            <ul>
                <li>Drew Lomax</li>
                <li>Ed Lytle</li>
            </ul>
        </div>
    </div>
</asp:Content>
