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
		
</head>
<body>

	<div id="abuelo">

	
		<div id="padre">

			
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

<div class="dropdown">
  <button class="dropbtn">Pedidos</button>
  <div class="dropdown-content">
   <a href="AgregarPedidos.jsp"  target="iframeprincipal">Agregar</a>
   <a href="PedidosPorEntregar.jsp"  target="iframeprincipal">Por Entregar</a>
    <a href="ProductosPorEntregar.jsp" target="iframeprincipal">Productos Por Entregar</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Informes</button>
  <div class="dropdown-content">
   <a href="Informes/Productos.jsp"  target="iframeprincipal">Productos</a>
   <a href="Informes/Pedidos.jsp"  target="iframeprincipal">Pedidos</a>
    <a href="Informes/Mesas.jsp" target="iframeprincipal">Mesas</a>
    <a href="Informes/Mozos.jsp" target="iframeprincipal">Mozos</a>
    
  </div>
</div>

					<form id="form1" method="post" action="InicioServlet">
					<button class="BTNPANEL">Cerrar Sesion</button>
					</form>
					

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
	


	</script>
</body>
</html>