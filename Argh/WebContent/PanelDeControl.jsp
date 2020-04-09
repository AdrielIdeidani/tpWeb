<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.script.*"%>
<!-- @page import="logic.ConexDb" -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Panel de Control</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
	<link rel="icon" type="image/png" href="Imagenes/icono.jpg" />
	<link href="Css/PanelDeControl.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet"> -->
		
</head>
<body>

	<div id="abuelo">

	
		<div id="padre">
	<!-- 		<div id="Header">
				<div Style="float: left; 
							position: absolute">
				<h1 id="PanelTitulo">
					PANEL DE CONTROL ARGH</h1>
				</div>
				<div id="PanelUsuario" style= "float: right">
				Usuario: "Unknown"
				<select >
					<option Onclick="redirigir(perfil)">Perfíl</option>
					<option OnClick="CerrarSesion()">Cerrar Sesión</option>			
				</select>
				</div>
			</div> -->
			
			<div id="ContenedorPrincipal">
				<div id="contenedorBotones">
					<img alt="Bandera" src="Imagenes/BanderaLibano.jpg" id="banderaLibano">
					<a href="Eventos.jsp" target="iframeprincipal" style="width:100%; height:100%;">
						<button class="BTNPANELEvento"  >Eventos</button>
					</a>
					<a href="Productos.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Productos</button>
					</a>
					  <a href="MesasYMozos.jsp" target="iframeprincipal" >	
						<button class="BTNPANEL" >Mesas Y Mozos</button>
					</a>
	<!-- 			<div class="w3-dropdown-hover">
  					<button class="BTNPANEL">Pedidos</button>
 					 <div class="w3-dropdown-content w3-bar-block w3-border">
   					 <a href="#" class="w3-bar-item w3-button">Link 1</a>
   					 <a href="#" class="w3-bar-item w3-button">Link 2</a>
   					 <a href="#" class="w3-bar-item w3-button">Link 3</a>
 					 </div>
				</div>
				 -->
<div class="dropdown">
  <button class="dropbtn">Pedidos</button>
  <div class="dropdown-content">
   <a href="AgregarPedidos.jsp"  target="iframeprincipal">Agregar</a>
   <a href="PedidosPorEntregar.jsp"  target="iframeprincipal">Por Entregar</a>
    <a href="ProductosPorEntregar.jsp" target="iframeprincipal">Productos Faltan Entregar</a>
  </div>
</div>

				<!-- 	<a target="iframeprincipal"> href="Pedidos.jsp" 
						<button class="BTNPANEL" id="btnPedidos" onclick="mostrarPedidos()">Pedidos +</button>
					</a>
					
					<div id="opcionesPedidos" style="display:none">
					
					<a href="AgregarPedidos.jsp"  target="iframeprincipal">
						<button class="pedidos" >Agregar Pedido</button>
					</a>
					<a href="PedidosPorEntregar.jsp"  target="iframeprincipal">
						<button class="pedidos" >Ver Pedidos por Entregar</button>
					</a>
					
					</div> -->
					<a href="Informes.jsp"  target="iframeprincipal">
						<button class="BTNPANEL" >Reportes</button>
					</a>
					<form id="form1" method="post" action="InicioServlet">
					<button class="BTNPANEL">Cerrar Sesion</button>
					</form>
					
					<!-- <a href="Reservas.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Reservas</button>
					</a>
					<a href="Usuarios.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Usuarios</button>
					</a> -->
				</div>
				<div id="Pantalla">
					<iframe name="iframeprincipal" id="iframeprincipal" src="Welcome.jsp">
						<p>Este navegador no soparta iframes, intente visitar el sitio con otro navegador.</p>
					</iframe>
				</div>
			</div>
			
		<!-- 	<div id="footer">
				<p>Copyright ©. All rights reserved.</p>
			</div> -->
		</div>
	</div>		
	<script>
	
$( document ).ready(function() {
	
	//$(".BTNPANEL").attr("disabled", true);
	//$(".BTNPANEL").attr("disabled", false).css('opacity',0.5);

/* 	if ( ${sessionScope.activado }!== null){
		$(".BTNPANEL").attr("disabled", false).css('opacity',1);

		
	}
	else {
		$(".BTNPANEL").attr("disabled", true);
	
	$(".BTNPANEL").attr("disabled", false).css('opacity',0.5);
	} */
});

	</script>
</body>
</html>