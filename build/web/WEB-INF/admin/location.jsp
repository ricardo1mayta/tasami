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
            url: "ajaxLocation",
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
                <a href="index.html">Monitoreo</a>
            </li>
            <li class="breadcrumb-item active">Eventos</li>
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

<div class="modal fade" id="addlocation">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">New Location</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form action="saveLocation" method="post"  enctype="multipart/form-data">
                        <label for="name">Area</label>
                        <select class="form-control" name="area">
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
                    <input type="text" class="form-control" name="nombre">
                </div>
                <div class="form-group ">
                    <label for="name">Imagelabel</label>
                    <input type="file" class="form-control"  name="img">                       
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


<div class="modal fade" id="editlocation">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Location</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form action="updateLocation" method="post"  enctype="multipart/form-data">
                        <label for="name">Area</label>
                        <select class="form-control" id="arealocatione" name="area">
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
                    <input type="text" class="form-control"  name="nombre" >
                    <input type="hidden" class="form-control"  name="idlocation" >
                </div>
                <div class="form-group ">
                    <label for="name">Imagelabel</label>
                    <input type="file" class="form-control"  name="img">                       
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
        var idlocation = $(e.relatedTarget).data('idlocation');
        var idarea = $(e.relatedTarget).data('idarea');

        $(e.currentTarget).find('input[name="nombre"]').val(name);
        $(e.currentTarget).find('input[name="idlocation"]').val(idlocation);
        $("#arealocatione").val(idarea);
    });
    
    $('#deletelocation').on('show.bs.modal', function (e) {
        var name = $(e.relatedTarget).data('name');
        var idlocation = $(e.relatedTarget).data('idlocation');
        

        $(e.currentTarget).find('input[name="nombre"]').val(name);
        $(e.currentTarget).find('input[name="idlocation"]').val(idlocation);
        
    });



</script>  
<%@include file="../includes/fin.jsp" %> 


