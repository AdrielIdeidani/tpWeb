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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/esm/popper-utils.js" ></script>
 
<link href="Css/PageInPanel.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.4.0/bootbox.min.js"></script>
</head>
<body>
<div>
		
		<a href="ProductosInsert.jsp"><button class="btnAgregar">Añadir</button></a>
		<form action="ProductosServlet" method="get" id="formProductos">			
			<table id="mytable">
			<caption class="captionComun">Productos</caption>
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
<%-- 			<input type="hidden" id="idEventoActivo" name="idEventoActivo" value=<% out.println(session.getAttribute("activado").toString()); %>>
 --%>		
			
		</form>
	</div>
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

$(".btnEliminar").click(function(e) {
		e.preventDefault();
		var $row = $(this).closest("tr");    // Find the row
	    var $text = $row.find(".colClass").text(); // Find the text
	    $('#aux').val($row.find(".colClass").text());
	    $(this).attr('id')
	    $('#auction').val($(this).attr('id'));
		 
	    bootbox.confirm({
  			title: "Eliminar Producto",
  		    message: "Eliminar Producto " + $text +"?" ,
  		    buttons: {
  		      
  		        cancel: {
  		            label: 'Cancelar',
  		            className: 'btn-danger '
  		        },
  		        confirm: {
  		            label: 'Eliminar',
  		            className: 'btn-success '
  		        }
  		    },
  		    callback: function (result) {
  		    	
  		    	if(result) {
  		 	
	 	  		document.getElementById("formProductos").submit();
  		    	}
  		    	
  		    } 
  		}); 
	  
	   
	 	
	});
$(document).ready(function(){
	
	//var done = false;
	
	const queryString = window.location.search;

	const urlParams = new URLSearchParams(queryString);

	const page_type = urlParams.get('control');
	
	if(page_type!==null){
		
		
	
		bootbox.alert({
		    size: "medium",
		    title: "ERROR!",
		    message: page_type,
		    className: "bootboxError" //No Funciona
		     
		})
	}
})


</script>
</html>