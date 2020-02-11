<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.MozosData" %>
<%@ page import="entities.Mozo" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mozos</title>
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
			<th>Id</th>
			<th>Nombre y Apellido </th>
			<th>Total vendido</th>
			</tr>
			</thead>
			<%
			MozosData md= new MozosData();
			ArrayList <Mozo> list = md.getAll(session.getAttribute("activado").toString());

			for(Mozo l : list){%>
		<tr>
		<td class="colClass"><%= Integer.toString(l.getId())%></td>
					<td><%=l.getNombre()+" "+ l.getApellido() %> </td>
					<td><%=md.getVendidos(l.getId(),Integer.parseInt(session.getAttribute("activado").toString())) %></td>
		</tr>
		


<%}%>
</body>
</html>