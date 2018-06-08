<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../includes/linkhedader.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script>
    $(document).ready(function () {

        panel();



    });

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





</script>
<%@include file="../includes/menu1.jsp" %>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="">Admin</a>
            </li>
            <li class="breadcrumb-item active">Panel</li>
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
                <div class="card-deck">                   
                    <br>
                    <div class="card " >  
                        <div class="card-header">
                            <h4>Panel's</h4>
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


<div class="modal fade" id="addpanel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">New Panel</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group" >
                    <form action="savePanel" method="post"  enctype="multipart/form-data">
                        <label for="name">Area</label>
                        <select class="form-control" name="area">
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
                    <input type="text" class="form-control" id="nombre" name="nombre">
                </div>
                <div class="form-group ">
                    <label for="name">Image</label>
                    <input type="file" class="form-control" id="addimgarea" name="img">                       
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

<div class="modal fade" id="editpanel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Panel</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form action="updatePanel" method="post"  enctype="multipart/form-data">
                        <label for="name">Area</label>
                        <select class="form-control" id="areapanel" name="area">
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
                    <input type="text" class="form-control" name="nombre">
                    <input type="text" class="form-control" name="idpanel">
                </div>
                <div class="form-group ">
                    <label for="name">Image</label>
                    <input type="file" class="form-control" id="addimgarea" name="img">                       
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success" onclick="updatepanel()">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="deletepanel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Delete Location</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="deletePanel"  method="get" enctype="multipart/form-data"  >
                    <div class="form-group ">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="nombre" disabled>
                        <input type="hidden" class="form-control" name="idpanel">
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

    $('#editpanel').on('show.bs.modal', function (e) {
        var name = $(e.relatedTarget).data('nombre');
        var idarea = $(e.relatedTarget).data('idarea');
        var idpanel= $(e.relatedTarget).data('idpanel');

        $(e.currentTarget).find('input[name="nombre"]').val(name);
        $(e.currentTarget).find('input[name="idpanel"]').val(idpanel);
        $('#areapanel').val(idarea);

    });
    
     $('#deletepanel').on('show.bs.modal', function (e) {
        var name = $(e.relatedTarget).data('name');
        var idlocation = $(e.relatedTarget).data('idpanel');
        

        $(e.currentTarget).find('input[name="nombre"]').val(name);
        $(e.currentTarget).find('input[name="idpanel"]').val(idlocation);
        
    });
</script>  
<%@include file="../includes/fin.jsp" %> 


