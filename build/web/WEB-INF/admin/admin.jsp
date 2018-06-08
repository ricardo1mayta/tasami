<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../includes/linkhedader.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script>
    $(document).ready(function () {
        areas();
        locationn();
        panel();
        
        
    
    });
    function areas() {
        $.ajax({
            method: "POST",
            url: "ajaxAreas",
            data: {}
        })
                .done(function (data) {
                    $("#resareas").html(data)
                });
    }
    function locationn() {
        $.ajax({
            method: "POST",
            url: "ajaxLocation",
            data: {}
        })
                .done(function (data) {
                    $("#reslocation").html(data)
                });
    }
    
    function panel() {
        $.ajax({
            method: "POST",
            url: "ajaxPanel",
            data: {}
        })
                .done(function (data) {
                    $("#respanel").html(data)
                });
    }
    function saveareasd() {
        var form = $("#dfmraddarea").serialize();
         var formData = new FormData($("#fmraddarea")[0]);
         var ruta = "saveArea";
            $.ajax({
                url: ruta,
                type: "GET",
                data: formData,
                contentType: false,
                processData: false,
                success: function(datos)
                {
                    alert(datos);
                    areas();
                    $('#addarea').modal('hide');
                    //$("#respuesta").html(datos);
                }
            });
    }
    function savelocationn() {
        $.ajax({
            method: "POST",
            url: "ajaxLocation",
            data: {}
        })
                .done(function (data) {
                    $("#reslocation").html(data)
                });
    }
    
     function savepanel() {
        $.ajax({
            method: "POST",
            url: "ajaxPanel",
            data: {}
        })
                .done(function (data) {
                    $("#respanel").html(data)
                });
    }
    function updateareas() {
        alert()
        $.ajax({
            method: "POST",
            url: "saveAreas",
            data: {}
        })
                .done(function (data) {
                    $("#resareas").html(data)
                });
    }
    function updatelocationn() {
        alert()
        $.ajax({
            method: "POST",
            url: "saveLocation",
            data: {}
        })
                .done(function (data) {
                    $("#reslocation").html(data)
                });
    }
    
     function updatepanel() {
         alert()
        $.ajax({
            method: "POST",
            url: "savePanel",
            data: {}
        })
                .done(function (data) {
                    $("#respanel").html(data)
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
            <li class="breadcrumb-item active">Admin</li>
        </ol>
        <div class="row">
            <div class="col-md-12">
                <h1>Welcome</h1>
                <div class="card-deck">


                    <div class="card " >  
                        <div class="card-header">
                            <h4>Area</h4>
                        </div>
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="col-md-12">
                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#addarea">Add +</button>

                                </div>

                                <br>
                                <div class="col-md-12" id="resareas">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card " >  
                        <div class="card-header">
                            <h4>Location</h4>
                        </div>
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="col-md-12">

                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#addlocation">Add +</button>
                                </div>

                                <br>
                                <div class="col-md-12" id="reslocation">

                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <br>
                 <div class="card-deck">


                    <div class="card " >  
                        <div class="card-header">
                            <h4>Panel</h4>
                        </div>
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="col-md-12">
                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#addpanel">Add +</button>

                                </div>

                                <br>
                                <div class="col-md-12" id="respanel">

                                </div>
                            </div>
                        </div>
                    </div>



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
        <div class="modal fade" id="addarea">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">New Area</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <div class="modal-body">
                        <form action="saveArea"  method="get" enctype="multipart/form-data"  >
                        <div class="form-group ">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="addnomarea" name="nombre">                       
                        </div>
                        <div class="form-group ">
                            <label for="name">Imagelabel>
                            <input type="file" class="form-control" id="addimgarea" name="img">                       
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" >Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addlocation">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">New Location</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">

                            <label for="name">Area</label>
                            <select class="form-control">
                                <option>Select</option>
                                <%
                                    ArrayList<DLAreas> lista = (ArrayList<DLAreas>) request.getAttribute("areas");

                                    String clase = "";
                                    for (DLAreas x : lista) {
                                %>
                                <tr>
                                <option value="<%= x.getIdarea()%>"><%= x.getNombre()%></option>
                                </tr>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addpanel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">New Panel</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" >

                            <label for="name">Area</label>
                            <select class="form-control">
                                <option>Select</option>
                                <%
                                    ArrayList<DLAreas> lista2 = (ArrayList<DLAreas>) request.getAttribute("areas");

                                    for (DLAreas x : lista2) {
                                %>
                                <tr>
                                <option value="<%= x.getIdarea()%>"><%= x.getNombre()%></option>
                                </tr>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="editarea">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edti Area</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group ">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" name="name">                       
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" onclick="updateareas()">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="editlocation">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Location</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">

                            <label for="name">Area</label>
                            <select class="form-control" id="arealocation" name="area">
                                <option>Select</option>
                                <%
                                    ArrayList<DLAreas> lista22 = (ArrayList<DLAreas>) request.getAttribute("areas");

                                    for (DLAreas x : lista22) {
                                %>
                                <tr>
                                <option value="<%= x.getIdarea()%>"><%= x.getNombre()%></option>
                                </tr>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control"  name="name" >
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" onclick="updatelocationn()">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="editpanel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Panel</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">

                            <label for="name">Area</label>
                            <select class="form-control" id="areapanel" name="name">
                                <option>Select</option>
                                <%
                                    ArrayList<DLAreas> lista23 = (ArrayList<DLAreas>) request.getAttribute("areas");

                                    for (DLAreas x : lista23) {
                                %>
                                <tr>
                                <option value="<%= x.getIdarea()%>"><%= x.getNombre()%></option>
                                </tr>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" onclick="updatepanel()">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../includes/scrips.jsp" %>  
        <script type="text/javascript">
            $('#editarea').on('show.bs.modal', function (e) {
                var name = $(e.relatedTarget).data('name');
                $(e.currentTarget).find('input[name="name"]').val(name); 
            });
             $('#editlocation').on('show.bs.modal', function (e) {
                var name = $(e.relatedTarget).data('name');
                var idarea = $(e.relatedTarget).data('idarea');

                $(e.currentTarget).find('input[name="name"]').val(name);
                 $('#arealocation').val(idarea);
            });
             $('#editpanel').on('show.bs.modal', function (e) {
               var name = $(e.relatedTarget).data('name');
                var idarea = $(e.relatedTarget).data('idarea');

                $(e.currentTarget).find('input[name="name"]').val(name);
                 $('#areapanel').val(idarea);

            });
        </script>  
        <%@include file="../includes/fin.jsp" %> 


