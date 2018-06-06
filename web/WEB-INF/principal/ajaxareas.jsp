<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="app.pojos.bean.DLEventos"%>
<%@page import="java.util.ArrayList"%>

<table id="datatable-responsive" border="1" class="table table-striped table-bordered " cellspacing="0" width="100%">
    <thead>

        <tr>
            
            <th colspan="3">Variable</th> 
            <th >Incio</th>
            <th>Fin</th> 
            <th >Estado</th>


        </tr>
    </thead>


    <tbody>

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
        <tr >
            
           
            <td ><%= x.getIdarea()%></td>
            <td ></td>
            <td ><%= x.getNombre()%></td>   
         



        </tr>
        <% }%>
        <tr>
    </tbody>

</table>  