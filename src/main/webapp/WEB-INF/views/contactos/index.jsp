<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Contactos | Index</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h3>Contactos</h3>
	<h4>
		<a href="<c:url value='/contactos/new' />">New Contacto</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
	<c:if test="${!empty listContacto}">
		<table class="table tg">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Contenido</th>
				<th>Fecha de registro</th>
				<th>Fecha de modificacion</th>
				<th>Activo</th>
				<th colspan="2">Operaciones</th>
			</tr>
			<c:forEach items="${listContacto}" var="contacto">
				<tr>
					<td>${contacto.id}</td>
					<td>${contacto.nombre}</td>
					<td>${contacto.contenido}</td>
					<td>${contacto.fecha_registro}</td>
					<td>${contacto.fecha_modificacion}</td>
					<td><c:choose>
							<c:when test="${contacto.activo}">Si</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose></td>
					<td><a href="<c:url value='/contactos/${contacto.id}/edit' />">Edit</a></td>
					<td><a
						href="<c:url value='/contactos/${contacto.id}/destroy' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<h4>
		<a href="<c:url value='/contactos/new' />">New Contacto</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
</body>
</html>