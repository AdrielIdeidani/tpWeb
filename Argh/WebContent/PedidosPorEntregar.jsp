<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.PedidosData" %>
<%@ page import="database.LineasPedidoData" %>
<%@ page import="entities.LineaPedido" %>
<%@ page import="entities.Pedido" %>
<%@ page import="database.MozosData" %>
<%@ page import="entities.Mozo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Por Entregar</title>
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
<form class="formInsert" action="PedidosServlet" method="get" id="formPedidos" >

<%-- <h2>Pedidos para el evento: <% out.println(session.getAttribute("activado").toString()); %></h2>
 --%>
<table id="tablaPorEntregar">
<!-- <caption style="font-size:25px;text-decoration: underline; margin: 0 0 6px">Pedidos</caption>
 -->			
			<thead style="width=70%">
			<tr>
				<th>Nro</th>
				<th>Mesa</th>
				<th>Mozo</th>
				<th>Total</th>
				<th>Entregar</th> 
				
			</tr>
			</thead>
			<% 
			PedidosData ped = new PedidosData(); 
			ArrayList<Pedido> listPed = ped.getAll(session.getAttribute("usuario").toString(),
					session.getAttribute("contra").toString(),	session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
			for(Pedido l: listPed){
			
			%>
		
				<tr class="collapse2" > <!-- class="collapse" -->
					<td class="colClass"><%= Integer.toString(l.getNroPedido())%></td>
					<td>Mesa: <%=l.getIdMesa()%></td>
					<% MozosData md= new MozosData();
					Mozo mozo= md.getOne(l.getIdMozo());
					
					%>
					
					<td><%= mozo.getApellido()  + ", " + mozo.getNombre()  %> </td> <!--  Aca tendria que traer el nombre y el apellido del mozo -->
					<td >$<%= l.getTotal()%></td>
					<td><button type="submit" id="btnEntregar" class="btnEntregar" name="btnEntregar"  value="<%= Integer.toString(l.getNroPedido())%>">Entregar</button>
 					</tr>		
				
			<%
				LineasPedidoData lpd= new LineasPedidoData();
				ArrayList<LineaPedido> listLinea = lpd.getAll(session.getAttribute("usuario").toString(),
						session.getAttribute("contra").toString(),Integer.toString(l.getNroPedido()));
				
				for(LineaPedido l2: listLinea){%>
				<tr class="comun">
					<td><input type="checkbox" name="entregado" id="entregado" class="entregado" > Entregado</td>
					<td colspan="2"> <%= l2.getCant() %> <%=l2.getProd().getNombre() %> </td>
					<td></td>
					<td></td>
		
					
				</tr>
		
				<%}%> 
			<%}%>

</table>
<input type="hidden" id="aux" name="aux" >
</form>
</div>
<script>
$(".btnEntregar").click(function(e) {
	 e.preventDefault();
   var $row = $(this).closest("tr");    // Find the row
   var $text = $row.find(".colClass").text(); // Find the text
   
   
   bootbox.confirm({
			title: "Entregar Pedido",
		    message: "Entregar Pedido " + $text +"?" ,
		    buttons: {
		      
		        cancel: {
		            label: 'Cancelar',
		            className: 'btn-danger '
		        },
		        confirm: {
		            label: 'Entregar',
		            className: 'btn-success '
		        }
		    },
		    callback: function (result) {
		    	
		    	if(result) {
				    $('#aux').val($row.find(".colClass").text());

	  		document.getElementById("formPedidos").submit();

		  		   
		    	}

	
}

});

});
$(document).ready(function(){
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

	
	$('.collapse2').click(function() { 
			$(this).nextUntil('tr.collapse').slideToggle(10);
					}	)

					$('input:checkbox').change(function () {
						//var $row= $(this).closest('tr .collapse');
						var $row= $(this).find('tr .collapse');
						//alert($row.find('.colClass').text());
		
						
					 });
 }) 
	



</script>

</body>
</html>