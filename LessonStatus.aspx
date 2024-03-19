<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="LessonStatus.aspx.cs" Inherits="ELearningPlatform.LessonStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lib/css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h5 class="ms-2 text-secondary">Progress List</h5>
    <hr class="mb-3" />
    <asp:GridView ID="GridView1" runat="server" CssClass="text-center text-secondary"  BackColor="#393E46" BorderColor="#999999" Width="1000px" BorderStyle="Solid" AutoGenerateColumns="False" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="LESSONNO,STUDENTNO,COURSEID" DataSourceID="LessonStatusDetails">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="LESSONNO" HeaderText="LESSONNO" ReadOnly="True" SortExpression="LESSONNO" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="LESSONSTATUS" HeaderText="LESSONSTATUS" SortExpression="LESSONSTATUS" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="LASTACCESSEDDATE" HeaderText="LASTACCESSEDDATE" SortExpression="LASTACCESSEDDATE" DataFormatString="{0:MM/dd/yyyy}"/>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="STUDENTNO" HeaderText="STUDENTNO" ReadOnly="True" SortExpression="STUDENTNO" />
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
    <asp:SqlDataSource ID="LessonStatusDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSONSTATUS&quot; WHERE &quot;LESSONNO&quot; = :LESSONNO AND &quot;STUDENTNO&quot; = :STUDENTNO AND &quot;COURSEID&quot; = :COURSEID" InsertCommand="INSERT INTO &quot;LESSONSTATUS&quot; (&quot;LESSONNO&quot;, &quot;LESSONSTATUS&quot;, &quot;LASTACCESSEDDATE&quot;, &quot;STUDENTNO&quot;, &quot;COURSEID&quot;) VALUES (:LESSONNO, :LESSONSTATUS, :LASTACCESSEDDATE, :STUDENTNO, :COURSEID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSONSTATUS&quot;" UpdateCommand="UPDATE &quot;LESSONSTATUS&quot; SET &quot;LESSONSTATUS&quot; = :LESSONSTATUS, &quot;LASTACCESSEDDATE&quot; = :LASTACCESSEDDATE WHERE &quot;LESSONNO&quot; = :LESSONNO AND &quot;STUDENTNO&quot; = :STUDENTNO AND &quot;COURSEID&quot; = :COURSEID">
        <DeleteParameters>
            <asp:Parameter Name="LESSONNO" Type="Decimal" />
            <asp:Parameter Name="STUDENTNO" Type="Decimal" />
            <asp:Parameter Name="COURSEID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LESSONNO" Type="Decimal" />
            <asp:Parameter Name="LESSONSTATUS" Type="String" />
            <asp:Parameter Name="LASTACCESSEDDATE" Type="DateTime" />
            <asp:Parameter Name="STUDENTNO" Type="Decimal" />
            <asp:Parameter Name="COURSEID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LESSONSTATUS" Type="String" />
            <asp:Parameter Name="LASTACCESSEDDATE" Type="DateTime" />
            <asp:Parameter Name="LESSONNO" Type="Decimal" />
            <asp:Parameter Name="STUDENTNO" Type="Decimal" />
            <asp:Parameter Name="COURSEID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" CssClass="mt-2" DataKeyNames="LESSONNO,STUDENTNO,COURSEID" DataSourceID="LessonStatusDetails" Width="1000px">
        <EditItemTemplate>
            LESSONNO:
            <asp:Label ID="LESSONNOLabel1" runat="server" Text='<%# Eval("LESSONNO") %>' />
            <br />
            LESSONSTATUS:
            <asp:TextBox ID="LESSONSTATUSTextBox" runat="server" Text='<%# Bind("LESSONSTATUS") %>' />
            <br />
            LASTACCESSEDDATE:
            <asp:TextBox ID="LASTACCESSEDDATETextBox" runat="server" Text='<%# Bind("LASTACCESSEDDATE") %>' />
            <br />
            STUDENTNO:
            <asp:Label ID="STUDENTNOLabel1" runat="server" Text='<%# Eval("STUDENTNO") %>' />
            <br />
            COURSEID:
            <asp:Label ID="COURSEIDLabel1" runat="server" Text='<%# Eval("COURSEID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>

        <InsertItemTemplate>
            <div class="row justify-content-center text-secondary ms-2 add">
                <h6 class="bg-info p-2 w-50 mt-2 text-center text-white">Add New Progress Status</h6>
                <br />
                <div class="col-8 d-flex flex-wrap gap-2 bg-light border-2 mb-3  p-2">
                    <div class="form-group">
                        <label for="LESSONNOTextBox">Lesson No:</label>
                        <br />
                        <asp:TextBox ID="LESSONNOTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("LESSONNO") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="LESSONSTATUSTextBox">Lesson Status:</label>
                        <br />
                        <asp:TextBox ID="LESSONSTATUSTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("LESSONSTATUS") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="LASTACCESSEDDATETextBox">Lesson Accessed Date:</label>
                        <br />
                        <asp:TextBox ID="LASTACCESSEDDATETextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("LASTACCESSEDDATE") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="STUDENTNOTextBox">Student No:</label>
                        <br />
                        <asp:TextBox ID="STUDENTNOTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("STUDENTNO") %>' />
                    </div>
                    <br />
                    <div class="form-group col-8">
                        <label for="COURSEIDTextBox">Course ID:</label>
                        <br />
                        <asp:TextBox ID="COURSEIDTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("COURSEID") %>' />
                    </div>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-sm btn-primary mt-0" CausesValidation="True" CommandName="Insert" Text='<i class="bi bi-plus-circle-fill"></i> Insert'/>
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-sm btn-danger mt-0" runat="server" CausesValidation="False" CommandName="Cancel" Text=' <i class="bi bi-x-circle-fill"></i> Cancel' />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-sm  btn-info mt-0" runat="server" CausesValidation="False" CommandName="New" Text='<i class="bi bi-plus-square-fill"></i>Insert Student Progress' />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>