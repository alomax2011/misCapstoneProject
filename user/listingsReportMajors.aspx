<%@ Page Title="Listing Report Majors" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="listingsReportMajors.aspx.cs" Inherits="user_listingsReportMajors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>Filter Job Listings by Major</h1>
    <br />
    <asp:RadioButtonList ID="_majorsRadioList" runat="server" DataSourceID="SqlDataSource1" DataTextField="majorDescription" DataValueField="majorID" AutoPostBack="True"></asp:RadioButtonList>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="validMajorsSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <br /> <br />
    <asp:GridView ID="_gridListings" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="listingID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="listingID" HeaderText="listingID" InsertVisible="False" ReadOnly="True" SortExpression="listingID" Visible="False" />
            <asp:BoundField DataField="companyName" HeaderText="Company Name" SortExpression="companyName" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" />
            <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingReportSelect" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="_majorsRadioList" Name="majorID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /> <br />
    <asp:DataList ID="_dataListings" runat="server" CellPadding="2" CellSpacing="5" DataKeyField="listingID" DataSourceID="SqlDataSource3" GridLines="Vertical">
        <ItemTemplate>
            Company Name:
            <asp:Label ID="companyNameLabel" runat="server" Text='<%# Eval("companyName") %>' />
            <br />
            listingID:
            <asp:Label ID="listingIDLabel" runat="server" Text='<%# Eval("listingID") %>'  />
            <br />
            Application Deadline:
            <asp:Label ID="applicationDeadlineLabel" runat="server" Text='<%# Eval("applicationDeadline") %>' />
            <br />
            Application Instructions:
            <asp:Label ID="applicationInstructionsLabel" runat="server" Text='<%# Eval("applicationInstructions") %>' />
            <br />
            Job Duties:
            <asp:Label ID="jobDutiesLabel" runat="server" Text='<%# Eval("jobDuties") %>' />
            <br />
            Job Requirements:
            <asp:Label ID="JobRequirementsLabel" runat="server" Text='<%# Eval("JobRequirements") %>' />
            <br />
            Location:
            <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
            <br />
            Job Title:
            <asp:Label ID="jobTitleLabel" runat="server" Text='<%# Eval("jobTitle") %>' />
            <br />
            Internship:
            <asp:Label ID="internshipLabel" runat="server" Text='<%# Eval("internship") %>' />
            <br />
            Full Time:
            <asp:Label ID="fullTimeLabel" runat="server" Text='<%# Eval("fullTime") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingReport" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="_gridListings" DefaultValue="0" Name="listingID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    </asp:Content>

