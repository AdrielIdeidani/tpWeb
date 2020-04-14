<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Evento</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link href="Css/PageInPanel.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
</head>

<body>
	<div id="div1" class="form">
		<h2 style="color:black; text-align:center; fonto-size:17px;">Agregar Evento</h2>
		<form class="formInsert" action="EventosServlet" method="post" >
	
		 
		    <!--  de ambos imput borre los id= -->
		   		   
		    <%
		      String nombre = request.getParameter("nombre");
		    if (nombre!=null){
			      String fecha = request.getParameter("fecha");
%>
				<label for='nombre'>  Nombre del evento:  </label>
		    	<input type='text'   id='nombreEvento' name='nombreEvento' value=<%=nombre %>>
		    	<br>
		    	<label for='fecha'>  Fecha:  </label>
		    	<input type='date'  name='fecha' value=<%=fecha %> >
		    	<br>
			    <input type='submit' value='Modificar'  class="btnAgregar">
				<input type='hidden' name='auction' value='Modificar' >
				<input type='hidden' name='id' value=<%= request.getParameter("id")%>>

		  <% }  else {%>  
		   
		    <input type='text'   id='nombreEvento' name='nombreEvento' placeholder="Nombre del Evento" >
		    <br>
		    <input type='date'  name='fecha' value='' >
	    	<br>
	    	<input type='submit' value='Añadir' class="btnAgregar">
			<input type='hidden' name='auction' value='Insert' >
		   <%} %> 



		    
		   
		</form>
		<a href="Eventos.jsp"><button class="btn btn-outline-dark" >Volver</button></a>
	</div>
<script>


</script>
</body>


</html>