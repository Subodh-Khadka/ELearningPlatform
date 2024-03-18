<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="BestCourse.aspx.cs" Inherits="ELearningPlatform.BestCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="COURSEID" DataSourceID="MonthBest">
    <Columns>
        <asp:BoundField DataField="COURSEID" HeaderText="COURSEID" ReadOnly="True" SortExpression="COURSEID" />
        <asp:BoundField DataField="COURSETITLE" HeaderText="COURSETITLE" SortExpression="COURSETITLE" />
        <asp:BoundField DataField="ENROLLMENT_COUNT" HeaderText="ENROLLMENT_COUNT" SortExpression="ENROLLMENT_COUNT" />
    </Columns>
</asp:GridView>
   <asp:SqlDataSource ID="MonthBest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
       SelectCommand="
    SELECT * FROM (
        SELECT e.COURSEID, c.COURSETITLE, COUNT(e.STUDENTNO) AS ENROLLMENT_COUNT
        FROM enrollment e
        JOIN course c ON e.COURSEID = c.COURSEID
        WHERE EXTRACT(MONTH FROM e.ENROLLDATE) = 1
        AND EXTRACT(YEAR FROM e.ENROLLDATE) = 2024
        GROUP BY e.COURSEID, c.COURSETITLE
        ORDER BY COUNT(e.STUDENTNO) DESC
    ) WHERE ROWNUM <= 3">
</asp:SqlDataSource>


<asp:SqlDataSource ID="BestMonth" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.COURSEID, c.COURSETITLE, COUNT(s.STUDENTNO) AS ENROLLMENT_COUNT FROM COURSE c, COURSE_INSTRUCTOR_STUDENT cis, STUDENT s WHERE c.COURSEID = cis.COURSEID AND cis.STUDENTID = s.STUDENTNO GROUP BY c.COURSEID, c.COURSETITLE ORDER BY ENROLLMENT_COUNT DESC"></asp:SqlDataSource>
</asp:Content>
