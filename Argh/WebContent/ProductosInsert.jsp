<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Producto</title>
<link href="Css/form.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="div1" class="form">
		<h2>Agregar Producto para el evento <% out.println(session.getAttribute("activado").toString()); %></h2>
		<form class="formInsert" action="ProductosServlet" method="post" >
	
	  <%
		     	String nombre = request.getParameter("nombre");
				if (nombre!=null){
			    String precio = request.getParameter("precio");
			    String stockIni = request.getParameter("stockIni");


		    	out.println("<label for='nombre'>  Nombre:  </label>");
		    	out.println(" <input type='text'  name='nombre' value="+nombre+">" );
		    	out.println("<label for='precio'>  Precio:  </label>");
		    	out.println("<input type='number'   id='precio' name='precio' value="+precio+">");
		    	out.println("<label for='stock'>  Stock:  </label>");
		    	out.println("<input type='number' id='stock' name='stock' value="+ stockIni+" width='10'>");
			    out.println("<input type='submit' value='Modificar'>");
				out.println("<input type='hidden' name='auction' value='Modificar' >"); 
				out.println("<input type='hidden' name='id' value="+ request.getParameter("id")+ ">"); 
				out.println("<input type='hidden' name='idEventoActivo' value="+ request.getParameter("idEventoActivo")+ ">"); 
				}
	
		  else {
		    	
			out.println("<label for='nombre'>  Nombre:  </label>");
		    out.println(" <input type='text'  name='nombre' value=''>" );
		    out.println("<label for='precio'>  Precio:  </label>");
		    out.println("<input type='number'   id='precio' name='precio' value=''>");
		    out.println("<label for='stock'>  Stock:  </label>");
		    out.println("<input type='number' id='stock' name='stock' value='' width='10'>");
			out.println("<input type='submit' value='Agregar'>");
			out.println("<input type='hidden' name='auction' value='Insert' >"); 
		    } 


%>
		    
		   
		</form>
		<a href="Productos.jsp"><button>Volver</button></a>
	</div>

<script>
 $('#aux').val(${sessionScope.activado});
/* 
   <input id="input"
     oninput="valid(this)"
         type="text"> 
 
    function valid(elem) { 
            if (RegExp.test(elem.value)) { 
                val = elem.value; 
                el_down.innerHTML = "Typed Valid Character."; 
            } else { 
                elem.value = val; 
                el_down.innerHTML = "Typed Invalid Character."; 
            } 
 
 */

</script>
</body>
</html>