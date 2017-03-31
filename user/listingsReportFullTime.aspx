<%@ Page Title="Listing Report FullTime or Internship" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="listingsReportFullTime.aspx.cs" Inherits="user_listingsReportFullTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>Filter Job Listings by Full Time or Internship</h1>
    <br />

    <asp:RadioButtonList ID="_radioIntern" runat="server" AutoPostBack="True">
        <asp:ListItem Value="1">Full Time</asp:ListItem>
        <asp:ListItem Value="0">Internship</asp:ListItem>
    </asp:RadioButtonList>

    <br /> 
    <asp:GridView ID="_listingGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="listingID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="listingID" HeaderText="Listing ID" InsertVisible="False" ReadOnly="True" SortExpression="listingID" Visible="False" />
            <asp:BoundField DataField="companyName" HeaderText="Company Name" SortExpression="companyName" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" />
            <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingReportIntern" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="_radioIntern" Name="option" PropertyName="SelectedValue" DbType="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /> <br />

    <asp:DataList ID="_listingDataReport" runat="server" CellPadding="5" CellSpacing="2" DataKeyField="listingID" DataSourceID="SqlDataSource2" GridLines="Both">
        <HeaderStyle Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Larger" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
        <ItemTemplate>
            Company Name:
            <asp:Label ID="companyNameLabel" runat="server" Text='<%# Eval("companyName") %>' />
            <br />
            Listing ID:
            <asp:Label ID="listingIDLabel" runat="server" Text='<%# Eval("listingID") %>' />
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
            JobRequirements:
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
        
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingReport" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="_listingGrid" Name="listingID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    </asp:Content>

