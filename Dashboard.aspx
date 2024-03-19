<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ELearningPlatform.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lib/css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h6 class="text-primary">E-Learning Dashboard!</h6>
    <div class="row justify-content-center">
        <%--<div class="col-4">
            <asp:Image ID="Image1" ImageUrl="~/lib/2345127.jpg" CssClass="rounded-5 mt-4" runat="server" Width="228px" Height="209px" />
            <asp:SqlDataSource ID="totalstudent" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL_STUDENTS FROM STUDENT"></asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;
        </div>--%>
    </div>
    <div class="row d-flex mb-2">
        <div class="col-3">
            <div class="card cards rounded-3" style="width: 250px; height: 310px">
                <img class="card-img-top" src="lib/student.jpg" alt="Card image cap">
                <div class="card-body d-flex flex-column text-info">
                    <h6 class="card-titled-flex">Total Student</h6>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="totalstudent" Height="50px" Width="10px" CellPadding="4" GridLines="None">
                        <Fields>
                            <asp:BoundField DataField="TOTAL_STUDENTS" ControlStyle-CssClass="mb-2 pb-2 text-center" HeaderText="" SortExpression="TOTAL_STUDENTS" />
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card rounded-3" style="width: 250px; height: 310px">
                <img class="card-img-top" src="lib/Course.jpg" alt="Card image cap" height="230">
                <div class="card-body d-flex flex-column text-info mb-1">
                    <h6 class="card-titled-flex">Total Courses</h6>
                    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="Coursess" Height="50px" Width="10px" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Fields>
                            <asp:BoundField DataField="TOTAL_COURSES" ControlStyle-CssClass="mb-2 pb-2 text-center " HeaderText="" SortExpression="TOTAL_COURSES"></asp:BoundField>
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card rounded-3" style="width: 250px; height: 310px">
                <img class="card-img-top" src="lib/enrollments.jpg" alt="Card image cap" height="230">
                <div class="card-body d-flex flex-column text-info">
                    <h6 class="card-titled-flex">Total Enrollments</h6>
                    <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataSourceID="TotalEnrollments" Height="50px" Width="10px" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Fields>
                            <asp:BoundField DataField="TOTAL_ENROLLMENTS" ControlStyle-CssClass="mb-2 pb-2 text-center " HeaderText="" SortExpression="TOTAL_ENROLLMENTS"></asp:BoundField>
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card rounded-3" style="width: 250px; height: 310px">
                <img class="card-img-top pt-5" src="lib/instructor.jpg" alt="Card image cap" height="250">
                <div class="card-body d-flex flex-column text-info">
                    <h6 class="card-titled-flex">Total Instructors</h6>
                    <asp:DetailsView ID="DetailsView5" runat="server" AutoGenerateRows="False" DataSourceID="InstructorsTotal" Height="50px" Width="10px" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Fields>
                            <asp:BoundField DataField="TOTAL_INSTRUCTORS" ControlStyle-CssClass="mb-2 pb-2 text-center " HeaderText="" SortExpression="TOTAL_INSTRUCTORS"></asp:BoundField>
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
        </div>
    </div>
    <div class="row justify-content-center align-items-center">
        <div class="col-6">
         <asp:Chart ID="Chart1" Style="width: 100%; height: 300px;" BorderDashStyle="NotSet" CssClass="rounded-top-5 text-success" runat="server" DataSourceID="chart1CourseEnroll">
    <Series>
        <asp:Series Name="Series1" XValueMember="COURSEID" YValueMembers="TOTAL_ENROLLED_STUDENTS" BackGradientStyle="VerticalCenter"  BackSecondaryColor="WhiteSmoke" ChartType="Column" BorderDashStyle="NotSet">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>

            <p class="text-center text-info bg-white">Course & Enrollment Count</p>
        </div>
        <div class="col-6 align-items-center justify-content-center">
            <h5 style="height:300px;width:550px; padding:90px" class="align-self-center align-items-center text-info bg-white ms-3">Welcome to the dashboard! Here you can view and manage various aspects of the e-learning platform.<asp:SqlDataSource ID="latestChart" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.COURSETITLE, COUNT(e.STUDENTNO) AS TotalStudents FROM { oj COURSE c LEFT OUTER JOIN ENROLLMENT e ON c.COURSEID = e.COURSEID } GROUP BY c.COURSETITLE ORDER BY TotalStudents DESC"></asp:SqlDataSource>
            </h5>
        </div>
    </div>
    <asp:SqlDataSource ID="Coursess" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL_COURSES FROM COURSE"></asp:SqlDataSource>
    <asp:SqlDataSource ID="totalstudent" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL_STUDENTS FROM STUDENT"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TotalEnrollments" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL_ENROLLMENTS FROM ENROLLMENT"></asp:SqlDataSource>
    <asp:SqlDataSource ID="InstructorsTotal" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL_INSTRUCTORS FROM INSTRUCTOR"></asp:SqlDataSource>
    <asp:SqlDataSource ID="chart1CourseEnroll" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="
     SELECT c.COURSEID,
       c.COURSETITLE,
       COUNT(e.STUDENTNO) AS TOTAL_ENROLLED_STUDENTS
FROM course c
JOIN enrollment e ON c.COURSEID = e.COURSEID
GROUP BY c.COURSEID, c.COURSETITLE
ORDER BY c.COURSEID

        ">
    </asp:SqlDataSource>
</asp:Content>

 <%-- SELECT c.COURSEID, c.COURSETITLE, COUNT(e.STUDENTNO) AS STUDENT_COUNT
      FROM COURSE c
      INNER JOIN ENROLLMENT e ON c.COURSEID = e.COURSEID
      GROUP BY c.COURSEID, c.COURSETITLE--%>