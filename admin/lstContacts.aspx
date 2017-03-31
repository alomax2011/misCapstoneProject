<%@ Page Title="Listing Contacts" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="lstContacts.aspx.cs" Inherits="admin_lstContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        <asp:Label ID="Label8" runat="server" Text="Listing Contact Information"></asp:Label>
    </h1>

    <p class="center">
        <asp:Label ID="_message" runat="server" Text="" CssClass="failurenotification"></asp:Label>
    </p>
    <p class="center">
        <asp:Button ID="_addStart" runat="server" Text="Add New Contact" OnClick="_addStart_Click" />
    </p>
    <asp:Panel ID="_pnlAdd" runat="server" Visible="False">
        <table class="tableCenter">
        <tr>
            <td class="tdr">
                <asp:Label ID="Label9" runat="server" Text="Person"></asp:Label></td>
            <td>
                <asp:DropDownList ID="_person1" runat="server" DataSourceID="SqlDataPerson" DataValueField="personID" AppendDataBoundItems="True" DataTextField="fullname">
                    <asp:ListItem Value="0">-Please Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataPerson" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="personSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="*Person Required" 
                    ControlToValidate="_person1" 
                    CssClass="failurenotification" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td class="tdr">
                <asp:Label ID="Label11" runat="server" Text="Job Title"></asp:Label></td>
            <td>
                <asp:TextBox ID="_jobTitle1" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator9" runat="server" 
                    ErrorMessage="*Job Title Required" 
                    ControlToValidate="_jobTitle1" 
                    CssClass="failurenotification"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdr">
                <asp:Label ID="Label12" runat="server" Text="Company Name"></asp:Label></td>
            <td>
                <asp:DropDownList ID="_company1" runat="server" DataSourceID="SqlDataCompany" DataTextField="companyName" DataValueField="CompanyID" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">-Please Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataCompany" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="companySelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="*Company Name Required" 
                    ControlToValidate="_company1" 
                    CssClass="failurenotification" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdr">
                <asp:Label ID="Label13" runat="server" Text="Phone"></asp:Label></td>
            <td>
                <asp:TextBox ID="_phone1" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator11" runat="server" 
                    ErrorMessage="*Phone Number Required" 
                    ControlToValidate="_phone1" 
                    CssClass="failurenotification"></asp:RequiredFieldValidator></td>
        </tr>
       
        <tr>
            <td colspan="2" class="center"><br />
                <asp:Button ID="_submit" runat="server" Text="Submit" OnClick="_submit_Click" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="_cancel" runat="server"
                    Text="Cancel" CausesValidation="False" OnClick="_cancel_Click" />
            </td>
        
        </tr>
        </table>
        <br /><br />
    <p class="center">
    <asp:Label ID="_returnResults" runat="server" Text="">
    </asp:Label>
    </p>
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="contactID" DataSourceID="SqlDataLstContact" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="contactID" HeaderText="Contact ID" InsertVisible="False" ReadOnly="True" SortExpression="contactID" Visible="False" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" ReadOnly="True" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" ReadOnly="True" />
           
            
            
            <asp:TemplateField HeaderText="Job Title" SortExpression="jobTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="_jobTitle2" runat="server" Text='<%# Bind("jobTitle") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Must enter job title" ControlToValidate="_jobTitle2" Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("jobTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:BoundField DataField="companyName" HeaderText="Company" SortExpression="companyName" ReadOnly="True" />
           
            <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                <EditItemTemplate>
                    <asp:TextBox ID="_phone2" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*Must enter phone number" ControlToValidate="_phone2" Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" ReadOnly="True" />

            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this contact?')"></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataLstContact" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" DeleteCommand="S16ListDERlstContactsDelete" DeleteCommandType="StoredProcedure" SelectCommand="S16ListDERlstContactsSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="S16ListDERlstContactsUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="contactID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="contactID" Type="Int32" />
            <asp:Parameter Name="jobTitle" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>

