﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ELearningPlatform.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lib/css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h6 class="ms-2 text-secondary text-center">Student List</h6>
    <hr class="mb-3" />
    <asp:GridView ID="GridView1" CssClass=" m-2 p-2 text-secondary" runat="server" AutoGenerateColumns="False" BackColor="#393E46" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="STUDENTNO" DataSourceID="SqlDataSource1" Width="1000px">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="STUDENTNO" HeaderText="STUDENTNO" ReadOnly="True" SortExpression="STUDENTNO" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="STUDENTNAME" HeaderText="STUDENTNAME" SortExpression="STUDENTNAME" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="EMAILADDRESS" HeaderText="EMAILADDRESS" SortExpression="EMAILADDRESS" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
            <asp:CommandField ItemStyle-CssClass="p-1 border-1" ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENTNO&quot; = :STUDENTNO" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENTNO&quot;, &quot;STUDENTNAME&quot;, &quot;CONTACT&quot;, &quot;DOB&quot;, &quot;EMAILADDRESS&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENTNO, :STUDENTNAME, :CONTACT, :DOB, :EMAILADDRESS, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENTNAME&quot; = :STUDENTNAME, &quot;CONTACT&quot; = :CONTACT, &quot;DOB&quot; = :DOB, &quot;EMAILADDRESS&quot; = :EMAILADDRESS, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENTNO&quot; = :STUDENTNO">
        <DeleteParameters>
            <asp:Parameter Name="STUDENTNO" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STUDENTNO" Type="Decimal" />
            <asp:Parameter Name="STUDENTNAME" Type="String" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="EMAILADDRESS" Type="String" />
            <asp:Parameter Name="COUNTRY" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STUDENTNAME" Type="String" />
            <asp:Parameter Name="CONTACT" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="EMAILADDRESS" Type="String" />
            <asp:Parameter Name="COUNTRY" Type="String" />
            <asp:Parameter Name="STUDENTNO" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENTNO" DataSourceID="SqlDataSource1" Height="107px" Width="1000px">
        <EditItemTemplate>
            STUDENTNO:
            <asp:Label ID="STUDENTNOLabel1" runat="server" Text='<%# Eval("STUDENTNO") %>' />
            <br />
            STUDENTNAME:
            <asp:TextBox ID="STUDENTNAMETextBox" runat="server" Text='<%# Bind("STUDENTNAME") %>' />
            <br />
            CONTACT:
            <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
            <br />
            DOB:
            <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
            <br />
            EMAILADDRESS:
            <asp:TextBox ID="EMAILADDRESSTextBox" runat="server" Text='<%# Bind("EMAILADDRESS") %>' />
            <br />
            COUNTRY:
            <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row justify-content-center text-secondary ms-2 add">
                <h6 class="bg-success p-2 w-50 text-center text-white">Add New Student</h6>
                <br />
                <div class="col-8 d-flex flex-wrap gap-2 border-2 bg-light p-2">
                    <div class="form-group">
                        <label for="STUDENTNOTextBox">STUDENTNO:</label>
                        <br />
                        <asp:TextBox ID="STUDENTNOTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("STUDENTNO") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="STUDENTNAMETextBox">STUDENTNAME:</label><br />
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control-sm" Text='<%# Bind("STUDENTNAME") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="CONTACTTextBox">CONTACT:</label><br />
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control-sm" Text='<%# Bind("CONTACT") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="DOBTextBox">DOB:</label><br />
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control-sm" Text='<%# Bind("DOB") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="EMAILADDRESSTextBox">EMAILADDRESS:</label><br />
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control-sm" Text='<%# Bind("EMAILADDRESS") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="COUNTRYTextBox">COUNTRY:</label><br />
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control-sm" Text='<%# Bind("COUNTRY") %>' />
                    </div>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-danger mt-1" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </div>
            </div>

        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-success mt-0" CausesValidation="False" CommandName="New" Text="Insert New Student" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>