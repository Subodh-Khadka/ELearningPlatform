<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="ELearningPlatform.Lesson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lib/css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="">
     <h5 class="ms-2 text-secondary">Lesson List</h5>
     <hr class="mb-3" />
 </div>
    <asp:GridView ID="GridView1" CssClass="text-center text-secondary"  runat="server" AutoGenerateColumns="False" BackColor="#393E46" BorderColor="#999999" Width="1000px" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="LESSONNO,COURSEID" DataSourceID="Lessons">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="LESSONNO" HeaderText="LESSONNO" ReadOnly="True" SortExpression="LESSONNO" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="LESSONTITLE" HeaderText="LESSONTITLE" SortExpression="LESSONTITLE" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEID" HeaderText="COURSEID" ReadOnly="True" SortExpression="COURSEID" />
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
    <asp:SqlDataSource ID="Lessons" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSONNO&quot; = :LESSONNO AND &quot;COURSEID&quot; = :COURSEID" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSONNO&quot;, &quot;LESSONTITLE&quot;, &quot;COURSEID&quot;) VALUES (:LESSONNO, :LESSONTITLE, :COURSEID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSONTITLE&quot; = :LESSONTITLE WHERE &quot;LESSONNO&quot; = :LESSONNO AND &quot;COURSEID&quot; = :COURSEID">
        <DeleteParameters>
            <asp:Parameter Name="LESSONNO" Type="Decimal" />
            <asp:Parameter Name="COURSEID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LESSONNO" Type="Decimal" />
            <asp:Parameter Name="LESSONTITLE" Type="String" />
            <asp:Parameter Name="COURSEID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LESSONTITLE" Type="String" />
            <asp:Parameter Name="LESSONNO" Type="Decimal" />
            <asp:Parameter Name="COURSEID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSONNO,COURSEID" DataSourceID="Lessons" CssClass="mt-2">
        <EditItemTemplate>
            LESSONNO:
            <asp:Label ID="LESSONNOLabel1" runat="server" Text='<%# Eval("LESSONNO") %>' />
            <br />
            LESSONTITLE:
            <asp:TextBox ID="LESSONTITLETextBox" runat="server" Text='<%# Bind("LESSONTITLE") %>' />
            <br />
            COURSEID:
            <asp:Label ID="COURSEIDLabel1" runat="server" Text='<%# Eval("COURSEID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>

        <InsertItemTemplate>
            <div class="row justify-content-center text-secondary ms-2 add">
                <h6 class="bg-info p-2 w-50 mt-2 text-center text-white">Add New Lesson</h6>
                <br />
                <div class="col-8 d-flex flex-wrap gap-2 bg-light border-2 mb-3  p-2">
                    <div class="form-group">
                        <label for="LESSONNOTextBox">Lesson No:</label>
                        <br />
                        <asp:TextBox ID="LESSONNOTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("LESSONNO") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="LESSONTITLETextBox">Lesson Title:</label>
                        <br />
                        <asp:TextBox ID="LESSONTITLETextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("LESSONTITLE") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="COURSEIDTextBox">Course ID:</label>
                        <br />
                        <asp:TextBox ID="COURSEIDTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("COURSEID") %>' />
                    </div>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-sm  btn-primary" CausesValidation="True" CommandName="Insert" Text='<i class="bi bi-plus-circle-fill"></i> Insert'/>
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-sm  btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text=' <i class="bi bi-x-circle-fill"></i> Cancel' />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-sm  btn-info mt-2" runat="server" CausesValidation="False" CommandName="New" Text='<i class="bi bi-plus-square-fill"></i> Insert New Lesson' />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
