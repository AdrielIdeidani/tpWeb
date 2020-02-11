<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.MesasData" %>
<%@ page import="entities.Mesas" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mesas</title>
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
				<th>Mesa</th>
				<th>Vendido</th>
				</tr>
				</thead>
				
				<% 	MesasData md= new MesasData();
			ArrayList <Mesas> list = md.getAll(session.getAttribute("activado").toString());

			for(Mesas l : list){%>
			<tr>
				<td><%=l.getNroMesa()%></td>
				<td><%= md.getVendidos(l.getNroMesa(),Integer.parseInt(session.getAttribute("activado").toString())) %>
			
			
			
			<%} %>
		

</body>
</html>