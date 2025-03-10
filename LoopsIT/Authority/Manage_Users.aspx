﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Design.Master" AutoEventWireup="true" CodeBehind="Manage_Users.aspx.cs" Inherits="LoopsIT.Authority.Manage_Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Manage-User.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="Contain">
    <h3>Manage Users</h3>
    <p>
        <asp:Repeater ID="FilteringUI" runat="server" OnItemCommand="FilteringUI_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkFilter" Text='<%# Container.DataItem %>' CommandName='<%# Container.DataItem %>'/>
            </ItemTemplate>
            <SeparatorTemplate>|</SeparatorTemplate>
        </asp:Repeater>
    </p>
        <asp:GridView ID="UserAccounts" runat="server"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDataBound="UserAccounts_RowDataBound">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="UserName" DataNavigateUrlFormatString="Approve_Unlock_User.aspx?user={0}" Text="Manage" />
                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:CheckBoxField DataField="IsApproved" Text=" " HeaderText="Approved?" />
                <asp:CheckBoxField DataField="IsLockedOut" Text=" " HeaderText="Locked Out?" />
                <asp:CheckBoxField DataField="IsOnline" Text=" " HeaderText="Online?" />
                <asp:BoundField DataField="Comment" HeaderText="Comment" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="DeleteLinkButton" OnClientClick="return confirm('Are you sure you want to delete?')" runat="server" CommandArgument='<%#Eval("UserName") %>' OnCommand="DeleteLinkButton_Command" >Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No Record(s) Found!
            </EmptyDataTemplate>
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

    <%if(UserAccounts.Rows.Count > 0) {%>
        <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">&lt;&lt; First</asp:LinkButton>
        |
        <asp:LinkButton ID="lnkPrev" runat="server" OnClick="lnkPrev_Click">&lt; Prev</asp:LinkButton>
        |
        <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">Next &gt;</asp:LinkButton>
        |
        <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">Last &gt;&gt;</asp:LinkButton>
    <%} %>
 </div>   
</asp:Content>
