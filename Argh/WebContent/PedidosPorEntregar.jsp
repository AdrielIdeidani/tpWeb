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
 <link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />
  
</head>
<body>
<div id="div1" class="form"> 
<form class="formInsert" action="PedidosServlet" method="get" >

<%-- <h2>Pedidos para el evento: <% out.println(session.getAttribute("activado").toString()); %></h2>
 --%>
<table id="tablaPorEntregar">
<caption style="font-size:25px;text-decoration: underline; margin: 0 0 6px">Pedidos</caption>
			
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
			ArrayList<Pedido> listPed = ped.getAll(session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
			for(Pedido l: listPed){%>
				<tr class="collapse">
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
				ArrayList<LineaPedido> listLinea = lpd.getAll(Integer.toString(l.getNroPedido()));
				
				for(LineaPedido l2: listLinea){%>
				<tr class="comun">
					<td><input type="checkbox" name="entregado" id="entregado" class="entregado" > Entregado</td>
					<td colspan="2"> <%= l2.getCant() %> <%=l2.getProd().getNombre() %> </td>
					<!-- <td> </td> -->
					<td></td>
					<td></td>
				<!-- 	<select class="sele" id="sele" name="sele" >
					<option>
					</option>
					<option>
					Entregado
					</option>
					</select> -->
					
				</tr>
		
				<%}%>
			<%}%>

</table>
<input type="hidden" id="aux" name="aux" >
</form>
</div>
<script>
$(document).ready(function(){
	$('.collapse').click(function() { 
			$(this).nextUntil('tr.collapse').slideToggle(10);
					}	)

					$('input:checkbox').change(function () {
						//var $row= $(this).closest('tr .collapse');
						var $row= $(this).find('tr .collapse');
						//alert($row.find('.colClass').text());
		
						
					 });
	
	$(".btnEntregar").click(function() {
		 
	    var $row = $(this).closest("tr");    // Find the row
	    var $text = $row.find(".colClass").text(); // Find the text
	    if(confirm("Entregar Pedido " + $text + "?")){
		    $('#aux').val($row.find(".colClass").text());

	    	return true;
	    }
	    else return false;
	 	
	});
	
})




</script>

</body>
</html>