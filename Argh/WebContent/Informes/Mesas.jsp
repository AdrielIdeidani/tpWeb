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
<link href="../Css/PageInPanel.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div>
<table id="mytable">
		<caption class="captionComun">Mesas</caption>
			<thead>
			<tr>
				<th>Mesa</th>
				<th>Vendido</th>
				</tr>
				</thead>
				
				<% 	MesasData md= new MesasData();
			ArrayList <Mesas> list = md.getAll(session.getAttribute("usuario").toString(),
					session.getAttribute("contra").toString(),session.getAttribute("activado").toString());

			for(Mesas l : list){%>
			<tr>
				<td><%=l.getNroMesa()%></td>
				<td>$<%= md.getVendidos(session.getAttribute("usuario").toString(),
						session.getAttribute("contra").toString(),l.getNroMesa(),Integer.parseInt(session.getAttribute("activado").toString())) %>
			
			
			
			<%} %>
		
</td>
</tr>
</table>
</div>
</body>
</html>