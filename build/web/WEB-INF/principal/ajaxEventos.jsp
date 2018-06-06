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
            ArrayList<DLEventos> lista = (ArrayList<DLEventos>) request.getAttribute("listaeventos");

            String clase = "";
            for (DLEventos x : lista) {
                if (x.getEstado2().equals("Alarma")) { %>
    <script>
        var audio = document.getElementById("audio");
        audio.play();
    </script><%
                clase = " parpadea2 bg-danger";
            } else if (x.getEstado2().equals("Error")) {
                clase = " parpadea bg-warning";
            } else {
                clase = "bg-success";
            }
    %>
    <tr >

        <td ><div class=" circulo <%=clase%>"></div></td>
        <td ><%= x.getIdvariable()%></td>            
        <td ><%= x.getFechainicio()%></td>   
        <td ><%= x.getFechafin()%></td>   
        <td ><%=x.getEstado()%></td>
        <td >
            <button class="btn btn-dark" data-toggle="modal" data-target="#myModal" >ver</button>

        </td>



    </tr>
    <% }%>
    <tr>
        </tbody>

</table>  