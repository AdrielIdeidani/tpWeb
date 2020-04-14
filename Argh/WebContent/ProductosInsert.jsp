<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Producto</title>
<!-- <link href="Css/form.css" type="text/css" rel="stylesheet" />
 --><link href="Css/PageInPanel.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
	<div id="div1" class="form">
		<h2 style="color:black; text-align:center; fonto-size:17px;">Agregar Producto</h2> 
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
		    	<input type='number'   id='precio' name='precio'  value=<%= precio%>>
		    	
		    	<label for='stock'>  Stock:  </label>
		    	<input type='number' id='stock' name='stock'  value=<%=stockIni %>>
		    	
			    <input type='submit' value='Modificar' class="btnAgregar">
				<input type='hidden' name='auction' value='Modificar' >
				<input type='hidden' name='id' value=<%=request.getParameter("id") %>> 
				 
<%				}
	
		  else { %>
		    	
		   <input type='text'  name='nombre' value='' placeholder="Nombre">
		   <br>
		    <input type='number'   id='precio' name='precio' value='' placeholder="Precio">
		    <br>
		    <input type='number' id='stock' name='stock'  value='' width='10' placeholder="Stock(min0)">
		    <br>
			<input type='submit' value='Agregar' class="btnAgregar">
			<input type='hidden' name='auction' value='Insert' >
		    
		    <%} %>



		    
		   
		</form>
		<a href="Productos.jsp" ><button >Volver</button></a>
	</div>

<script>
 
 
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