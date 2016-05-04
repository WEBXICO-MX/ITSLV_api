<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url	value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"	var="bootstrapCSS" />
<spring:url	value="/resources/bower_components/jquery/dist/jquery.min.js"	var="jquery" />
<spring:url	value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"	var="bootstrap" />
<!DOCTYPE html>
<html lang="es">
<head>
<title>ITSLV &#124; Instituto Tecnológico  Superior de Villa la Venta</title>
<link href="${bootstrapCSS}" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center">ITSLV &#124; Instituto Tecnológico  Superior de Villa la Venta</h2>
				<h1>
					<span class="glyphicon glyphicon-user"></span>&nbsp;
					${sessionScope.nombre}
				</h1>
				<a href="<c:url value='/logout' />"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;CERRAR	SESIÓN</a><br/>
				<p class="text-center">The time on the server is ${serverTime}.</p>
				<br />
			</div>
			<div class="col-md-12">
				<table style="width: 50%; margin: 0 auto; text-align: center">
					<thead>
						<tr>
							<td><h2>Catálogos</h2></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="<c:url value='/actividadesuniversitarias' />">Actividades Universitarias</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/usuarios' />">Usuarios</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/servicios' />">Servicios</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/areas' />">Áreas</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/contactos' />">Contactos</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/divisiones' />">Divisiones</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/carreras' />">Carreras</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/materias' />">Materias</a></td>
						</tr>
						<tr>
							<td><a href="<c:url value='/directorios' />">Directorio</a></td>
						</tr>
					</tbody>
				</table>
				<br />
				<h3 class="text-center">Powered by Spring MVC 4 & Hibernate 5</h3>
			</div>
		</div>
	</div>
</body>
</html>
