<%@ Page Title="Listings Based on Location" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="listingsLocationView.aspx.cs" Inherits="user_listingsLocationView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        <asp:Label ID="Label1" runat="server" Text="Listings Based on Location"></asp:Label>
    </h1>

    <p class="center">
        <asp:Label ID="_message" runat="server" Text="" CssClass="failurenotification"></asp:Label>
    </p>
    <table class="tableCenter">
        <tr>
            <td class="tdr">
                <asp:Label ID="Label2" runat="server" Text="Listing Location"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="_location" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="0">-Please Select-</asp:ListItem>
                    <asp:ListItem Text="In State" Value="NC"></asp:ListItem>
                    <asp:ListItem Text="Out of State" Value="aa"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                 ID="RequiredFieldValidator1" runat="server" 
                 ErrorMessage="*Please Select A Location" 
                 CssClass="failurenotification" 
                 ControlToValidate="_location" 
                 InitialValue="0"></asp:RequiredFieldValidator>
            </td>
    </table>
    <br/ >
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="listingID" DataSourceID="SqlDataLocationListings" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="listingID" HeaderText="listingID" InsertVisible="False" ReadOnly="True" SortExpression="listingID" Visible="False" />
            <asp:BoundField DataField="applicationDeadline" HeaderText="applicationDeadline" SortExpression="applicationDeadline" Visible="False" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" ReadOnly="True" SortExpression="jobTitle" />
            <asp:BoundField DataField="location" HeaderText="Location" ReadOnly="True" SortExpression="location" />
            <asp:BoundField DataField="jobDuties" HeaderText="jobDuties" SortExpression="jobDuties" Visible="False" />
            <asp:BoundField DataField="JobRequirements" HeaderText="JobRequirements" SortExpression="JobRequirements" Visible="False" />
            <asp:BoundField DataField="applicationInstructions" HeaderText="applicationInstructions" SortExpression="applicationInstructions" Visible="False" />
            <asp:CheckBoxField DataField="internship" HeaderText="internship" SortExpression="internship" Visible="False" />
            <asp:CheckBoxField DataField="fullTime" HeaderText="fullTime" SortExpression="fullTime" Visible="False" />
            <asp:BoundField DataField="state" HeaderText="State" ReadOnly="True" SortExpression="state" />
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
    
    <br />
    <br />
    <br />

    <asp:DataList ID="_dataOneListing" runat="server" CellPadding="4" DataKeyField="listingID" DataSourceID="SqlDataSelectOneGridListing" HorizontalAlign="Center" ForeColor="#333333">
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
    <br />
    <br />
    <br />
    <asp:DataList ID="_dataOneListingMajors" runat="server" DataSourceID="SqlDataOneGridListingMajors" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            Selected Listing&#39;s Majors
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            <asp:Label ID="majorDescriptionLabel" runat="server" Text='<%# Eval("majorDescription") %>' />
            <br />
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataOneGridListingMajors" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingMajorsOneListing" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="listingID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSelectOneGridListing" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="internshipsSelectOne" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="listingID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSelectOne" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="internshipsSelectOne" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="listingID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <br />

    <asp:DataList ID="_selectOneListingMajors" runat="server" CellPadding="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" HorizontalAlign="Center">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#E3EAEB" />
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSelectOneListingsMajors" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="listingMajorsOneListing" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="listingID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataLocationListings" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="internshipsByLocation" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="_location" DefaultValue="0" Name="stateDesired" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

