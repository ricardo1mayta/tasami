<%@page import="app.pojos.bean.DLLocation"%>
<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="app.pojos.bean.DLEventos"%>
<%@page import="java.util.ArrayList"%>

<table id="datatable-responsive" border="1" class="table table-striped table-bordered " cellspacing="0" width="100%">
    <thead>

        <tr>
            <th >Nombre</th>
            <th >Area</th>
             <th >Img</th>
            <th colspan="3">Opciones</th>       

        </tr>
    </thead>


    <tbody>

        <%
            ArrayList<DLLocation> lista = (ArrayList<DLLocation>) request.getAttribute("location");

            String clase = "";
            for (DLLocation x : lista) {
        %>
        <tr >
            
            <td ><%= x.getNombre()%></td> 
            <td ><%= x.getNarea()%></td> 
            <td ><img src="./Public/imagen/mapas/location/<%= x.getImg()%>" width="100"></td> 

            <td> <button type="button" class="btn btn-primary pull-right" data-name="<%= x.getNombre()%>" data-idarea="<%= x.getIdarea()%>" data-idlocation="<%= x.getIdlocation()%>" data-toggle="modal" data-target="#editlocation">Edit</button></td>
            <td> <button type="button" class="btn btn-danger pull-right" data-name="<%= x.getNombre()%>" data-idlocation="<%= x.getIdlocation()%>" data-toggle="modal" data-target="#deletelocation">Delete</button></td>
       
        </tr>
        <% }%>
        <tr>
    </tbody>

</table>  