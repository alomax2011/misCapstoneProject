<%@ Page Title="Listing Majors" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="listingMajors.aspx.cs" Inherits="admin_listingMajors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        <asp:Label ID="Label6" runat="server" Text="Listing Majors"></asp:Label>
    </h1>

    <p class="center">
        <asp:Label ID="_message" runat="server" Text="" CssClass="failurenotification"></asp:Label>
    </p>
    <br />
    <asp:Panel ID="_pnlAdd" runat="server" Visible="False">
    <asp:CheckBoxList ID="_validMajors" runat="server" DataSourceID="SqlDataMajorsAll" DataTextField="majorDescription" DataValueField="majorID" RepeatColumns="3"></asp:CheckBoxList>

    <asp:SqlDataSource ID="SqlDataMajorsAll" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="validMajorsSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </asp:Panel>
    <p class="center">
    <asp:Button ID="_majorsUpdate" runat="server" Text="Update Majors" OnClick="_majorsUpdate_Click" Visible="False" />&nbsp;&nbsp;&nbsp;<asp:Button ID="_cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="_cancel_Click" Visible="False" />
    </p>
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataListingMajors" ForeColor="#333333" GridLines="None" DataKeyNames="listingID" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="404px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="companyName" HeaderText="Company Name" SortExpression="companyName" />
            <asp:BoundField DataField="listingID" HeaderText="listingID" InsertVisible="False" ReadOnly="True" SortExpression="listingID" Visible="False" />
            <asp:BoundField DataField="applicationDeadline" HeaderText="applicationDeadline" SortExpression="applicationDeadline" Visible="False" />
            <asp:BoundField DataField="applicationInstructions" HeaderText="applicationInstructions" SortExpression="applicationInstructions" Visible="False" />
            <asp:BoundField DataField="jobDuties" HeaderText="jobDuties" SortExpression="jobDuties" Visible="False" />
            <asp:BoundField DataField="JobRequirements" HeaderText="JobRequirements" SortExpression="JobRequirements" Visible="False" />
            <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" />
            <asp:CheckBoxField DataField="internship" HeaderText="internship" SortExpression="internship" Visible="False" />
            <asp:CheckBoxField DataField="fullTime" HeaderText="fullTime" SortExpression="fullTime" Visible="False" />
            <asp:BoundField DataField="favid" HeaderText="favid" SortExpression="favid" Visible="False" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataListingMajors" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

