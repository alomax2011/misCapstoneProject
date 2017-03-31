<%@ Page Title="Favorites" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="favorites.aspx.cs" Inherits="admin_favorites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        <asp:Label ID="Label6" runat="server" Text="Favorites"></asp:Label>
    </h1>
    
    <p class="center">
        <asp:Label ID="_message" runat="server" Text="" CssClass="failurenotification"></asp:Label>
    </p>
    <h2>
        <asp:Label ID="_modifyFav" runat="server" Text="Modify Favorites"></asp:Label>
    </h2>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="listingID" DataSourceID="SqlDataFavorites" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="companyName" HeaderText="Company Name" SortExpression="companyName" ReadOnly="True" />
            <asp:BoundField DataField="listingID" HeaderText="listingID" InsertVisible="False" ReadOnly="True" SortExpression="listingID" Visible="False" />
            <asp:BoundField DataField="applicationDeadline" HeaderText="Application Deadline" SortExpression="applicationDeadline" ReadOnly="True" />
            <asp:BoundField DataField="applicationInstructions" HeaderText="Application Instructions" SortExpression="applicationInstructions" ReadOnly="True" />
            <asp:BoundField DataField="jobDuties" HeaderText="Job Duties" SortExpression="jobDuties" ReadOnly="True" />
            <asp:BoundField DataField="JobRequirements" HeaderText="Job Requirements" SortExpression="JobRequirements" ReadOnly="True" />
            <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" ReadOnly="True" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" ReadOnly="True" />
            <asp:CheckBoxField DataField="internship" HeaderText="Internship" SortExpression="internship" ReadOnly="True" />
            <asp:CheckBoxField DataField="fullTime" HeaderText="Full Time" SortExpression="fullTime" ReadOnly="True" />
            <asp:TemplateField HeaderText="Favorite">
                <ItemTemplate>
                    <asp:CheckBox ID="_favorites" runat="server" Checked='<%# getFavorite(Eval("favid")) %>' >
                       
                    </asp:CheckBox>
                   
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="SqlDataFavorites" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingSelectAll" SelectCommandType="StoredProcedure">
        
    </asp:SqlDataSource>
    <p class="center">
    <asp:Button ID="_updateFav" runat="server" Text="Update Favorities" OnClick="_updateFav_Click" /></p>
    <asp:DataList ID="_oneFavorite" runat="server" DataKeyField="listingID" DataSourceID="SqlDataSelectOneFavorite" CellPadding="4" ForeColor="#333333" HorizontalAlign="Center">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            Selected Listing
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            Application Deadline:
            <asp:Label ID="applicationDeadlineLabel" runat="server" Text='<%# Eval("applicationDeadline") %>' />
            <br />
            Job Title:
            <asp:Label ID="jobTitleLabel" runat="server" Text='<%# Eval("jobTitle") %>' />
            <br />
            Location:
            <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
            <br />
            Job Duties:
            <asp:Label ID="jobDutiesLabel" runat="server" Text='<%# Eval("jobDuties") %>' />
            <br />
            Job Requirements:
            <asp:Label ID="JobRequirementsLabel" runat="server" Text='<%# Eval("JobRequirements") %>' />
            <br />
            Application Instructions:
            <asp:Label ID="applicationInstructionsLabel" runat="server" Text='<%# Eval("applicationInstructions") %>' />
            <br />
            Internship:
            <asp:Label ID="internshipLabel" runat="server" Text='<%# Eval("internship") %>' />
            <br />
            Full Time:
            <asp:Label ID="fullTimeLabel" runat="server" Text='<%# Eval("fullTime") %>' />
            <br />
            State:
            <asp:Label ID="stateLabel" runat="server" Text='<%# Eval("state") %>' />
            <br />
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSelectOneFavorite" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="internshipsSelectOne" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="listingID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

