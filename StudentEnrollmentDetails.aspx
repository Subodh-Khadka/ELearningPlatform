<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="StudentEnrollmentDetails.aspx.cs" Inherits="ELearningPlatform.StudentEnrollmentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h5 class="ms-2 text-secondary">Enrollment Details</h5>
         <hr class="mb-3" />
    <div class="d-flex mb-3 gap-2">
        <h6 class="mt-2 ">Select Student:</h6>
        <asp:DropDownList ID="DropDownList1" CssClass="form-select w-25 bg-light text-dark" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="STUDENTNAME" DataValueField="STUDENTNO" OnSelectedIndexChanged="slist">
        </asp:DropDownList>
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="text-secondary text-center w-100" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="STUDENTNO,COURSEID" DataSourceID="studentEnrollmentQuery" ForeColor="Black">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1"  DataField="STUDENTNO" HeaderText="STUDENTNO" ReadOnly="True" SortExpression="STUDENTNO" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="STUDENTNAME" HeaderText="STUDENTNAME" SortExpression="STUDENTNAME" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="DOB" HeaderText="DOB" SortExpression="DOB"  DataFormatString="{0:MM/dd/yyyy}"/>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="EMAILADDRESS" HeaderText="EMAILADDRESS" SortExpression="EMAILADDRESS" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="ENROLLDATE" HeaderText="ENROLLDATE" SortExpression="ENROLLDATE" DataFormatString="{0:MM/dd/yyyy}"/>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEID" HeaderText="COURSEID" ReadOnly="True" SortExpression="COURSEID" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSETITLE" HeaderText="COURSETITLE" SortExpression="COURSETITLE" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="studentEnrollmentQuery" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT s.STUDENTNO, s.STUDENTNAME, s.CONTACT, s.DOB, s.EMAILADDRESS, s.COUNTRY, e.ENROLLDATE, c.COURSEID, c.COURSETITLE 
        FROM STUDENT s, ENROLLMENT e, COURSE c 
        WHERE s.STUDENTNO = e.STUDENTNO AND e.COURSEID = c.COURSEID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENTNO&quot;, &quot;STUDENTNAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
</asp:Content>
<%--  --%>