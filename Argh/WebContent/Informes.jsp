<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="container">

<form action="InformesServlet" method="get" class="formInformes">
<button class="btnAgregar" type="submit" value="Productos">Resumen Productos</button>
<button class="btnAgregar" type="submit" value="Mozos">Mozos</button>

<br>
<br>
<button class="btnAgregar" type="submit" value="Pedidos">Pedidos Entregados</button>
<button class="btnAgregar" type="submit" value="Mesas">Mesas</button>


<input type="hidden" name="aux" id="aux">




</form>
</div>
<script type="text/javascript">
$(".btnAgregar").click(function() { 
	
 $('#aux').val($(this).val());

});

</script>
</body>
</html>