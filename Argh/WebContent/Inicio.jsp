<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Argentina al Hilo</title>

<link href="Css/Inicio.css" rel="stylesheet" type="text/css"/>
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
	<p>Olvidó su clave?</p>
	</form>
</div>
<div id="contenedor2">
</div>

<script>

</script>
</body>
</html>