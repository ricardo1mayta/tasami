<%@page import="app.pojos.bean.DLPanel"%>
<%@page import="app.pojos.bean.DLLocation"%>
<%@page import="app.pojos.bean.DLTiposignal"%>
<%@page import="app.pojos.bean.DLTipovariables"%>
<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../includes/linkhedader.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script>
    $(document).ready(function () {

        locationn();



    });

    function locationn() {
        $.ajax({
            method: "POST",
            url: "ajaxVariables",
            data: {}
        })
                .done(function (data) {
                    $("#reslocation").html(data)
                });
    }




</script>
<%@include file="../includes/menu1.jsp" %>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="">Admin</a>
            </li>
            <li class="breadcrumb-item active">Sensors</li>
        </ol>
        <div class="row">
            <div class="col-md-12">
                <% String msg = (String) request.getAttribute("msgsuccess");%>
                <% String msg2 = (String) request.getAttribute("msgError");%>


                <%if (msg != null) { %>
                <div class="alert alert-success">
                    <strong>Success! </strong><%
                        out.println(msg);
                    %>
                </div>
                <%  }%>
                <%if (msg2 != null) { %>
                <div class="alert alert-danger">
                    <strong>Alert! </strong><%
                        out.println(msg2);
                    %>
                </div>
                <%  }%>
                <div class="card " >  
                    <div class="card-header">
                        <h4>Sensor´s</h4>
                    </div>
                    <div class="card-body">
                        <div class="col-md-12">

                            <div class="col-md-12 table-responsive-lg"  id="reslocation">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
        </div>
    </div>
</div>
<!-- /.container-fluid-->
<!-- /.content-wrapper-->
<footer class="sticky-footer">
    <div class="container">
        <div class="text-center">
            <small>Copyright © Your Website 2018</small>
        </div>
    </div>
</footer>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fa fa-angle-up"></i>
</a>

<!-- Logout Modal-->


<div class="modal fade bd-example-modal-lg" id="editlocation">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Sensor</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body"> 

                <form class="form-horizontal" action="updateSensor" method="post" enctype="multipart/form-data">
                    <div class="container">
                        <div class="row">
                            <div class="form-group form-group-sm col-sm-12">
                                 <input type="hidden" class="form-control" id="" name="id">
                                <div class="row">
                                    <label for="first_name" class="col-sm-3 col-form-label">Device</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="first_name" name="name">
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="first_name" class="col-sm-3 col-form-label">Description</label>
                                    <div class="col-sm-9">
                                        <textarea  class="form-control" id="first_name" name="description">...</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="Street" class="col-sm-3 col-form-label">Image of Sensor</label>
                                    <div class="col-sm-9">
                                        <input type="file" class="form-control"  name="img2">         
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="last_name" class="col-sm-3 col-form-label">Message Normal</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="last_name"  name="message1">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="Street" class="col-sm-3 col-form-label">Message Active</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="Street"  name="message2">
                                    </div>
                                </div>
                            </div>          

                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="City" class="col-sm-3 col-form-label">Location</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="idlocatione" name="location">
                                            <option value="0">Select</option>
                                            <%
                                                ArrayList<DLLocation> lista22 = (ArrayList<DLLocation>) request.getAttribute("location");

                                                for (DLLocation x : lista22) {
                                            %>
                                            <tr>
                                            <option value="<%= x.getIdlocation()%>"><%= x.getNombre()%></option>
                                            </tr>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="Street" class="col-sm-3 col-form-label">Map of Location</label>
                                    <div class="col-sm-9">
                                        <input type="file" class="form-control"  name="img1">         
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="City" class="col-sm-3 col-form-label">Panel</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="idpanele" name="panel">
                                            <option value="0">Select</option>
                                            <%
                                                ArrayList<DLPanel> listappp = (ArrayList<DLPanel>) request.getAttribute("panels");

                                                for (DLPanel x : listappp) {
                                            %>
                                            <tr>
                                            <option value="<%= x.getIdpanel()%>"><%= x.getNombre()%></option>
                                            </tr>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="City" class="col-sm-3 col-form-label">Coditions</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="signal">
                                            <option value="0">Select</option>
                                            <%
                                                ArrayList<DLTiposignal> listas = (ArrayList<DLTiposignal>) request.getAttribute("tiposignal");

                                                for (DLTiposignal x : listas) {
                                            %>
                                            <tr>
                                            <option value="<%= x.getIdtipo()%>"><%= x.getNombre()%></option>
                                            </tr>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm col-sm-12">
                                <div class="row">
                                    <label for="City" class="col-sm-3 col-form-label">Type Device</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="tiposensor">
                                            <option value="0">Select</option>
                                            <%
                                                ArrayList<DLTipovariables> listav = (ArrayList<DLTipovariables>) request.getAttribute("tipovariable");

                                                for (DLTipovariables x : listav) {
                                            %>
                                            <tr>
                                            <option value="<%= x.getIdtipovariable()%>"><%= x.getNombre()%></option>
                                            </tr>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                

                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deletelocation">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Delete Location</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="deleteLocation"  method="get" enctype="multipart/form-data"  >
                    <div class="form-group ">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="nombre" disabled>
                        <input type="hidden" class="form-control" name="idlocation">
                    </div>                            
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Delete</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../includes/scrips.jsp" %>  
<script type="text/javascript">

    $('#editlocation').on('show.bs.modal', function (e) {
        var name = $(e.relatedTarget).data('name');
        var desc = $(e.relatedTarget).data('desc');
        var mes1 = $(e.relatedTarget).data('mes1');
        var mes2 = $(e.relatedTarget).data('mes2');
        var idpanel = $(e.relatedTarget).data('idpanel');
        var idlocation = $(e.relatedTarget).data('idlocation');
        var id = $(e.relatedTarget).data('id');

        $(e.currentTarget).find('input[name="name"]').val(name);
        $(e.currentTarget).find('textarea[name="description"]').val(desc);
        $(e.currentTarget).find('input[name="message1"]').val(mes1);
        $(e.currentTarget).find('input[name="message2"]').val(mes2);
        $(e.currentTarget).find('input[name="id"]').val(id);
        $("#idlocatione").val(idlocation);
        $("#idpanele").val(idpanel);
    });

    $('#deletelocation').on('show.bs.modal', function (e) {
        var name = $(e.relatedTarget).data('name');
        var idlocation = $(e.relatedTarget).data('idlocation');

        $(e.currentTarget).find('input[name="nombre"]').val(name);
        $(e.currentTarget).find('input[name="idlocation"]').val(idlocation);

    });



</script>  
<%@include file="../includes/fin.jsp" %> 


