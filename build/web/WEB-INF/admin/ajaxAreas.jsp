<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="app.pojos.bean.DLEventos"%>
<%@page import="java.util.ArrayList"%>

<table id="datatable-responsive" border="1" class="table table-striped table-bordered " cellspacing="0" width="100%">
    <thead>

        <tr>
            <th >ID</th>
            <th >Name</th> 
            <th >locale</th> 
            <th colspan="2" >Options</th> 
        </tr>
    </thead>


    <tbody>

        <%
            ArrayList<DLAreas> lista = (ArrayList<DLAreas>) request.getAttribute("areas");

            String clase = "";
            for (DLAreas x : lista) {              
        %>
        <tr >
            <td ><%= x.getIdarea()%></td>
            <td ><%= x.getNombre()%></td> 
            <td ><img src="./Public/imagen/mapas/areas/<%= x.getImg()%>" width="100"></td> 
           
            <td> <button type="button" class="btn btn-primary pull-right" data-name="<%= x.getNombre()%>" data-idarea="<%= x.getIdarea()%>" data-imagen="<%= x.getImg()%>" data-toggle="modal" data-target="#editarea">Edit</button></td>
            <td> <button type="button" class="btn btn-danger pull-right" data-name="<%= x.getNombre()%>" data-idarea="<%= x.getIdarea()%>" data-toggle="modal" data-target="#deletearea">Delete</button></td>
        </tr>
        <% }%>
        <tr>
    </tbody>

</table>  