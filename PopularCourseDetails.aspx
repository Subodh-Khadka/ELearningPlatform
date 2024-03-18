<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="PopularCourseDetails.aspx.cs" Inherits="ELearningPlatform.PopularCourseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h5 class="ms-2 text-secondary">Best E-Learning Course</h5>
    <hr class="mb-3" />

    <div class="d-flex mb-3 gap-2">
        <h6 class="mt-2 mb-2">Select Month:</h6>
        <asp:DropDownList ID="CustomDropDownList" CssClass="form-select w-25 bg-light text-dark" runat="server" AutoPostBack="True" OnSelectedIndexChanged="clist">
            <%--<asp:ListItem Text="All" Value="100"></asp:ListItem>--%>
            <asp:ListItem Text="January" Value="1"></asp:ListItem>
            <asp:ListItem Text="February" Value="2"></asp:ListItem>
            <asp:ListItem Text="March" Value="3"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="text-secondary text-center w-100" AutoGenerateColumns="False" DataKeyNames="COURSEID" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEID" HeaderText="COURSEID" ReadOnly="True" SortExpression="COURSEID">
                <ItemStyle CssClass="p-1 border-1"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSETITLE" HeaderText="COURSETITLE" SortExpression="COURSETITLE">
                <ItemStyle CssClass="p-1 border-1"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="ENROLLMENT_COUNT" HeaderText="ENROLLMENT_COUNT" SortExpression="ENROLLMENT_COUNT">
                <ItemStyle CssClass="p-1 border-1"></ItemStyle>
            </asp:BoundField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT c.COURSEID, c.COURSETITLE, COUNT(s.STUDENTNO) AS ENROLLMENT_COUNT 
        FROM COURSE c, COURSE_INSTRUCTOR_STUDENT cis, STUDENT s 
        WHERE c.COURSEID = cis.COURSEID AND cis.STUDENTID = s.STUDENTNO 
        GROUP BY c.COURSEID, c.COURSETITLE ORDER BY ENROLLMENT_COUNT DESC"></asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ENROLLDATE&quot; FROM &quot;ENROLLMENT&quot;"></asp:SqlDataSource>


</asp:Content>
