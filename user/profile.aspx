<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server"
            Text="User Profile Information"></asp:Label>
    </h1>

    <p class="center">
        <asp:Label ID="_message" runat="server" Text="" CssClass="failurenotification"></asp:Label>
    </p>
    <h3 class="center">
        <asp:Label ID="_instruction" runat="server" Text="Add a New User"></asp:Label></h3>

    <br />
    <table class="tableCenter">
        <tr>
            <td class="tdr">
                <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="_firstname" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*First Name Required" 
                    ControlToValidate="_firstName" 
                    CssClass="failurenotification"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td class="tdr">
                <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="_lastName" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*Last Name Required" 
                    ControlToValidate="_lastName" 
                    CssClass="failurenotification"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td class="tdr">
                <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label></td>
            <td>
                <asp:TextBox ID="_email" runat="server" ClientIDMode="Inherit"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*Email Required" 
                    ControlToValidate="_email" 
                    CssClass="failurenotification" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Invalid Email" CssClass="failurenotification" ControlToValidate="_email" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="True"></asp:RegularExpressionValidator>

            </td>
        </tr>

        <tr>
            <td class="tdr">
                <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label></td>
            <td>
                <asp:TextBox ID="_password" runat="server" TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*Password Required" 
                    ControlToValidate="_password" 
                    CssClass="failurenotification"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td class="tdr">
                <asp:Label ID="Label6" runat="server" Text="Role"></asp:Label></td>
            <td>
                <asp:DropDownList ID="_role" runat="server" DataSourceID="SqlDataRole" DataTextField="roleDesc" DataValueField="roleID" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">-Please Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataRole" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="ValidRolesSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator5" runat="server" 
                    ErrorMessage="*Role Required" 
                    ControlToValidate="_role" 
                    CssClass="failurenotification" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2" class="center"><br />
                <asp:Button ID="_submit" runat="server" Text="Submit" OnClick="_submit_Click" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="_clear" runat="server"
                    Text="Clear" CausesValidation="False" OnClick="_clear_Click" />
            </td>
        </tr>
    </table>
    <br /><br />
    <p class="center">
    <asp:Label ID="_returnResults" runat="server" Text="">
    </asp:Label>
    </p>
    <br /><br /><br />
    <asp:GridView ID="_peopleGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="personID" DataSourceID="SqlDataPeople" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="roleDesc" HeaderText="Role" SortExpression="roleDesc" />
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

    <asp:SqlDataSource ID="SqlDataPeople" runat="server" ConnectionString="<%$ ConnectionStrings:S16ListDERConnectionString %>" SelectCommand="S16listDERPersonSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>

