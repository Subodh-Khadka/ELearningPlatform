<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ELearningPlatform.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENTNO" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="STUDENTNO" HeaderText="STUDENTNO" ReadOnly="True" SortExpression="STUDENTNO" />
                <asp:BoundField DataField="STUDENTNAME" HeaderText="STUDENTNAME" SortExpression="STUDENTNAME" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="EMAILADDRESS" HeaderText="EMAILADDRESS" SortExpression="EMAILADDRESS" />
                <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENTNO&quot; = :STUDENTNO" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENTNO&quot;, &quot;STUDENTNAME&quot;, &quot;CONTACT&quot;, &quot;DOB&quot;, &quot;EMAILADDRESS&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENTNO, :STUDENTNAME, :CONTACT, :DOB, :EMAILADDRESS, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENTNAME&quot; = :STUDENTNAME, &quot;CONTACT&quot; = :CONTACT, &quot;DOB&quot; = :DOB, &quot;EMAILADDRESS&quot; = :EMAILADDRESS, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENTNO&quot; = :STUDENTNO">
            <DeleteParameters>
                <asp:Parameter Name="STUDENTNO" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENTNO" Type="Decimal" />
                <asp:Parameter Name="STUDENTNAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAILADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENTNAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAILADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="STUDENTNO" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
