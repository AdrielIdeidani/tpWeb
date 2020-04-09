<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Argentina al Hilo</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/esm/popper-utils.js" ></script>
 
<link href="Css/Inicio.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.4.0/bootbox.min.js"></script>

</head>
<body>
<div id="contenedor1" >
	<h1>INICIAR SESIÓN</h1>
	<form id="form1" method="get" action="InicioServlet">
	<input type="text" name="usuario" id="usuario" placeholder="Nombre de Usuario" />
	<hr>
	<input type="password" name="contra" id="contra" placeholder="Contraseña"/>
	<hr>
	<button class="login" type="submit" >Iniciar Sesión </button>
	<br>
	<!-- <button class="login" onClick="Registrar()"/>Registrarse</button><br> -->
	<!-- <p>Olvidó su clave?</p> -->
	</form>
</div>


<script>
$(document).ready(function(){
	
	//var done = false;
	
	const queryString = window.location.search;

	const urlParams = new URLSearchParams(queryString);

	const page_type = urlParams.get('control');
	
	if(page_type!==null){
		
		
	
		bootbox.alert({
		    size: "medium",
		    title: "ERROR!",
		    message: page_type,
		    className: "bootboxError" //No Funciona
		     
		})
	}
})
</script>
</body>
</html>