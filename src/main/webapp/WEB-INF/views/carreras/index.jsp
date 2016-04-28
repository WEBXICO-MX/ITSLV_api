<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Carreras | Index</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h3>Carreras</h3>
	<c:if test="${!empty listCarrera}">
		<h4>
			<a href="<c:url value='/carreras/new' />">New Carrera</a>
		</h4>
		<h5>
			<a href="<c:url value='/' />">Back</a>
		</h5>
		<table class="table tg">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>División</th>
				<th>Fecha de registro</th>
				<th>Fecha de modificación</th>
				<th>Activo</th>
				<th colspan="2">Operaciones</th>
			</tr>
			<c:forEach items="${listCarrera}" var="carrera">
				<tr>
					<td>${carrera.id}</td>
					<td>${carrera.nombre}</td>
					<td>${carrera.division_id.nombre}</td>
					<td>${carrera.fecha_registro}</td>
					<td>${carrera.fecha_modificacion}</td>
					<td><c:choose>
							<c:when test="${carrera.activo}">Si</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose></td>
					<td><a href="<c:url value='/carreras/${carrera.id}/edit' />">Edit</a></td>
					<td><a
						href="<c:url value='/carreras/${carrera.id}/destroy' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<h4>
		<a href="<c:url value='/carreras/new' />">New Carrera</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
</body>
</html>