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
<!-- <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/esm/popper-utils.js" ></script>
<link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.4.0/bootbox.min.js"></script> -->
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
		<h1>Eventos:</h1>
		
		<a href="EventosInsert.jsp"><button class="btnAgregar" id="btnInsertar">Añadir</button></a>
		<form action="EventosServlet" id="formEventos" method="get">			
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
	
	


	
	
	           $("td").filter(function(index) {
	            return $(this).html() == "0";
	          }).parent().addClass("commonRow");
	         // sessionStorage.setItem("activado", "0"); //Si algo no anda en cuanto a seleccionar un evento borrar esto.
	           //Antes seleccionaba todos los eventos la 1ra vez que se cargaba la pagina
	  		 $("td:contains(${sessionScope.activado})").parent().addClass("selectedRow");
	 		
	  		$(".btnEliminar").click(function(e) {
	  			/* if(done){
	  				
	  				done=false;
	  				return;
	  			} */
	  			
	  			e.preventDefault();
	  			var $row = $(this).closest("tr");    // Find the row
	 	  	    var $text = $row.find(".colClass").text(); // Find the text
	 	  	    $('#aux').val($row.find(".colClass").text());
	 	  	    $(this).attr('id')
	 	  	    $('#auction').val($(this).attr('id'));
	  			
	  			 bootbox.confirm({
		  			title: "Eliminar Evento",
		  		    message: "Eliminar Evento " + $text +"?" ,
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
		  		 	
			 	  		document.getElementById("formEventos").submit();
			 	  	    
			 	  	    /* 	done = true; // set flag
			 	  	    return true; */
			 	  	
			 	  //  $(this).trigger('click');
			 	  	    
			 	  		/*  document.getElementById("formEventos").submit();    
			 	  	  return true; */
		  		  		   
		  		    	}
		  		    	// else return false;
		  		    	
		  		    } 
		  		}); 
	  	
	  /* 		    var $row = $(this).closest("tr");    // Find the row
	  		    var $text = $row.find(".colClass").text(); // Find the text 
	  		    if(confirm("Eliminar Evento " + $text + "?")){
	  		    	 var $text = $row.find(".colClass").text(); // Find the text
	 	  		    $('#aux').val($row.find(".colClass").text());
	 	  		    $(this).attr('id')
	 	  		    $('#auction').val($(this).attr('id'));
	 	  			 
	 	  	

	  		    	return true;
	  		    }
	  		    else return false;
	  		 	  */
	  		  
	  		});


	        
});
		
		
		
		


</script>
	
</body>
</html>