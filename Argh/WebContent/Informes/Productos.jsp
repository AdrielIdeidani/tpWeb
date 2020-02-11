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
<link href="Informes.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div>
<table id="mytable">
		
			<thead>
			<tr>
			<th></th>
			<th></th>
			<th></th>
			<th colspan="3">Stock</th>
			</tr>
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
			System.out.println("Llega a productos Informe");
			ProductosData pd = new ProductosData(); 
			ArrayList<Producto> list = pd.getAll(session.getAttribute("activado").toString()); //request.getAttribute("activado").toString()
			for(Producto l: list){ System.out.println("Entra al for");%>
			<tr>
					<td class="colClass"><%= Integer.toString(l.getId())%></td>
					<td><%=l.getNombre()%></td>
					<td><%= l.getPrecio()%></td>
					<td><%= l.getStockIni()%></td>
					<td><%= l.getVendidos()%></td>
					 <td><%= l.getVendidos() * l.getPrecio() %> </td>
					
				</tr>			
			
			
			<%}%>

</table>
</div>
</body>
</html>