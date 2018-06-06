<%@page import="app.pojos.bean.DLDispositivos"%>
<%@page import="app.pojos.bean.DLLocation"%>
<%@page import="app.pojos.bean.DLAreas"%>
<%@page import="app.pojos.bean.DLEventos"%>
<%@page import="java.util.ArrayList"%>

<table id="datatable-responsive" border="1" class="table table-striped table-bordered " cellspacing="0" width="100%">
    <thead>

        <tr>
            <th >ID</th>
            <th >NAME</th>
            <th >DESCRIPTION</th>
            <th >MESSAGE ONE</th>
            <th >MESSAGE TWO</th>
            <th >LOCATION</th>
            <th >PANEL</th>
            <th >USER EDIT</th>
            <th >TYPE SIGNAL</th>
            <th >TYPE SENSOR</th>
            <th >Img1</th>
            <th >Img2</th>
            <th colspan="3">Opciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            ArrayList<DLDispositivos> lista = (ArrayList<DLDispositivos>) request.getAttribute("variables");

            String clase = "";
            for (DLDispositivos x : lista) {
        %>
        <tr >            
            <td ><%=x.getIdvariable()%></td> 
            <td ><%= x.getNombre()%></td> 
            <td ><%=x.getDescripcion()%></td> 

            <td ><%=x.getMensage0()%></td> 
            <td ><%= x.getMensage1()%></td> 
            <td ><%=x.getUbicacion()%></td> 
            <td ><%= x.getPanel()%></td> 
            <td ><%= x.getUsuario()%></td> 
            <td ><%= x.getTipoestado()%></td> 
            <td ><%= x.getTipo()%></td> 

            <td ><img src="./Public/imagen/mapas/location/<%= x.getImg1()%>" width="100"></td>
            <td ><img src="./Public/imagen/mapas/location/<%= x.getImg2()%>" width="100"></td>
            <td> <button type="button" class="btn btn-primary pull-right" data-name="<%= x.getNombre()%>" data-desc="<%= x.getDescripcion()%>" data-mes2="<%= x.getMensage1()%>" data-mes1="<%= x.getMensage0()%>" 
                         data-idlocation="<%= x.getIdubicacion()%>" data-idpanel="<%= x.getIdpanel()%>" data-idtipo="<%= x.getIdtipo()%>"  data-toggle="modal" data-target="#editlocation">Edit</button></td>
            <td> <button type="button" class="btn btn-danger pull-right" data-name="<%= x.getNombre()%>" data-idlocation="<%= x.getCreado()%>" data-toggle="modal" data-target="#deletelocation">Delete</button></td>

        </tr>
        <% }%>
        <tr>
    </tbody>

</table>  