<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="rentx.View.Admin.Cars" %>
<%@ Import Namespace= "rentx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script>
          /*For disappearing alert message*/
          window.onload = function () {
              var seconds = 5;
              setTimeout(function () {
                  document.getElementById("<%=errormsg.ClientID %>").style.display = "none";
              }, seconds * 1000);
          };
      </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgCars.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">

        <div class="col">
            <h3>Manage Cars</h3>

        </div>
    </div>

    <div class="pcoded-inner=content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="errormsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <img src="../../Assets/Img/addcar.png" width="300" height="200" />
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Add Car</h4>
                                            <div>
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <label>Plate Number</label>
                                                        <div>
                                                            <asp:TextBox ID="txtPlateNo" runat="server" CssClass="form-control"
                                                                placeholder="Enter Plate Number"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                                                ErrorMessage="Plate number is required" SetFocusOnError="true" Display="Dynamic"
                                                                ControlToValidate="txtPlateNo">
                                                            </asp:RequiredFieldValidator>
                                                            <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Make</label>
                                                        <div>
                                                            <asp:TextBox ID="txtMake" runat="server" CssClass="form-control"
                                                                placeholder="Enter Make"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                                                ErrorMessage="Make is required" SetFocusOnError="true" Display="Dynamic"
                                                                ControlToValidate="txtMake">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Model</label>
                                                        <div>
                                                            <asp:TextBox ID="txtModel" runat="server" CssClass="form-control"
                                                                placeholder="Enter Model"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                                                ErrorMessage="Model is required" SetFocusOnError="true" Display="Dynamic"
                                                                ControlToValidate="txtModel">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Color</label>
                                                        <div>
                                                            <asp:TextBox ID="txtColor" runat="server" CssClass="form-control"
                                                                placeholder="Enter Color"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red"
                                                                ErrorMessage="Color is required" SetFocusOnError="true" Display="Dynamic"
                                                                ControlToValidate="txtColor">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <div>
                                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                                placeholder="Enter Description" TextMode="MultiLine"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red"
                                                                ErrorMessage="Description is required" SetFocusOnError="true" Display="Dynamic"
                                                                ControlToValidate="txtDescription">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Daily Price(₺)</label>
                                                        <div>
                                                            <asp:TextBox ID="txtDailyPrice" runat="server" CssClass="form-control"
                                                                placeholder="Enter Daily Price"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="reqFVIsActive" runat="server" ForeColor="Red"
                                                                ErrorMessage="Daily Price is required" SetFocusOnError="true" Display="Dynamic"
                                                                ControlToValidate="txtDailyPrice">
                                                            </asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="regexPrice" runat="server" ForeColor="Red"
                                                                ErrorMessage="Price must be in decimal" SetFocusOnError="true" Display="Dynamic"
                                                                ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ControlToValidate="txtDailyPrice">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>







                                                    <div class="form-group">
                                                        <label>Car Image</label>
                                                        <div>

                                                            <asp:FileUpload ID="fuCarImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                                        </div>
                                                    </div>

                                                     <div class="pb-5 form-check pl-4">
                                                        
                                                        <asp:CheckBox ID="cbIsAvailable" runat="server" Text="&nbsp; IsAvailable" CssClass="form-check-input" />
                                                  
                                                        </div>
                                                   
                                                     <div class="pb-5">
                                                       
                                                        
                                                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary"
                                                            OnClick="btnAdd_Click" />
                                                         &nbsp;     
                                                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                                            OnClick="btnClear_Click" CausesValidation="false" />
                                                    

                                                    </div>
                                                    <div>
                                                        <asp:Image ID="imgCars" runat="server" CssClass="img-thumbnail" />
                                                    </div>
                                                </div>
                                            </div>



                                        </div>

                                         <div class="col-sm-6 col-md-8 col-lg-8">
                                            <h4 class="sub-title">Car List</h4>
                                             <div class ="card-block table-bordered">
                                                 <div class="table-responsive">
                                                     <asp:Repeater ID="lCar" runat="server" OnItemCommand="lCar_ItemCommand" 
                                                         OnItemDataBound="lCar_ItemDataBound">
                                                         <HeaderTemplate>
                                                             <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                 <tr>
                                                                     <th class="table-plus">CarID</th>
                                                                     <th>Plate Number</th>
                                                                     <th>Make</th>
                                                                     <th>Model</th>
                                                                     <th>Color</th>
                                                                     <th>Description</th>
                                                                     <th>Daily Price</th>
                                                                     <th>Status</th>
                                                                     <th>Image</th>
                                                                     <th>Created Date</th>
                                                                     <th>Action</th>
                                                                 </tr>
                                                            </thead>
                                                                 <tbody>
                                                         </HeaderTemplate>
                                                         <ItemTemplate>
                                                             <tr>
                                                                 <td  class="table-plus"> <%#Eval("CarId") %></td>
                                                                 <td><%#Eval("PlateNo") %></td>
                                                                 <td><%#Eval("Make") %></td>
                                                                 <td><%#Eval("Model") %></td>
                                                                 <td><%#Eval("Color") %></td>
                                                                 <td><%#Eval("Description") %></td>
                                                                 <td><%#Eval("DailyPrice") %></td>
                                                                 <td>
                                                                  <asp:Label ID="lblStatus" runat="server"  Text='<%#Eval("isStatus") %>'></asp:Label>
                                                                 </td>
                                                                 <td>     <img width="80" src="<%# Utils.GetImage( Eval("ImageUrl")) %>" 
                                                                        alt='<%# Eval("ImageUrl") %>'> </td>
                                                                 <td><%#Eval("CreatedDate") %></td>
                                                                 <td>
                                                                     <asp:LinkButton ID="EditBttn" Text="Edit" runat="server" CssClass="badge badge-primary"
                                                                         CommandArgument='<%#Eval("CarId") %>' CommandName="edit" CausesValidation="false">
                                                                         </asp:LinkButton>
                                                                     <asp:LinkButton ID="DelBttn" runat="server" Text="Delete" CommandName="delete" CssClass="badge badge-danger"
                                                                      CommandArgument='<%#Eval("CarId") %>' OnClientClick="return confirm ('Are u sure?');" CausesValidation="false" >

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


                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>












    <!--  
   <div class="col-md-3">
  <label for="Plate Number" class="form-label">Plate Number</label>
  <input type="text" class="form-control" id="plateno" placeholder="Enter Plate Number" runat="server">
</div>
 <div class="col-md-3">
  <label for="Make" class="form-label">Make</label>
  <input type="text" class="form-control" id="make" placeholder="Enter Make" runat="server">
</div>
 <div class="col-md-3">
  <label for="Model" class="form-label">Model</label>
  <input type="text" class="form-control" id="model" placeholder="Enter Model" runat="server">
</div>
  <div class="col-md-3">
  <label for="Color" class="form-label">Color</label>
  <input type="text" class="form-control" id="color" placeholder="Enter Color" runat="server">
</div>
     <div class="col-md-3">
  <label for="Daily Price" class="form-label">Daily Price</label>
  <input type="number" class="form-control" id="dailyprice" placeholder="Enter Daily Price" runat="server">
</div>     
  
 <div class="col-md-3">
    <label class="visually-hidden" for="autoSizingSelect">Status Car : </label>
    <select  class="form-control" id="statuscar" runat="server">
      <option value="0">Available</option>
      <option value="1">Non Available</option>
   
    </select>

  </div>
    <button type="submit" class="btn btn-primary" runat="server">Add</button>
     <button type="submit" class="btn btn-primary" runat="server">Clear</button> -->
</asp:Content>
