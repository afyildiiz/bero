<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/User.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="rentx.View.User.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <label>Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Your Full Name">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid characters." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <label>E-mail</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your E-Mail">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="E-mail is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                             <asp:HiddenField ID="UserId" runat="server" Value="0" />
                        </div>
                        <div>
                            <label>ID Number</label>
                            <asp:TextBox ID="txtIdno" runat="server" CssClass="form-control" placeholder="Enter Your Mobile Phone">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mobile Phones is required" ControlToValidate="txtIdno" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                        </div>

                        <label>Address</label>
                        <div>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"
                                placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red"
                                ErrorMessage="Description is required" SetFocusOnError="true" Display="Dynamic"
                                ControlToValidate="txtAddress">
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>
                </div>


                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <div>
                                <label>Mobile Phone</label>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Your Mobile Phone">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile Phones is required" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div>
                                <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Your Password" TextMode="Password">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                                </asp:RequiredFieldValidator>

                            </div>

                          <%--  <div>
                                <label>Birth of Date</label>
                                <asp:TextBox ID="txtDateofbirth" runat="server" CssClass="form-control" placeholder="Enter Your Date of Birth">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Date of birth is required" ControlToValidate="txtDateofbirth" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                                </asp:RequiredFieldValidator>
                            </div>--%>

                              <div>
                                <label>Zip Code</label>
                                <asp:TextBox ID="txtZipcode" runat="server" CssClass="form-control" placeholder="Enter Your Zip Code">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Zip Code is required" ControlToValidate="txtZipcode" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtZipcode"
                                ErrorMessage="Zip Code must be of 5 digits" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                ValidationExpression="[0-9]{5}"></asp:RegularExpressionValidator>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row pl-4">
                    <div class="btn_box">
                        <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn btn-primary" OnClick="btnSignup_Click" />
                    </div>
                </div>


            </div>
        </div>
    </section>

</asp:Content>
