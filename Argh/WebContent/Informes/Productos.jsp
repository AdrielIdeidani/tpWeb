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
<link href="../Css/PageInPanel.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div>
<table id="mytable">
<caption class="captionComun">Resumen Productos</caption>
			<thead>
	
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Precio</th>
				<th>Stock Inicial</th>
				<th>Vendidos</th>
				<th>Recaudado</th>
			</tr>
			</thead>
			<% 
			float totalVendido=0;
			System.out.println("Llega a productos Informe");
			ProductosData pd = new ProductosData(); 
			ArrayList<Producto> list = pd.getAll(session.getAttribute("usuario").toString(),
					session.getAttribute("contra").toString(),session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
			for(Producto l: list){%>
			<tr>
					<td class="colClass"><%= Integer.toString(l.getId())%></td>
					<td><%=l.getNombre()%></td>
					<td><%= l.getPrecio()%></td>
					<td><%= l.getStockIni()%></td>
					<td><%= l.getVendidos()%></td>
					 <td><%= l.getVendidos() * l.getPrecio() %> </td>
					<% totalVendido+= l.getVendidos() * l.getPrecio();%>
				</tr>			
			
			
			<%}%>
<tr></tr>
<tr>
<td></td><td></td><td></td><td></td><td></td>
<td style="color:black;font-size:22px;">Total: $<%=totalVendido %></tr>

</table>


</div>
</body>
</html>