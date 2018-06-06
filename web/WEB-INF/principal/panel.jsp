
<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../includes/linkhedader.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js">
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
            <div class="col-12">
                <h1>Welcome</h1>
                

                <div class="card-deck">
                     <%
                            ArrayList<DLAreas> lista = (ArrayList<DLAreas>) request.getAttribute("areas");

                            String clase = "";
                            for (DLAreas x : lista) {/*
                                if (x.getEstado2().equals("Alarma")) {
                                    clase = " parpadea2 bg-danger";
                                } else if (x.getEstado2().equals("Error")) {
                                    clase = " parpadea bg-warning";
                                } else {
                                    clase = "bg-success";
                                }*/
                        %>
                   
                    <div class="card bg-default">
                        <div class="card-body text-center">
                            <a href="User"> <img class="card-img-top" src="./Public/img/demo.jpg" alt="Card image"></a>
                            <p class="card-text"><%= x.getNombre()%></p>
                        </div>
                    </div>
                    
                    <% }%>
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




    <%@include file="../includes/scrips.jsp" %>  

    <%@include file="../includes/fin.jsp" %> 


