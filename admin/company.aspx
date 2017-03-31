<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="company.aspx.cs" Inherits="admin_company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        <asp:Label ID="Label6" runat="server" Text="Company Information"></asp:Label>
    </h1>

    <p class="center">
        <asp:Label ID="_message" runat="server" Text="" CssClass="failurenotification"></asp:Label>
    </p>
    <br />
    <p class="center">
        <asp:Button ID="_addStart" runat="server" Text="Add New Company" OnClick="_addStart_Click" />
    </p>
    <asp:Panel ID="_pnlAdd" runat="server" Visible="False">
        <table class="tableCenter">
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label7" runat="server" Text="Company Name"></asp:Label></td>
                <td>
                    <asp:TextBox ID="_companyName1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="*Company Name Required" 
                        ControlToValidate="_companyName1" 
                        CssClass="failurenotification"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label8" runat="server" Text="Street"></asp:Label></td>
                <td>
                    <asp:TextBox ID="_street1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="*Street Required" 
                        ControlToValidate="_street1" 
                        CssClass="failurenotification"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label9" runat="server" Text="City"></asp:Label></td>
                <td>
                    <asp:TextBox ID="_city1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="*City" 
                        ControlToValidate="_city1" 
                        CssClass="failurenotification"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label10" runat="server" Text="State"></asp:Label></td>
                <td>
                    <asp:TextBox ID="_state1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="*State Required" 
                        ControlToValidate="_state1" 
                        CssClass="failurenotification"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label11" runat="server" Text="Zip"></asp:Label></td>
                <td>
                    <asp:TextBox ID="_zip1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator10" runat="server" 
                        ErrorMessage="*Zip Required" 
                        ControlToValidate="_zip1" 
                        CssClass="failurenotification" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Zip must be five digits" ControlToValidate="_zip1" Type="Integer" Display="Dynamic" CssClass="failurenotification" Operator="DataTypeCheck"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td colspan="2" class="center">
                <br />
                    <asp:Button ID="_submit" runat="server" Text="Submit" OnClick="_submit_Click" />&nbsp;&nbsp;&nbsp;<asp:Button ID="_cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="_cancel_Click" />
                </td>
            </tr>
        </table>

    </asp:Panel>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="companyID" DataSourceID="SqlDataCompany" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdated="GridView1_RowUpdated" OnRowDeleted="GridView1_RowDeleted">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="companyID" HeaderText="Company ID" InsertVisible="False" ReadOnly="True" SortExpression="companyID" Visible="False" />
            <asp:TemplateField HeaderText="Company Name" SortExpression="companyName">
                <EditItemTemplate>
                    <asp:TextBox ID="_companyName" runat="server" Text='<%# Bind("companyName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="_companyName" Display="Dynamic" ErrorMessage="*Company Name Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("companyName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Street" SortExpression="street">
                <EditItemTemplate>
                    <asp:TextBox ID="_street" runat="server" Text='<%# Bind("street") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="_street" Display="Dynamic" ErrorMessage="*Street Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("street") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="city">
                <EditItemTemplate>
                    <asp:TextBox ID="_city" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="_city" Display="Dynamic" ErrorMessage="*City Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="state">
                <EditItemTemplate>
                    <asp:TextBox ID="_state" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="_state" Display="Dynamic" ErrorMessage="*State Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Zip" SortExpression="zip">
                <EditItemTemplate>
                    <asp:TextBox ID="_zip" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="_zip" Display="Dynamic" ErrorMessage="*Zip Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderText="DELETE">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this company?')"></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataCompany" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" DeleteCommand="companyDelete" DeleteCommandType="StoredProcedure" SelectCommand="companiesSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="companyUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="companyID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="companyID" Type="Int32" />
            <asp:Parameter Name="companyName" Type="String" />
            <asp:Parameter Name="street" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zip" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

