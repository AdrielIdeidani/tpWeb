<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList" %>
<%@ page import="database.PedidosData" %>
<%@ page import="database.LineasPedidoData" %>
<%@ page import="entities.LineaPedido" %>
<%@ page import="entities.Pedido" %>
<%@ page import="database.MozosData" %>
<%@ page import="entities.Mozo" %> 
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ped. Entregados</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script> 
<link href="../Css/PageInPanel.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
<div id="div1" class="form">
<table id="tablaPorEntregar">
<caption class="captionComun">Pedidos Entregados</caption>
	<thead>
	<tr>
	
	<th>Nro</th>
	<th>Mesa</th>
	<th>Mozo</th>
	<th>Total</th>
	<th>Hora</th>
	
	</tr>
	</thead>
	<% 
			PedidosData ped = new PedidosData(); 
			ArrayList<Pedido> listPed = ped.getEntregados(session.getAttribute("usuario").toString(),
					session.getAttribute("contra").toString(),session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()

			
			for(Pedido l: listPed){%>
			<tr class="collapse2">
				<td class="colClass"> <%= Integer.toString(l.getNroPedido())%> </td>
				<td>Mesa: <%=l.getIdMesa()%></td>
				<% MozosData md= new MozosData();
				Mozo mozo= md.getOne(session.getAttribute("usuario").toString(),
						session.getAttribute("contra").toString(),l.getIdMozo());
				
				%>
				
				<td><%= mozo.getApellido()  + ", " + mozo.getNombre()  %> </td> <!--  Aca tendria que traer el nombre y el apellido del mozo -->
				<td >$ <%= l.getTotal()%></td>
				<td><%=l.getHoraEntrega() %></td>
<%-- 				<td><button type="submit" id="btnEntregar" class="btnEntregar" name="btnEntregar"  value="<%= Integer.toString(l.getNroPedido())%>">Entregar</button>
 --%>				
 				
 	</tr>		
			
			<%
			LineasPedidoData lpd= new LineasPedidoData();
			ArrayList<LineaPedido> listLinea = lpd.getAll(session.getAttribute("usuario").toString(),
					session.getAttribute("contra").toString(),Integer.toString(l.getNroPedido()));
			
			for(LineaPedido l2: listLinea){%>
			<tr class="comun">
			<td></td>
			
			<td colspan="2"> <%= l2.getCant() %> <%=l2.getProd().getNombre() %> </td>
				<td>$<%=l2.getCant() * l2.getProd().getPrecio()%></td>
				<td>Precio <%= l2.getProd().getPrecio() %> </td>
			</tr>
	
			<%}%> 
		<%}%>
		</table>
</div>

<script>
$(document).ready(function(){
	$('.collapse2').click(function() { 
			$(this).nextUntil('tr.collapse2').slideToggle(10);
					}	)

	
	
	
})
</script>

</body>
</html>