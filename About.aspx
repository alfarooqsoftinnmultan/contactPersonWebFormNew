<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="contactPersonWebFormNew.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Find Person</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>


    <div class="row col-md-8">
        Find Id:
        <asp:TextBox id="txtUserName" runat="server"></asp:TextBox>
        <input id="btnGetTime" type="button" value="Find" onclick="ShowCurrentTime()" />
    </div>
    <hr>

        <div class="row">
            <div class="col-md-8">
                <table class="nav-justified">
                    <tr>
                        <td style="width: 202px">Id</td>
                        <td>
                            <input type="text" id="txtCode" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 202px">Name</td>
                        <td>
                            <input type="text" id="txtName" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 202px">Last Name</td>
                        <td>
                            <input type="text" id="txtLastName" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 202px">Phone</td>
                        <td>
                            <input type="text" id="txtPhone" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 202px">Email</td>
                        <td>
                            <input type="text" id="txtEmail" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 202px">Gender</td>
                        <td>
                            <input type="text" id="txtGender" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 202px">State</td>
                        <td>
                            <input type="text" id="txtState" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 202px">City</td>
                        <td>
                            <input type="text" id="txtCity" readonly/>
                        </td>
                    </tr>
                </table>

            </div>
        </div>


    <script type="text/javascript">
    function ShowCurrentTime() {
        $("#txtCode").val('');
        $("#txtName").val('');
        $("#txtLastName").val('');
        $("#txtPhone").val('');
        $("#txtEmail").val('');
        $("#txtGender").val('');
        $("#txtState").val('');
        $("#txtCity").val('');

        $.ajax({
            type: "POST",
            url: "Default.aspx/find_person",
            data: '{id: "' + $("#<%=txtUserName.ClientID%>")[0].value + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            }
        });
    }

    function OnSuccess(response) {
        //alert(response.d);
        var results = JSON.parse(response.d);
        console.log(results);
        console.log(results[0].person_name);
        $("#txtCode").val(results[0].person_id);
        $("#txtName").val(results[0].person_name);
        $("#txtLastName").val(results[0].person_last_name);
        $("#txtPhone").val(results[0].phone_no);
        $("#txtEmail").val(results[0].email);
        $("#txtGender").val(results[0].gender);
        $("#txtState").val(results[0].state_name);
        $("#txtCity").val(results[0].city_name);

        /*
        $.each(results, function (index, rec) {
            console.log(rec[index].person_name);
        });
        */
    }
    </script>


</asp:Content>
