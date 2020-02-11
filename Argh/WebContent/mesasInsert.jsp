<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Mesa</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
 <link href="Css/form.css" type="text/css" rel="stylesheet" />
  
</head>

<body>
	<div id="div1" class="form">
		<h2>Agregar Mesa</h2>
		<form class="formInsert" action="MesasYMozosServlet" method="post" >
	
		 
		    <!--  de ambos imput borre los id= -->
		   		   
		    <%
	    	String idEventoActivo= session.getAttribute("activado").toString();

		      String nombre = request.getParameter("nombre");
		    if (nombre!=null){
				%>
				
		    	<%-- <label for=fecha>  Fecha:  </label>
		    	<input type=date  name='fecha' value="+fecha+" >
		    	<label for=nombre>  Nombre del evento:  </label>
		    	<input type=text   id=nombreEvento name=nombreEvento' value="+nombre+" >
			    <input type='submit' value='Modificar'>
				<h2> Id del Evento a Modificar: <%= request.getParameter("id")%></h2>
				<input type='hidden' name='auction' value='Modificar'>
				<input type='hidden' name='id' value=<%=request.getParameter("id")%>>
				<input type='hidden' name='tabla' value='Mesa' > --%>

		   
		     <% }else {%>
		    
		   
		    	
		    
		   <label for="nombre">  Capacidad de la mesa:  </label>
	    	 <input type="number"  name="capacidad" min="1"  >
	      <!--	<label for="estado">  Estado:  </label>
	   	<select id="estado" name="estado">
	    	<option>Sin reserva</option>
	    	<option>Reservada</option>
	    	</select>
	    	<br>
	    	<br>
	    	<label for="observaciones">Observaciones:</label>
	    	<input type="text" name="observacion"> -->
	    	<input type="submit" value="Añadir">
			<input type="hidden" name="tabla" value="Mesa" > 
			<input type='hidden' name='auction' value='Insert'> 
		   
		   <% }
		    			out.println("<input type='hidden' name='idEventoActivo' value="+idEventoActivo+" >"); 
		    %> 



		    
		   
		</form>
		<a href="MesasYMozos.jsp"><button>Volver</button></a>
	</div>
<script>


</script>
</body>


</html>