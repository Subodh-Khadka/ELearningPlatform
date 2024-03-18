<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="ELearningPlatform.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:TextBox ID="txtSearchStudent" runat="server" placeholder="Enter student name..." />
        <asp:Button ID="btnSearchStudent" runat="server" Text="Search" OnClick="btnSearchStudent_Click" />
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="STUDENTNO,COURSEID" DataSourceID="test1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="STUDENTNO" HeaderText="STUDENTNO" ReadOnly="True" SortExpression="STUDENTNO" />
            <asp:BoundField DataField="STUDENTNAME" HeaderText="STUDENTNAME" SortExpression="STUDENTNAME" />
            <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="EMAILADDRESS" HeaderText="EMAILADDRESS" SortExpression="EMAILADDRESS" />
            <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
            <asp:BoundField DataField="ENROLLDATE" HeaderText="ENROLLDATE" SortExpression="ENROLLDATE" />
            <asp:BoundField DataField="COURSEID" HeaderText="COURSEID" ReadOnly="True" SortExpression="COURSEID" />
            <asp:BoundField DataField="COURSETITLE" HeaderText="COURSETITLE" SortExpression="COURSETITLE" />
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

 <asp:SqlDataSource ID="test1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
    SelectCommand="SELECT s.STUDENTNO, s.STUDENTNAME, s.CONTACT, s.DOB, s.EMAILADDRESS, s.COUNTRY, e.ENROLLDATE, c.COURSEID, c.COURSETITLE 
                    FROM STUDENT s
                    INNER JOIN ENROLLMENT e ON s.STUDENTNO = e.STUDENTNO
                    INNER JOIN COURSE c ON e.COURSEID = c.COURSEID
                    WHERE s.STUDENTNAME LIKE '%' || :SearchKeyword || '%'">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtSearchStudent" Name="SearchKeyword" PropertyName="Text" Type="String" DefaultValue="" />
    </SelectParameters>
</asp:SqlDataSource>


</asp:Content>
