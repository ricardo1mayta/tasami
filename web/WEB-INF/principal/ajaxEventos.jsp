<%@page import="app.pojos.bean.DLEventos"%>
<%@page import="java.util.ArrayList"%>

<table id="datatable-responsive" border="1" class="table table-striped table-bordered " cellspacing="0" width="100%">
    <thead>

        <tr>

            <th colspan="2">ID</th> 
            <th>Conditions</th>  
             <th >Device</th>
             
            <th >Type Device</th>
            <th >Incio</th>
            <th>Fin</th> 
            
                     
            <th >Panel</th>
            <th >Location</th>
            <th >Option</th>


        </tr>
    </thead>


    <tbody>

        <%
            ArrayList<DLEventos> lista = (ArrayList<DLEventos>) request.getAttribute("listaeventos");

            String clase = "";
            for (DLEventos x : lista) {
        if (x.getEstado().equals("1") ) { %>
    <script>
        var audio = document.getElementById("audio");
        audio.play();
    </script><%
            if (x.getIdtipoestados()==1 || x.getIdtipoestados()==3){
            clase = " parpadea2 bg-red2";
            }
             if (x.getIdtipoestados()==2){
            clase = " parpadea bg-warning";
            }
             if ( x.getIdtipoestados()==3){
            clase = " parpadea bg-purpure";
            }          
            
        } else {
            clase = "bg-info";
        }
    %>
    <tr >

        <td ><div class=" circulo <%=clase%>"></div></td>
        <td ><%= x.getIdvariable()%></td> 
        <td ><%=x.getTipoestado()%></td>
        <td ><%=x.getNombre()%></td>
        <td ><%=x.getTipovariable()%></td>
        <td ><%= x.getFechainicio()%></td>   
        <td ><%= x.getFechafin()%></td>   
        
        

        <td ><%=x.getPanel()%></td>
        <td ><%=x.getUbicacion()%></td>
        <td >
            <button class="btn btn-dark" data-toggle="modal" data-target="#myModal" >ver</button>

        </td>



    </tr>
    <% }%>
     <%
            ArrayList<DLEventos> lista2 = (ArrayList<DLEventos>) request.getAttribute("listaeventos2");

            
            for (DLEventos x : lista2) {
        
    %>
    <tr >

        <td ><div class=" circulo bg-success"></div></td>
        <td ><%= x.getIdvariable()%></td> 
        <td >NORMAL</td>
        <td ><%=x.getNombre()%></td>
        <td ><%=x.getTipovariable()%></td>
        <td ><%= x.getFechainicio()%></td>   
        <td ><%= x.getFechafin()%></td>   
        
        

        <td ><%=x.getPanel()%></td>
        <td ><%=x.getUbicacion()%></td>
        <td >
            <button class="btn btn-dark" data-toggle="modal" data-target="#myModal" >ver</button>

        </td>



    </tr>
    <% }%>
    <tr>
        </tbody>

</table>  