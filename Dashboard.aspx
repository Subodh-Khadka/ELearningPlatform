<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ELearningPlatform.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="text-primary">Welcome To the E-Learning Dashboard!</h3>
    <div class="row justify-content-center">
        <div class="col-4">
            <asp:Image ID="Image1" ImageUrl="~/lib/2345127.jpg" CssClass="rounded-5 mt-4" runat="server" Width="228px" Height="209px" />
            <asp:SqlDataSource ID="totalstudent" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL_STUDENTS FROM STUDENT"></asp:SqlDataSource>
        </div>
          <asp:DetailsView ID="DetailsView" runat="server" AutoGenerateRows="False" DataSourceID="totalstudent" Height="50px" Width="10px">
      <Fields>
          <asp:BoundField DataField="TOTAL_STUDENTS" HeaderText="TOTAL_STUDENTS" SortExpression="TOTAL_STUDENTS" />
      </Fields>
  </asp:DetailsView>

    </div>
</asp:Content>
