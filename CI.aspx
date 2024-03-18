<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="CI.aspx.cs" Inherits="ELearningPlatform.CI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h5 class="ms-2 text-secondary">Course-Instructor Details</h5>
            <hr class="mb-3" />
    <div class="d-flex mb-3 gap-2">
    <h6 class="mt-2 mb-2">Select Course:</h6>
    <asp:DropDownList ID="DropDownList1" CssClass="form-select w-25 bg-light text-dark" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSETITLE" DataValueField="COURSEID" AutoPostBack="true" OnSelectedIndexChanged="dlist">
    </asp:DropDownList>
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="text-secondary text-center w-100" AutoGenerateColumns="False" width="1000px" DataKeyNames="COURSEID,COURSEINSTRUCTORID" DataSourceID="cigrid" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEID" HeaderText="COURSEID" ReadOnly="True" SortExpression="COURSEID" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSETITLE" HeaderText="COURSETITLE" SortExpression="COURSETITLE" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEINSTRUCTORID" HeaderText="COURSEINSTRUCTORID" ReadOnly="True" SortExpression="COURSEINSTRUCTORID" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEINSTRUCTORNAME" HeaderText="COURSEINSTRUCTORNAME" SortExpression="COURSEINSTRUCTORNAME" />
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
    <asp:SqlDataSource ID="cigrid" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT c.COURSEID, c.COURSETITLE, i.COURSEINSTRUCTORID, i.COURSEINSTRUCTORNAME
FROM course c
LEFT JOIN course_instructor_student cis ON c.COURSEID = cis.COURSEID
LEFT JOIN instructor i ON cis.COURSEINSTRUCTORID = i.COURSEINSTRUCTORID
                       AND i.COURSEINSTRUCTORID IN (
                            SELECT COURSEINSTRUCTORID
                            FROM course_instructor_student
                            GROUP BY COURSEINSTRUCTORID
                            HAVING COUNT(DISTINCT COURSEID) >= 2
                       )
ORDER BY c.COURSEID">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSEID&quot;, &quot;COURSETITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
</asp:Content>
