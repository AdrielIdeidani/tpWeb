<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="database.ProductosData" %>
<%@ page import="entities.Producto" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Productos</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />
</head>
<body>

		<h1 id="titulo">Productos para el Evento <% out.println(session.getAttribute("activado").toString()); %>:</h1>
		<a href="ProductosInsert.jsp"><button class="btnAgregar">Añadir</button></a>
		<form action="ProductosServlet" method="get">			
			<table id="mytable">
			<thead>
			<tr>
			
				<th>Id</th>
				<th>Nombre</th>
				<th>Precio</th>
				<th>Stock Actual</th>
			</tr>
			</thead>
			<% 
			ProductosData pd = new ProductosData(); 
			ArrayList<Producto> list = pd.getAll(session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
			for(Producto l: list){%>
				<tr>
					<td class="colClass"><%= Integer.toString(l.getId())%></td>
					<td><%=l.getNombre()%></td>
					<td><%= l.getPrecio()%></td>
					<td><%= l.getStockIni() - l.getVendidos()%></td>
					<td><a href="ProductosInsert"><button type="submit"  id="btnModificar" class="btnClass" value="<%=Integer.toString(l.getId())%>" name="modificar">Modificar</button></a></td>
					<td><button type="submit" id="btnEliminar" class="btnEliminar" value="<%=Integer.toString(l.getId())%>" name="eliminar">Eliminar</button></td>
					
				</tr>			
			<%}%>
			
			</table>
			<input type="hidden" id="auction" name="auction" >
			<input type="hidden" id="aux" name="aux" >
			<input type="hidden" id="idEventoActivo" name="idEventoActivo" value=<% out.println(session.getAttribute("activado").toString()); %>>
			
			
		</form>
	
</body>
<script type="text/javascript">

// $("#titulo").text("Productos para el evento " + ${sessionScope.activado} + ": ");

$(".btnClass").click(function() {
    var $row = $(this).closest("tr");    // Find the row
    var $text = $row.find(".colClass").text(); // Find the text
    $('#aux').val($row.find(".colClass").text());
	$(this).attr('id') //Esta bien esto?
    $('#auction').val($(this).attr('id')); //Le asigna a la variable auction el valor de id del boton asociado. Sirve para saber si fue llamado por eliminar o modificar
    //alert($text);
   // alert($row.find(".colClass").text());
});

$(".btnEliminar").click(function() {

		var $row = $(this).closest("tr");    // Find the row
	    var $text = $row.find(".colClass").text(); // Find the text
	    $('#aux').val($row.find(".colClass").text());
	    $(this).attr('id')
	    $('#auction').val($(this).attr('id'));
		 
	    var $row = $(this).closest("tr");    // Find the row
	    var $text = $row.find(".colClass").text(); // Find the text
	    if(confirm("Eliminar Producto " + $text + "?")){
		    $('#aux').val($row.find(".colClass").text());

	    	return true;
	    }
	    else return false;
	 	
	});
	
})

</script>
</html>