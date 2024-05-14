<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="contactPersonWebFormNew._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .del {
            color:white;
            background-color:red;
        }
        .btnsave {
            color:white;
            background-color:green;
        }

    </style>

    <div class="jumbotron">
                        <asp:Button ID="btnNew" runat="server" Text="Add / Clear" Width="168px" OnClick="btnNew_Click" CssClass="btnsave"/>
        <h1>Contact Person</h1>
    <div class="row">
        <div class="col-md-8">
            <table class="nav-justified">
                <tr>
                    <td style="width: 202px">
                        <asp:Label ID="Label8" runat="server" Text="Id"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCode" runat="server" Width="250px" BackColor="#CCCCCC" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 202px">
                        <asp:Label ID="Label9" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 202px">
                        <asp:Label ID="Label10" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 202px">
                        <asp:Label ID="Label11" runat="server" Text="Phone No."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhoneNo" runat="server" Width="250px" MaxLength="25"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 202px; height: 22px;">
                        <asp:Label ID="Label12" runat="server" Text="Email" ></asp:Label>
                    </td>
                    <td style="height: 22px">
                        <asp:TextBox ID="txtEmail" runat="server" Width="250px" TextMode="Email" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 202px">
                        <asp:Label ID="Label13" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="txtGender" runat="server" Height="30px" Width="250px">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 202px; height: 22px;">
                        <asp:Label ID="Label1" runat="server" Text="State"></asp:Label>
                    </td>
                    <td style="height: 22px">
                        <asp:DropDownList ID="ddState" runat="server" Height="30px" AutoPostBack = "true" OnSelectedIndexChanged = "OnSelectedIndexChanged" Width="250px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 202px; height: 22px;">
                        <asp:Label ID="Label2" runat="server" Text="City"></asp:Label>
                    </td>
                    <td style="height: 22px">
                        <asp:DropDownList ID="ddCities" runat="server" Height="30px" Width="250px">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="width: 202px">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="168px" OnClick="btnSave_Click" CssClass="btnsave"/>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="85px" OnClick="btnDelete_Click" CssClass="del"/>
                    </td>
                </tr>

            </table>

        </div>
    </div>
    </div>

    <div class="row">
        <div class="col-md-8">
            <h2>Contact List</h2>
                <asp:GridView ID="GridView1" AutoGenerateSelectButton="True" runat="server" CellPadding="3" GridLines="None"  BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" Width="1117px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" >
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>


        </div>
    </div>

</asp:Content>
