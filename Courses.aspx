<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="ELearningPlatform.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lib/css/index.css" rel="stylesheet" />

    <style>
        .adds {
            border: 0px solid white;
        }

        .td {
            margin: 0;
            padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h5 class="ms-2 text-secondary">Course List</h5>
    <hr class="mb-3" />

    <asp:GridView ID="GridView1" runat="server" CssClass=" m-2 p-2 text-secondary text-center" AutoGenerateColumns="False" BackColor="#393E46" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="COURSEID" DataSourceID="SqlDataSource2" Width="1000px">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEID" HeaderText="COURSEID" ReadOnly="True" SortExpression="COURSEID" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSETITLE" HeaderText="COURSETITLE" SortExpression="COURSETITLE" />
            <asp:CommandField ItemStyle-CssClass="p-1 border-1 text-success" ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSEID&quot; = :COURSEID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSEID&quot;, &quot;COURSETITLE&quot;) VALUES (:COURSEID, :COURSETITLE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSETITLE&quot; = :COURSETITLE WHERE &quot;COURSEID&quot; = :COURSEID">
        <DeleteParameters>
            <asp:Parameter Name="COURSEID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSEID" Type="String" />
            <asp:Parameter Name="COURSETITLE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COURSETITLE" Type="String" />
            <asp:Parameter Name="COURSEID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" CssClass="mb-0 pb-0" DataKeyNames="COURSEID" DataSourceID="SqlDataSource2" Height="107px" Width="1000px">
        <EditItemTemplate>
            COURSEID:
            <asp:Label ID="COURSEIDLabel1" runat="server" Text='<%# Eval("COURSEID") %>' />
            <br />
            COURSETITLE:
            <asp:TextBox ID="COURSETITLETextBox" runat="server" Text='<%# Bind("COURSETITLE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row justify-content-center text-secondary ms-2 add">
                <h6 class="bg-info p-2 w-50 mt-2 text-center text-white">Add New Course</h6>
                <br />
                <div class="col-6 d-flex flex-wrap gap-2 mb-1 border-2 bg-light p-2">
                    <div class="form-group">
                        <label for="COURSEIDTextBox">Course ID:</label>
                        <br />
                        <asp:TextBox ID="COURSEIDTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("CourseID") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="COURSETITLETextBox">Course Title:</label>
                        <br />
                        <asp:TextBox ID="COURSETITLETextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("COURSETITLE") %>' />
                    </div>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-sm  btn-primary mt-0" CausesValidation="True" CommandName="Insert" Text='<i class="bi bi-plus-circle-fill"></i> Insert'/>
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-sm  btn-danger mt-0" runat="server" CausesValidation="False" CommandName="Cancel" Text=' <i class="bi bi-x-circle-fill"></i> Cancel' />
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="mb-5">
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-sm btn-info" CausesValidation="False" CommandName="New" Text='<i class="bi bi-plus-square-fill"></i> Insert New Course' />
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
