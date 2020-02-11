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
 <link href="Css/form.css" type="text/css" rel="stylesheet" />
  
</head>

<body>
	<div id="div1" class="form">
		<h2>Agregar Evento</h2>
		<form class="formInsert" action="EventosServlet" method="post" >
	
		 
		    <!--  de ambos imput borre los id= -->
		   		   
		    <%
		      String nombre = request.getParameter("nombre");
		    if (nombre!=null){
			      String fecha = request.getParameter("fecha");
%>

		    	<label for='fecha'>  Fecha:  </label>
		    	<input type='date'  name='fecha' value=<%=fecha %> >
		    	<label for='nombre'>  Nombre del evento:  </label>
		    	<input type='text'   id='nombreEvento' name='nombreEvento' value=<%=nombre %>>
			    <input type='submit' value='Modificar'>
				<h2> Id del Evento a Modificar: <%= request.getParameter("id")%></h2>
				<input type='hidden' name='auction' value='Modificar' >
				<input type='hidden' name='id' value=<%= request.getParameter("id")%>>

		  <% }  else {%>  
		   
		    	
		    
		   <label for='fecha'>  Fecha:  </label>
	    	<input type='date'  name='fecha' value='' >
			
	    	<label for='nombre'>  Nombre del evento:  </label>
	    	<input type='text'   id='nombreEvento' name='nombreEvento' >
	    	<input type='submit' value='Añadir'>
			<input type='hidden' name='auction' value='Insert' >
		   <%} %> 



		    
		   
		</form>
		<a href="Eventos.jsp"><button >Volver</button></a>
	</div>
<script>


</script>
</body>


</html>