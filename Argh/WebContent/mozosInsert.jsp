<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Mozo</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
 <link href="Css/form.css" type="text/css" rel="stylesheet" />
  
</head>

<body>
	<div id="div1" class="form">
		<h2>Agregar Mozo</h2>
		<form class="formInsert" action="MesasYMozosServlet" method="post" >
	
		 
		    <!--  de ambos imput borre los id= -->
		   		   
		    <%
		    	String idEventoActivo= session.getAttribute("activado").toString();
		      String nombre = request.getParameter("nombre");
		    if (nombre!=null){
			    String apellido = request.getParameter("apellido");
		    	out.println("<label for='nombre'>  Nombre:  </label>");
		    	out.println(" <input type='text'  name='nombre' value="+nombre+" >" );
				
		    	out.println("<label for='apellido'>  Apellido:  </label>");
		    	out.println("<input type='text'   id='apellido' name='apellido' value="+apellido + " >");	
		    	out.println("<input type='submit' value='Añadir'>");
				out.println("<input type='hidden' name='tabla' value='Mozo' >"); 
				out.println("<input type='hidden' name='auction' value='Modificar' >"); 
	

		    }
		    else {	//Insert
		    	
		    
		    out.println("<label for='nombre'>  Nombre:  </label>");
	    	out.println(" <input type='text'  name='nombre' value='' >" );
			
	    	out.println("<label for='apellido'>  Apellido:  </label>");
	    	out.println("<input type='text'   id='apellido' name='apellido' >");	
	    	out.println("<input type='submit' value='Añadir'>");
			out.println("<input type='hidden' name='tabla' value='Mozo' >"); 
			out.println("<input type='hidden' name='auction' value='Insert' >"); 
		    }
			out.println("<input type='hidden' name='idEventoActivo' value="+idEventoActivo+" >"); 



%>
		    
		   
		</form>
		<a href="MesasYMozos.jsp"><button>Volver</button></a>
	</div>
<script>


</script>
</body>


</html>