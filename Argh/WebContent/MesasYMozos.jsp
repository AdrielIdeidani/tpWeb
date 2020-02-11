<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="database.MesasData" %>
<%@ page import="database.MozosData" %>
<%@ page import="entities.Mesas" %>
<%@ page import="entities.Mozo" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mesas y Mozos</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="container">
<h2> Evento = <%out.println(session.getAttribute("activado").toString());%></h2>
<div class="floatLeft">
<form action="MesasYMozosServlet" method="post">
<input type="hidden" id="tabla" value="Mesas">

<table>
<caption>Mesas</caption>
		
			<thead>
			<tr>
				<th>Numero Mesa</th>
				<th>Capacidad</th>
				<th>Eliminar</th>
			</tr>
			</thead>
<% 			
			MesasData md = new MesasData(); 
			ArrayList<Mesas> list = md.getAll(session.getAttribute("activado").toString());
			for(Mesas l: list){%>
				<tr class="commonRow">
					<td class="colClass"><%= Integer.toString(l.getNroMesa())%> </td>
					<td><%= Integer.toString(l.getCapacidad())%> </td>
					<%-- <td><select>	<!--  NO FUNCIONAL, FALTA PROGRAMAR LA FUNCIONALIDAD  -->
					<option value=<%= l.getEstado()%>></option>
  					<option value="ocupada">Ocupada</option>
 					<option value="libre">Libre</option>
  					<option value="reservada">Reservada</option>
  					<option value="ocupadaReserva">Ocupada con Reserva</option>
</select>
					</td>  --%>
				<td><button type="submit" id="btnEliminarMesa" class="btnClass" value="<%=Integer.toString(l.getNroMesa())%>"  name="eliminar">X</button></td>
					
					
				</tr>
				<tr class="commonRow>">
				</tr>			
			<%}%>

</table>
			<input type="hidden" name ="auction" id="auction">
			<input type="hidden" name="aux" id="aux">
			<!-- <input type='hidden' name='auction' value='Modificar'> --> 
</form>
<br>
<a href="mesasInsert.jsp"><button class="btnAgregar" id="btnInsertar">Añadir</button></a>
</div>

<div class="floatRight">
<form action="MesasYMozosServlet" method="post">
<input type="hidden" id="tabla" value="Mozos">
<table>
<caption>Mozos</caption>
		
			<thead>
			<tr>
				<th>Id</th>
				<th>Nombre y Apellido</th>
				<th>Eliminar</th>
			</tr>
			</thead>
<% 			
			MozosData mod = new MozosData(); 
			ArrayList<Mozo> list2 = mod.getAll(session.getAttribute("activado").toString());
			for(Mozo l: list2){%>
				<tr class="commonRow">
					<td class="colClass2"><%= Integer.toString(l.getId())%> </td>
					<td><%= l.getNombre()%> <%= l.getApellido()%> </td>
					<td><button type="submit" id="btnEliminarMozo" class="btnClass2" value="<%=Integer.toString(l.getId())%>"  name="eliminar">X</button></td>
					
				</tr>
				<tr class="commonRow>">
				</tr>			
			<%}%>
			
</table>	
<input type="hidden" name="auction2" id="auction2">
 <input type="hidden" name="aux2" id="aux2">
<!-- <input type='hidden' name='auction' value='Modificar'>
 --></form>
<br>
<a href="mozosInsert.jsp"><button class="btnAgregar" id="btnInsertar">Añadir</button></a>

</div>
<input type="hidden" name="aux" id="aux">
<input type="hidden" name ="auction" id="auction">
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){

$(".btnClass").click(function() { 
    var $row = $(this).closest("tr");    // Find the row
    var $text = $row.find(".colClass").text(); // Find the text
    if(confirm("Eliminar Mesa " + $text + "?")){
    	  $('#aux').val($row.find(".colClass").text());
    	    $(this).attr('id')
    	    $('#auction').val($(this).attr('id'));
	    	return true;
	    }
	    else return false;
  

});
$(".btnClass2").click(function() { 
    var $row = $(this).closest("tr");    // Find the row
    var $text = $row.find(".colClass2").text(); // Find the text
    if(confirm("Eliminar Mozo " + $text + "?")){
		    $('#aux').val($row.find(".colClass").text());
		   	$('#aux2').val($row.find(".colClass2").text());
		    $(this).attr('id')
		    $('#auction2').val($(this).attr('id'));
	    	return true;
	    }
	    else return false;


});
	
});

</script>
</html>