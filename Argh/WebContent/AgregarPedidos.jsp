<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.ProductosData" %>
<%@ page import="entities.Producto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.MesasData" %>
<%@ page import="database.MozosData" %>
<%@ page import="entities.Mesas" %>
<%@ page import="entities.Mozo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evento</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script> 
  
  
<link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="div1" class="form">
<h2>Agregar Pedido para el evento: <% out.println(session.getAttribute("activado").toString()); %></h2>
<form class="formInsert" action="PedidosServlet" method="post" >
	
	  <%
		     	String nombre = request.getParameter("nombre");
		
			    String precio = request.getParameter("precio");
			    String stockIni = request.getParameter("stockIni");


		    	%>
		    	<label for='mesa'>  Mesa:  </label>
		    	<select name="mesa" id="mesa">
		    	<% 			
				MesasData md = new MesasData(); 
				ArrayList<Mesas> list = md.getAll(session.getAttribute("activado").toString());
				for(Mesas l: list){%>
		    	<option value=<%= l.getNroMesa()%> ><%= l.getNroMesa()%></option>
		    	
		    		
		    	
		    	
		    	<%}%>
		    	</select>
		    	
		    	
		    
		    	
	  			
	  			
	  			<label for='mozo'>  Mozo:  </label>
		    	<select name="mozo" id="mozo">	
		    	
		    	<% 			
				MozosData mod = new MozosData(); 
				ArrayList<Mozo> list2 = mod.getAll(session.getAttribute("activado").toString());
				for(Mozo l: list2){%>
				
				<option value=<%= l.getId()%>> <%= l.getNombre() %> <%= l.getApellido()%> </option>
	  			<%}%>
		    	</select>
			
<table id="tablaProductos" style="width=70%">
<caption style="font-size:25px;text-decoration: underline; margin: 0 0 6px">Productos</caption>
		
			<thead style="width=70%">
			<tr>
				<th>id</th>
				<th>Nombre</th>
				<th>Precio</th>
				<th colspan="2">Cantidad</th>
				
			</tr>
			</thead>
			<% 
			ProductosData pd = new ProductosData(); 
			ArrayList<Producto> list3 = pd.getAll(session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
			for(Producto l: list3){%>
				<tr class="iterate">
					<td class="colClass"><%= Integer.toString(l.getId())%></td>
					<td><%=l.getNombre()%></td>
					<td class="precio"><%= l.getPrecio()%></td>
					<td class="cantidad"> <input type="number" oninput="actualizar()" name="cantidad" value="0" min="0" max=<%= l.getStockIni() - l.getVendidos()%> title= <%= l.getStockIni() - l.getVendidos()%>></td>
				</tr>			
			<%}%>


			
			
</table>
<br >
<label >Total : $</label> <!-- style="float:right" -->
<label id="total" for="total" >0</label>
<br>
<input type="submit" value="Agregar" onclick="arrays()">
<input type="hidden" id="tot" name="tot">
<input type="hidden" id="idsHidden" name="idsHidden">
<input type="hidden" id="cantidadesHidden" name="cantidadesHidden">
<input type="hidden" id="evento" name="evento" value=<% out.println(session.getAttribute("activado").toString()); %>>

</form>

</div>

<script>
function arrays(){
 	var cantidades= new Array();
	var ids = new Array(); 
	var aux=0;
$("tr.iterate").each(function() {
		
     cantidades[aux]    = $(this).find(".cantidad input").val()
      ids[aux]   = $(this).find(".colClass").text();
      aux++;
   

      	
});
$("#idsHidden").val(ids);
$("#cantidadesHidden").val(cantidades);

	}
/* $("tr.iterate").each(function() {
		
        var quantity1 = $(this).find(".cantidad input").val(),
            quantity2 = $(this).find(".precio").text();
} */
/* 	 var form = $('<form action="PedidosServlet" method="post">' +
            '<input type="hidden" name="cantidades" value="'+cantidades+'">' +
    '</form>');
	 */

function actualizar(){
	var total=0;
	$("tr.iterate").each(function() {
		
        var quantity1 = $(this).find(".cantidad input").val(),
            quantity2 = $(this).find(".precio").text();
      
      //  alert(quantity1);
       // alert(quantity2); Funciona

        total = total + parseInt(quantity1) * parseInt(quantity2);
      	
});
	 $("#total").empty();
	$("#total").append(total);
	$("#tot").val(total);
}
/* function actualizar(element){
	  var cantidad = element.value;
	   //alert(cantidad);
	 //  alert($("#total").text()); parseInt($("#total").text()) +
	  var $row = $(element).closest("tr");
	  //alert($row.find(".precio").text());
	  var $aux=  parseInt($row.find(".precio").text()) * parseInt(cantidad);
	//  alert($aux);
	  $("#total").empty();
	$("#total").append($aux);
} */
/* $(":input").bind('keyup mouseup', function () {
      
}); */
	</script>
</body>
</html>