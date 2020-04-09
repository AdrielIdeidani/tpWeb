<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="database.PedidosData" %>
<%@ page import="database.LineasPedidoData" %>
<%@ page import="entities.LineaPedido" %>
<%@ page import="entities.Pedido" %>
<%@ page import="database.MozosData" %>
<%@ page import="entities.Mozo" %>
<%@ page import="entities.ProdPorEntregar" %>
<%@ page import="database.ProductosData" %>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Productos Por Entregar</title>
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
<h2 style="color:black; text-align:center; fonto-size:17px;"> Productos que faltan entregar</h2>
<table >
<!-- <caption style="font-size:25px;text-decoration: underline; margin: 0 0 6px">Pedidos</caption>
 -->			
			<thead style="width=70%">
			<tr>
				<th colspan="2">Producto</th>
				<th>Cantidad</th>
				<th colspan="3">Mesas y Mozo</th>
				
				
			</tr>
			</thead>
			<tbody>
			<% ProductosData pd = new ProductosData();
			ArrayList<ProdPorEntregar> listP = pd.getPorEntregar(session.getAttribute("usuario").toString(),
					session.getAttribute("contra").toString(),	session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
					for(ProdPorEntregar l: listP){
			%>
			
					<tr  > <!-- class="collapse" -->
					
					<td colspan="2" ><%= l.getNombre()%></td>
					
					<td><%=l.getCant() %></td>
					<td colspan="3"> <%=l.getMozoMesa()%></td>
			</tr>
			<%} %>
			</tbody>
			
</table>

</div>
</body>
</html>