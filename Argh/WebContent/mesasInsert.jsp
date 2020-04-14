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
<link href="Css/PageInPanel.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
</head>

<body>
	<div id="div1" class="form">
		<h2 style="color:black; text-align:center; fonto-size:17px;">Agregar Mesa</h2>
		<form class="formInsert" action="MesasYMozosServlet" method="post" >
	
		 
		    <!--  de ambos imput borre los id= -->
		   		   
		    <%
	    	String idEventoActivo= session.getAttribute("activado").toString();

		      {
				%>
				
		
		   
		   
		    
		   
		    	
		    
		   <label for="nombre">  Capacidad de la mesa:  </label>
	    	<input type="number"  name="capacidad" min="1" >
	    	<br>	  
	    	<input type="submit" value="Añadir" class="btnAgregar">
			<input type="hidden" name="tabla" value="Mesa" > 
			<input type='hidden' name='auction' value='Insert'> 
		   
		   <% }
		    			
		    %> 



		    
		   
		</form>
		<a href="MesasYMozos.jsp"><button>Volver</button></a>
	</div>
<script>


</script>
</body>


</html>