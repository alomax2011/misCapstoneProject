<%@ Page Title="Listings" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="listing.aspx.cs" Inherits="admin_listing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
 <asp:Label ID="Label9" runat="server" Text="Job Listings"></asp:Label>
    </h1>
    <p class="center">
        <asp:Label ID="_message" runat="server" Text=""
           CssClass="failurenotification"></asp:Label> </p>
    <p class="center">
    <asp:Button ID="_addListing" runat="server" Text="Add New Job Listing" OnClick="_addListing_Click" /></p>
    <asp:Panel ID="_pnlAddListing" runat="server">  <table class="tableCenter">
    <tr>
        <td class ="tdr">
            <asp:Label ID="Label2" runat="server" Text="Company Name"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        <td>
            <asp:DropDownList ID="_companyDropDown" runat="server" DataSourceID="SqlDataSource4" DataTextField="companyName" DataValueField="companyID" AppendDataBoundItems="True">
                <asp:ListItem Value="0">-Please Select-</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="SELECT [companyID], [companyName] FROM [company]"></asp:SqlDataSource>
        </td>
        <td style="width: 151px">
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="_companyDropDown"
                ErrorMessage="*Please Select a Company"
                CssClass="failurenotification">
            </asp:RequiredFieldValidator></td>
     </tr>

    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Job Title"></asp:Label></td>
        <td>
            <asp:DropDownList ID="_jobTitleDrop" runat="server" DataSourceID="SqlDataSource2" DataTextField="jobTitle" DataValueField="jobTitle" OnSelectedIndexChanged="_jobTitleDrop_SelectedIndexChanged" AppendDataBoundItems="True">
                <asp:ListItem Value="0">-Please Select-</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="SELECT [jobTitle] FROM [listing]"></asp:SqlDataSource>
        </td>
        <td style="width: 151px">
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="_jobTitleDrop"
                ErrorMessage="*Please Select a Drop Down"
                CssClass="failurenotification">
            </asp:RequiredFieldValidator></td>
     </tr>
    <tr>
        <td><asp:Label ID="JobDuties" runat="server" Text="Job Duties"></asp:Label></td>
        <td>
            <asp:TextBox ID="_jobDuties" runat="server" TextMode="MultiLine" Height="80px" Width="415px"></asp:TextBox></td>
        <td>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Enter Valid Job Duties" Font-Bold="True" Display="Dynamic" CssClass="failurenotification" ControlToValidate="_jobDuties"></asp:RequiredFieldValidator></td>
    </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Job Requirements"></asp:Label></td>
          <td>  <asp:TextBox ID="_jobRequirements" runat="server" TextMode="MultiLine" Height="80px" Width="415px"></asp:TextBox>
          <td>  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Enter Valid Job Requirements" Font-Bold="True" Display="Dynamic" CssClass="failurenotification" ControlToValidate="_jobRequirements"></asp:RequiredFieldValidator></td>
        </tr>
    <tr>
        <td style="height: 24px">
            <asp:Label ID="application" runat="server" Text="Application Instructions"></asp:Label></td>
        <td style="height: 24px">
            <asp:TextBox ID="_applicationInstructions" runat="server" CausesValidation="False" Width="415px" TextMode="MultiLine" Height="80px"></asp:TextBox></td>
        <td style="height: 24px; width: 151px;">
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="_applicationInstructions"
                ErrorMessage="*Application Instructions Required"
                CssClass="failurenotification" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        
     </tr>
       
        <tr>
        <td style="height: 24px">
            <asp:Label ID="location" runat="server" Text="Job Location"></asp:Label></td>
        <td style="height: 24px">
            <asp:TextBox ID="_location" runat="server" CausesValidation="False" Width="258px" TextMode="MultiLine"></asp:TextBox></td>
        <td style="height: 24px; width: 151px;">
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="_location"
                ErrorMessage="*Please Provide a Location"
                CssClass="failurenotification" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        
     </tr>
        <tr>
        <td style="height: 24px">
            <asp:Label ID="Label6" runat="server" Text="Application Deadline"></asp:Label></td>
        <td style="height: 24px">
            <asp:TextBox ID="_applicationDeadline" runat="server" CausesValidation="False" Width="258px" TextMode="Date"></asp:TextBox></td>
        <td style="height: 24px; width: 151px;">
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="_applicationDeadline"
                ErrorMessage="*Please enter an application deadline"
                CssClass="failurenotification" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        
     </tr>
    <tr>
        <td><asp:Label ID="Label4" runat="server" Text="Full Time"></asp:Label></td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="_fullTime" runat="server" />
        </td>
            
        <td style="width: 151px">
            &nbsp;</td>
 
     </tr>
        <tr>
        <td><asp:Label ID="Label1" runat="server" Text="Internship"></asp:Label></td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="_internship" runat="server" />
        </td>
            
        <td style="width: 151px">
            &nbsp;</td>
 
     </tr>
    
        <tr><td colspan="2" class="center"><br/>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
            <asp:Button ID="_submit" runat="server" Text="Submit " OnClick="_submit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
             &nbsp; &nbsp; &nbsp; 
            <asp:Button ID="_cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="_clear_Click" /></td></tr>

    </table>
        </asp:Panel>

    <asp:Panel ID="_pnlListingGrid" runat="server">
    <asp:GridView ID="_listingGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="listingID" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCancelingEdit="_listingGrid_RowCancelingEdit" OnRowDeleted="_listingGrid_RowDeleted" OnRowUpdated="_listingGrid_RowUpdated">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Company Name" SortExpression="companyName">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("companyName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("companyName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="listingID" InsertVisible="False" SortExpression="listingID" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("listingID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("listingID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Title" SortExpression="jobTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("jobTitle") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please enter a job title" Display="Dynamic" CssClass="failurenotification" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("jobTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location" SortExpression="location">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("location") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox2" CssClass="failurenotification" Display="Dynamic" ErrorMessage="Please enter a job location"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Duties" SortExpression="jobDuties">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("jobDuties") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox3" CssClass="failurenotification" Display="Dynamic" ErrorMessage="Please enter job duties"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("jobDuties") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Requirements" SortExpression="JobRequirements">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("JobRequirements") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox4" CssClass="failurenotification" Display="Dynamic" ErrorMessage="Please enter job requirements"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("JobRequirements") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Application Instructions" SortExpression="applicationInstructions">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("applicationInstructions") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox5" CssClass="failurenotification" Display="Dynamic" ErrorMessage="Please enter application instructions"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("applicationInstructions") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Application Deadline" SortExpression="applicationDeadline">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("applicationDeadline") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox6" CssClass="failurenotification" Display="Dynamic" ErrorMessage="Please enter an application deadline"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("applicationDeadline") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Internship" SortExpression="internship">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("internship") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("internship") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Full Time" SortExpression="fullTime">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("fullTime") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("fullTime") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this listing?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" 
        DeleteCommand="listingDelete" DeleteCommandType="StoredProcedure"  SelectCommand="listingSelectAll" 
        SelectCommandType="StoredProcedure" UpdateCommand="listingUpdate" UpdateCommandType="StoredProcedure" InsertCommand="listingInsert" InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="listingID" Type="Int32" />
        </DeleteParameters>
     
        <InsertParameters>
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="jobDuties" Type="String" />
            <asp:Parameter Name="jobRequirements" Type="String" />
            <asp:Parameter Name="applicationInstructions" Type="String" />
            <asp:Parameter Name="internship" Type="Boolean" />
            <asp:Parameter Name="fullTime" Type="Boolean" />
            <asp:Parameter Name="companyID" Type="Int32" />
            <asp:Parameter Name="jobTitle" Type="String" />
            <asp:Parameter Name="applicationDeadline" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="listingID" Type="Int32" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="jobDuties" Type="String" />
            <asp:Parameter Name="jobRequirements" Type="String" />
            <asp:Parameter Name="applicationInstructions" Type="String" />
            <asp:Parameter Name="internship" Type="Boolean" />
            <asp:Parameter Name="fullTime" Type="Boolean" />
            <asp:Parameter Name="jobTitle" Type="String" />
            <asp:Parameter Name="applicationDeadline" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </asp:Panel>
</asp:Content>

