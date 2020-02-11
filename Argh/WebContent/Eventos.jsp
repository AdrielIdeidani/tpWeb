<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.EventoData" %>
<%@ page import="entities.Evento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Eventos</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
  
<link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />

</head>
<body>
	<div>
		<h1>Eventos:</h1>
		<a href="EventosInsert.jsp"><button class="btnAgregar" id="btnInsertar">Añadir</button></a>
		<form action="EventosServlet" method="get">			
			<table id="mytable">
			<thead>
			<tr>
			
				<th>Id</th>
				<th>Fecha</th>
				<th>Nombre</th>
				<th colspan="3"></th>
			</tr>
			</thead>
			<% 
			EventoData ed = new EventoData(); 
			ArrayList<Evento> list = ed.getAll();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			for(Evento l: list){%>
				<tr class="commonRow">
					<td class="colClass"><%= Integer.toString(l.getId())%></td>
					<td><%= sdf.format(l.getFecha())%></td>
					<td><%= l.getDesc()%></td>
					<td><button type="submit"  id="btnModificar" class="btnClass" value="<%=Integer.toString(l.getId())%>"  name="modificar">Modificar</button></td>
					<td><button type="submit" id="btnEliminar" class="btnEliminar" value="<%=Integer.toString(l.getId())%>"  name="eliminar" >Eliminar</button></td>
					<td><button type="submit" id="btnActivar" class="btnClass" value="<%=Integer.toString(l.getId())%>"  name="activar">Activar</button></td>
				</tr>			
			<%}%>
			
			</table>
			<input type="hidden" id="auction" name="auction">
			<input type="hidden" id="aux" name="aux" >
	
			
		</form>
	</div>


<script>


	$(".btnClass ").click(function() { 
    var $row = $(this).closest("tr");    // Find the row
    var $text = $row.find(".colClass").text(); // Find the text
    $('#aux').val($row.find(".colClass").text());
    $(this).attr('id')
    $('#auction').val($(this).attr('id'));

});
	
	
$(document).ready(function(){
	           $("td").filter(function(index) {
	            return $(this).html() == "0";
	          }).parent().addClass("commonRow");
	           sessionStorage.setItem("activado", "0"); //Si algo no anda en cuanto a seleccionar un evento borrar esto.
	           //Antes seleccionaba todos los eventos la 1ra vez que se cargaba la pagina
	  		 $("td:contains(${sessionScope.activado})").parent().addClass("selectedRow");
	 		
	  		$(".btnEliminar").click(function() {
	  			 var $row = $(this).closest("tr");    // Find the row
	  		    var $text = $row.find(".colClass").text(); // Find the text
	  		    $('#aux').val($row.find(".colClass").text());
	  		    $(this).attr('id')
	  		    $('#auction').val($(this).attr('id'));
	  			 
	  		    var $row = $(this).closest("tr");    // Find the row
	  		    var $text = $row.find(".colClass").text(); // Find the text
	  		    if(confirm("Eliminar Evento " + $text + "?")){
	  			    $('#aux').val($row.find(".colClass").text());

	  		    	return true;
	  		    }
	  		    else return false;
	  		 	
	  		});


	         });
	        
		
		
		
		


</script>
	
</body>
</html>