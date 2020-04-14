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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/esm/popper-utils.js" ></script>
 
<link href="Css/PageInPanel.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.4.0/bootbox.min.js"></script>
</head>
<body>

	<div id="div1" class="form">
	<h2 style="color:black; text-align:center; fonto-size:17px;"> Nuevo Pedido</h2>
	<!-- <div class="container" > -->
 

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog2">
      <div class="modal-content2">

        <div class="modal-header2">
          <h4 class="modal-title2">Agregar Pedido</h4>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
        <div class="modal-body2" >
         
         <label id="prodModal" for="prodModal" style=" position:absolute ; top: 10px; left: 10px" >-</label> <!-- " -->
 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer2">
       
         <label id="totalModal" for="totalModal" style="top:5px; left:5px; position:relative text-align: left " >0</label>
      	 <button type="button" onclick="entregar()" class="btn btn-primary" data-dismiss="modal">Agregar y Entregar</button>
      	  <button type="button" onclick="agregar()" class="btn btn-success" data-dismiss="modal">Agregar</button>
      	 <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
        </div>
        
      </div>
    </div>
<!--   </div> -->
  
</div>
	
	
	
<%-- <h2>Agregar Pedido para el evento: <% out.println(session.getAttribute("activado").toString()); %></h2> --%>
<form  action="PedidosServlet" id="formPedidos" method="post" >
	
	  <%
		     	String nombre = request.getParameter("nombre");
		
			    String precio = request.getParameter("precio");
			    String stockIni = request.getParameter("stockIni");


		    	%>
<!-- 		    	<label for='mesa'>  Mesa:  </label>
 -->		    	<select name="mesa" id="mesa">
		    	<option value='0'>Mesa</option>
		    	<% 			
				MesasData md = new MesasData(); 
				ArrayList<Mesas> list = md.getAll(session.getAttribute("usuario").toString(),
						session.getAttribute("contra").toString(),session.getAttribute("activado").toString());
				for(Mesas l: list){%>
		    	<option value=<%= l.getNroMesa()%> ><%= l.getNroMesa()%></option>
		    	
		    		
		    	
		    	
		    	<%}%>
		    	
		    	</select>
		    	
		    	
		    
		    	
	  			
	  			
<!-- 	  			<label for='mozo'>  Mozo:  </label>
 -->		    	<select name="mozo" id="mozo">	
		    	<option value='0'>Mozo</option>
		    	<% 			
				MozosData mod = new MozosData(); 
				ArrayList<Mozo> list2 = mod.getAll(session.getAttribute("usuario").toString(),
						session.getAttribute("contra").toString(),session.getAttribute("activado").toString());
				for(Mozo l: list2){%>
				
				<option value=<%= l.getId()%>> <%= l.getNombre() %> <%= l.getApellido()%> </option>
	  			<%}%>
		    	</select>
			
<table id="tablaProductos" style="width=70%">
<!-- <caption style="font-size:25px;text-decoration: underline; margin: 0 0 6px">Productos</caption>
 -->		
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
			ArrayList<Producto> list3 = pd.getAll(session.getAttribute("usuario").toString(),
					session.getAttribute("contra").toString(),session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
			for(Producto l: list3){%>
				<tr class="iterate">
					<td class="colClass"><%= Integer.toString(l.getId())%></td>
					<td class="colNombre"><%=l.getNombre()%></td>
					<td class="precio"><%= l.getPrecio()%></td>
					<td class="cantidad"> <input type="number" oninput="actualizar()" name="cantidad" value="0" min="0" max=<%= l.getStockIni() - l.getVendidos()%> title= <%= l.getStockIni() - l.getVendidos()%>></td>
				</tr>			
			<%}%>


			
			
</table>
<br >
<label >Total : $</label> <!-- style="float:right" -->
<label id="total" for="total"  >0</label>
<br>
<input type="submit" value="Agregar" class="btnAgregar" id="btnAgregar" data-toggle="modal" data-target="#myModal"><!-- onclick="arrays()" --> 
<input type="hidden" id="tot" name="tot">
<input type="hidden" id="idsHidden" name="idsHidden">
<input type="hidden" id="cantidadesHidden" name="cantidadesHidden">
<input type="hidden" id="agregarEntregar" name="agregarEntregar">
</form>

</div>

<script>

$(document).ready(function(){
	$("#tablaProductos tbody tr .colClass, #tablaProductos tbody tr .precio,#tablaProductos tbody tr .colNombre").click(function(){
		var $row = $(this).closest("tr"); 
		var cant= $row.find(".cantidad input").val();
		var maxim=$row.find(".cantidad input").attr("max");
		if(cant>=maxim){
			bootbox.confirm({
				
			    message: "Estaria agregando un producto que no tendria que haber segun stock. Continuar?",
			   
			    
			    buttons: {
			      
			        cancel: {
			            label: 'Cancelar',
			            className: 'btn-danger '
			        },
			        confirm: {
			            label: 'Agregar',
			            className: 'btn-success '
			        }
			      
			    },
			    callback: function (result) {
			    	
			    	if(result) {
			    		cant++;
						$row.find(".cantidad input").val(cant);
				 		actualizar();
			  		
			  	    

			    	}
			    	
			    } 
			});
				
				
			
			
			
		}
		else{
			cant++;
			$row.find(".cantidad input").val(cant);
	 		actualizar();
		}
		
		
		
	});
	
	
	
	
	
})

$("#btnAgregar").click(function(e) {
	
		e.preventDefault();
		arrays();
})


function agregar(){
	$("#agregarEntregar").val("0");
	document.getElementById("formPedidos").submit();
	
	
}
function entregar(){
	$("#agregarEntregar").val("1");
	document.getElementById("formPedidos").submit();
	
	
}
function arrays(){
	
	var mozoCombo= document.getElementById("mozo");
	var mozoSelected= mozoCombo.options[mozoCombo.selectedIndex].text;
	
	var mesaCombo =document.getElementById("mesa");
	var mesaSelected= mesaCombo.options[mesaCombo.selectedIndex].text;
	
	if(mesaSelected == 'Mesa'){
		bootbox.alert("Elija una mesa!");
	}
	else if(mozoSelected=='Mozo'){
		bootbox.alert("Asigne un mozo!");
	}
	
	else {
		
	
	
	
 	var cantidades= new Array();
	var ids = new Array(); 
	var aux=0;
	var conProductos=0;
	var prodM="Productos: \n";
$("tr.iterate").each(function() {
		var cant =$(this).find(".cantidad input").val();
   /*   cantidades[aux]    = $(this).find(".cantidad input").val()
      ids[aux]   = $(this).find(".colClass").text();
      aux++; */
			  cantidades[aux]    = cant;
		      ids[aux]   = $(this).find(".colClass").text();
		      aux++;
		      if (cant>0){
		    	var prodCant= $(this).find(".cantidad input").val();
		    	prodCant= prodCant.concat(" ");
		    	prodCant= prodCant.concat($(this).find(".colNombre").text());
		    	prodM=  prodM.concat(prodCant);
		    	prodM= prodM.concat("\n");
				conProductos=1;
	
}
		    

      	
});
$("#idsHidden").val(ids);
$("#cantidadesHidden").val(cantidades);
$("#prodModal").empty();
/* alert(prodM);
 */
 document.getElementById("prodModal").value= prodM;
$("#prodModal").append(prodM);
	
if(conProductos>0){
	
	


bootbox.confirm({
		title: "Agregar Pedido",
	    message: txtM,
	   
	    
	    buttons: {
	      
	        cancel: {
	            label: 'Cancelar',
	            className: 'btn-danger '
	        },
	        confirm: {
	            label: 'Agregar',
	            className: 'btn-success '
	        }
	      
	    },
	    callback: function (result) {
	    	
	    	if(result) {
	 	
	  		document.getElementById("formPedidos").submit();
	  	    

	    	}
	    } 
	}); 

}
else bootbox.alert("Agregue algun Producto!");
	}
}


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
	total= "$" + total;
	 $("#totalModal").empty();
		$("#totalModal").append(total);
		
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