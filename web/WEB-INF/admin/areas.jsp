<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../includes/linkhedader.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script>
    $(document).ready(function () {
        areas();




    });
    function areas() {
        $.ajax({
            method: "POST",
            url: "ajaxAreas",
            data: {}
        }).done(function (data) {
            $("#resareas").html(data)
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
                <div class="card-deck">


                    <div class="card " >  
                        <div class="card-header">
                            <h4>Add, Edit and Delete Area </h4>
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
                        <form action="saveArea"  method="post" enctype="multipart/form-data"  >
                            <div class="form-group ">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="addnomarea" name="nombre">                       
                            </div>
                            <div class="form-group ">
                                <label for="name">Imagelabel</label>
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

        <div class="modal fade" id="editarea">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edti Area</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="updateArea"  method="post" enctype="multipart/form-data"  >
                            <div class="form-group ">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" name="nombre">
                                <input type="hidden" class="form-control" name="idarea">
                            </div>


                            <div class="form-group ">
                                <label for="name">Image</label>
                                <input type="file" class="form-control" id="addimgarea" name="img">                       
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">Update</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
         <div class="modal fade" id="deletearea">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Area</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="deleteArea"  method="get" enctype="multipart/form-data"  >
                            <div class="form-group ">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" name="nombre" disabled>
                                <input type="hidden" class="form-control" name="idarea">
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
        <script >
            $('#editarea').on('show.bs.modal', function (e) {
                var name = $(e.relatedTarget).data('name');
                var idarea = $(e.relatedTarget).data('idarea');


                $(e.currentTarget).find('input[name="nombre"]').val(name);
                $(e.currentTarget).find('input[name="idarea"]').val(idarea);

            });
               $('#deletearea').on('show.bs.modal', function (e) {
                var name = $(e.relatedTarget).data('name');
                var idarea = $(e.relatedTarget).data('idarea');


                $(e.currentTarget).find('input[name="nombre"]').val(name);
                $(e.currentTarget).find('input[name="idarea"]').val(idarea);

            });

        </script>  
        <%@include file="../includes/fin.jsp" %> 


