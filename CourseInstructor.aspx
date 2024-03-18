<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="CourseInstructor.aspx.cs" Inherits="ELearningPlatform.CourseInstructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lib/css/index.css" rel="stylesheet" />
    <style>
        .button {
            font-size: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h5 class="ms-2 text-secondary">Course-Instructor Details</h5>
    <hr class="mb-3" />

    <div class="d-flex justify-content-end gap-2 mb-4 me-4">
     <asp:TextBox ID="searchCourse" CssClass="form-control w-25" Font-Size="Smaller"  runat="server" placeholder="Enter course name....."></asp:TextBox>
     <asp:Button ID="searchCourseButton" CssClass="btn btn-sm btn-primary" Font-Size="Smaller"  runat="server" Text="Search" OnClick="ClickSearchButton" />
 </div>


    <asp:GridView ID="GridView1" runat="server" CssClass=" m-2 p-2 text-secondary text-center" DataSourceID="CourseInstruct" AutoGenerateColumns="False" BackColor="#393E46" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="COURSEID,COURSEINSTRUCTORID" Width="1000px">
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
     <asp:SqlDataSource ID="tcitest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.COURSEID, c.COURSETITLE, i.COURSEINSTRUCTORID, i.COURSEINSTRUCTORNAME FROM COURSE c, COURSE_INSTRUCTOR_STUDENT cis, INSTRUCTOR i WHERE c.COURSEID = cis.COURSEID AND cis.COURSEINSTRUCTORID = i.COURSEINSTRUCTORID"></asp:SqlDataSource>
     <asp:SqlDataSource ID="CourseInstruct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
      SelectCommand="SELECT c.COURSEID, c.COURSETITLE, i.COURSEINSTRUCTORID, i.COURSEINSTRUCTORNAME FROM COURSE c, COURSE_INSTRUCTOR_STUDENT cis, INSTRUCTOR i WHERE c.COURSEID = cis.COURSEID AND cis.COURSEINSTRUCTORID = i.COURSEINSTRUCTORID AND (i.COURSEINSTRUCTORID IN (SELECT COURSEINSTRUCTORID FROM COURSE_INSTRUCTOR_STUDENT GROUP BY COURSEINSTRUCTORID HAVING (COUNT(DISTINCT COURSEID) &gt;= 2))) ORDER BY c.COURSEID">
         <%--SELECT c.COURSEID, c.COURSETITLE, ci.COURSEINSTRUCTORID, ci.COURSEINSTRUCTORNAME
                       FROM COURSE c, courseInstructor ci
                       GROUP BY c.COURSEID, c.COURSETITLE, ci.COURSEINSTRUCTORID, ci.COURSEINSTRUCTORNAME--%>
  </asp:SqlDataSource>
</asp:Content>
