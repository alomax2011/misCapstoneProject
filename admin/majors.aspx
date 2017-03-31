<%@ Page Title="Majors" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="majors.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
 <asp:Label ID="Label1" runat="server" Text="Add or Modify the Majors Table"></asp:Label>
    </h1>
    <p class="center">
        <asp:Label ID="_message" runat="server" Text=""
           CssClass="failurenotification"></asp:Label>
    </p>
    <p class="center"><asp:Button ID="_addStart" runat="server" Text="Add New Major" OnClick="_addStart_Click" /></p>
    <asp:Panel ID="_pnlAdd" runat="server" Visible="False">
        
        <table class="tableCenter">
    <tr>
        <td class ="tdr">
            <asp:Label ID="Label2" runat="server" Text="Major Description"></asp:Label></td>
        <td>
            <asp:TextBox ID="_major" runat="server"></asp:TextBox></td>
        <td style="width: 151px">
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="_major"
                ErrorMessage="*Major Description Required"
                CssClass="failurenotification">
            </asp:RequiredFieldValidator></td>
     </tr>
    <tr><td colspan="2" class="center"><br/>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="_submit" runat="server" Text="Submit" OnClick="_submit_Click" /> &nbsp; &nbsp; &nbsp; 
            <asp:Button ID="_cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="_cancel_Click" /> </td></tr>
       </table>
    </asp:Panel>
    <br />
    <asp:GridView ID="_gridMajors" runat="server" AutoGenerateColumns="False" DataKeyNames="majorID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated" OnSelectedIndexChanged="_gridMajors_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="majorID" HeaderText="Major ID" InsertVisible="False" ReadOnly="True" SortExpression="majorID" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Major Description" SortExpression="majorDescription">
                <EditItemTemplate>
                    <asp:TextBox ID="_majordesc" runat="server" Text='<%# Bind("majorDescription") %>' CausesValidation="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" EnableTheming="True" ErrorMessage="Please enter a description" CssClass="failurenotification" ControlToValidate="_majordesc"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("majorDescription") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Font-Bold="True" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this major?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" DeleteCommand="validMajorsDelete" DeleteCommandType="StoredProcedure" SelectCommand="validMajorsSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="updateValidMajors" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="majorID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="majorID" Type="Int32" />
            <asp:Parameter Name="majorDescription" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

    
