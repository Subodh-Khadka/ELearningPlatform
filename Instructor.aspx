<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="ELearningPlatform.Instructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="lib/css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <h5 class="ms-2 text-secondary">Instructor List</h5>
        <hr class="mb-3" />
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="text-center m-2 p-2 text-secondary" Width="1000px" AutoGenerateColumns="False" BackColor="#393E46" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="COURSEINSTRUCTORID" DataSourceID="InstructorList">
        <Columns>
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEINSTRUCTORID" HeaderText="COURSEINSTRUCTORID" ReadOnly="True" SortExpression="COURSEINSTRUCTORID" />
            <asp:BoundField ItemStyle-CssClass="p-1 border-1" DataField="COURSEINSTRUCTORNAME" HeaderText="COURSEINSTRUCTORNAME" SortExpression="COURSEINSTRUCTORNAME" />
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
    <asp:SqlDataSource ID="InstructorList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;COURSEINSTRUCTORID&quot; = :COURSEINSTRUCTORID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;COURSEINSTRUCTORID&quot;, &quot;COURSEINSTRUCTORNAME&quot;) VALUES (:COURSEINSTRUCTORID, :COURSEINSTRUCTORNAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;COURSEINSTRUCTORNAME&quot; = :COURSEINSTRUCTORNAME WHERE &quot;COURSEINSTRUCTORID&quot; = :COURSEINSTRUCTORID">
        <DeleteParameters>
            <asp:Parameter Name="COURSEINSTRUCTORID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COURSEINSTRUCTORID" Type="String" />
            <asp:Parameter Name="COURSEINSTRUCTORNAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COURSEINSTRUCTORNAME" Type="String" />
            <asp:Parameter Name="COURSEINSTRUCTORID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSEINSTRUCTORID" DataSourceID="InstructorList" Width="1000px">
        <EditItemTemplate>
            COURSEINSTRUCTORID:
            <asp:Label ID="COURSEINSTRUCTORIDLabel1" runat="server" Text='<%# Eval("COURSEINSTRUCTORID") %>' />
            <br />
            COURSEINSTRUCTORNAME:
            <asp:TextBox ID="COURSEINSTRUCTORNAMETextBox" runat="server" Text='<%# Bind("COURSEINSTRUCTORNAME") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>

        <InsertItemTemplate>
            <div class="row justify-content-center text-secondary ms-2 add">
                <h6 class="bg-info p-2 w-50 mt-2 text-center text-white">Add New Instructor</h6>
                <br />
                <div class="col-8 d-flex flex-wrap gap-2 bg-light border-2 mb-3  p-2">
                    <div class="form-group">
                        <label for="COURSEINSTRUCTORIDTextBox">Instructor ID:</label>
                        <br />
                        <asp:TextBox ID="COURSEINSTRUCTORIDTextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("COURSEINSTRUCTORID") %>' />
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="COURSEINSTRUCTORNAMETextBox">Instructor Name:</label>
                        <br />
                        <asp:TextBox ID="COURSEINSTRUCTORNAMETextBox" runat="server" CssClass="form-control-sm" Text='<%# Bind("COURSEINSTRUCTORNAME") %>' />
                    </div>
                    <br />
                </div>
                    <div class="ms-5 mb-2">
                        <asp:LinkButton ID="InsertButton" CssClass="btn btn-sm btn-primary mt-0" runat="server" CausesValidation="True" CommandName="Insert" Text='<i class="bi bi-plus-circle-fill"></i> Insert' />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-sm  btn-danger mt-0" runat="server" CausesValidation="False" CommandName="Cancel" Text=' <i class="bi bi-x-circle-fill"></i> Cancel' />
                    </div>
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-sm  btn-info mt-2" runat="server" CausesValidation="False" CommandName="New" Text='<i class="bi bi-plus-square-fill"></i> Insert New Instructor' />
        </ItemTemplate>
    </asp:FormView>
    &nbsp;&nbsp;&nbsp; 
</asp:Content>
