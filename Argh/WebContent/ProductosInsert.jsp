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
%>

		    	<label for='nombre'>  Nombre:  </label>
		    	<input type='text'  name='nombre' value=<%=nombre %>>
		    	<label for='precio'>  Precio:  </label>
		    	<input type='number'   id='precio' name='precio' value=<%= precio%>>
		    	<label for='stock'>  Stock:  </label>
		    	<input type='number' id='stock' name='stock' value=<%=stockIni %>>"
			    <input type='submit' value='Modificar'>
				<input type='hidden' name='auction' value='Modificar' >
				<input type='hidden' name='id' value=<%=request.getParameter("id") %>> 
				<input type='hidden' name='idEventoActivo' value=<%= request.getParameter("idEventoActivo")%>> 
<%				}
	
		  else { %>
		    	
			<label for='nombre'>  Nombre:  </label>
		   <input type='text'  name='nombre' value=''>
		    <label for='precio'>  Precio:  </label>
		    <input type='number'   id='precio' name='precio' value=''>
		    <label for='stock'>  Stock:  </label>
		    <input type='number' id='stock' name='stock' value='' width='10'>
			<input type='submit' value='Agregar'>
			<input type='hidden' name='auction' value='Insert' >
		    
		    <%} %>



		    
		   
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