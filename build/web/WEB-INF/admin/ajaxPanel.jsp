<%@page import="app.pojos.bean.DLPanel"%>
<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="app.pojos.bean.DLEventos"%>
<%@page import="java.util.ArrayList"%>

<table id="datatable-responsive" border="1" class="table table-striped table-bordered " cellspacing="0" width="100%">
    <thead>

        <tr>
            <th >Nombre</th>
            <th colspan="3">Opciones</th>       

        </tr>
    </thead>


    <tbody>

        <%
            ArrayList<DLPanel> lista = (ArrayList<DLPanel>) request.getAttribute("panels");

            String clase = "";
            for (DLPanel x : lista) {              
        %>
        <tr >
            <td ><%= x.getIdpanel()%></td>
            <td ><%= x.getNombre()%></td> 
            <td ><%= x.getNarea()%></td> 
           <td ><img src="./Public/imagen/mapas/panels/<%= x.getImg()%>" width="100"></td> 
            <td> <button type="button" class="btn btn-primary pull-right" data-nombre="<%= x.getNombre()%>" data-idpanel="<%= x.getIdpanel()%>" data-idarea="<%= x.getIdarea()%>" data-toggle="modal" data-target="#editpanel">Edit</button></td>
            <td> <button type="button" class="btn btn-danger pull-right" data-name="<%= x.getNombre()%>" data-idpanel="<%= x.getIdpanel()%>" data-toggle="modal" data-target="#deletepanel">Delete</button></td>
       
        </tr>
        <% }%>
        <tr>
    </tbody>

</table>  