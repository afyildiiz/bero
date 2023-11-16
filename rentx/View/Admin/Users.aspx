<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="rentx.View.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="errormsg" runat="server" Visible="false"></asp:Label>
    <div class="col-sm-6 col-md-8 col-lg-8">
                                            <h4 class="sub-title">User List</h4>
                                             <div class ="card-block table-bordered">
                                                 <div class="table-responsive">
                                                     <asp:Repeater ID="UserV" runat="server" OnItemCommand="UserV_ItemCommand" 
                                                         OnItemDataBound="UserV_ItemDataBound">
                                                         <HeaderTemplate>
                                                             <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                 <tr>
                                                                     <th class="table-plus">UserId</th>
                                                                     <th>Name</th>
                                                                     <th>Mobile</th>
                                                                     <th>Email</th>
                                                                     <th>Address</th>
                                                                     <th>PostCode</th>
                                                                     <th>IdNumber</th>
                                                                     <th>CreatedDate</th>
                                                                     <th>Action</th>
                                                                 </tr>
                                                            </thead>
                                                                 <tbody>
                                                         </HeaderTemplate>
                                                         <ItemTemplate>
                                                             <tr>
                                                                 <td  class="table-plus"> <%#Eval("SrNo") %></td>
                                                                 <td><%#Eval("Name") %></td>
                                                                 <td><%#Eval("Mobile") %></td>
                                                                 <td><%#Eval("Email") %></td>
                                                                 <td><%#Eval("Address") %></td>
                                                                 <td><%#Eval("PostCode") %></td>
                                                                 <td><%#Eval("IdNumber") %></td>
                                                                 
                                                                 <td><%#Eval("CreatedDate") %></td>
                                                                 <td>
                                                                    
                                                                     <asp:LinkButton ID="DelBttn" runat="server" Text="Delete" CommandName="delete" CssClass="badge badge-danger"
                                                                      CommandArgument='<%#Eval("UserId") %>' OnClientClick="return confirm ('Are u sure?');" CausesValidation="false" >

                                                                     </asp:LinkButton>
                                                                 </td>
                                                             </tr>
                                                         </ItemTemplate>
                                                         <FooterTemplate>
                                                             </tbody>
                                                             </table>
                                                         </FooterTemplate>
                                                     </asp:Repeater>


                                                 </div>

                                             </div>
                                             </div>
</asp:Content>
