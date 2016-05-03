<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Materias | Index</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h3>Materias</h3>
	<c:if test="${!empty listMateria}">
		<h4>
			<a href="<c:url value='/materias/new' />">New Materia</a>
		</h4>
		<h5>
			<a href="<c:url value='/' />">Back</a>
		</h5>
		<table class="table tg">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Grado</th>
				<th>Carrera</th>
				<th>Fecha de registro</th>
				<th>Fecha de modificación</th>				
				<th>Activo</th>
				<th colspan="2">Operaciones</th>
			</tr>
			<c:forEach items="${listMateria}" var="materia">
				<tr>
					<td>${materia.id}</td>
					<td>${materia.nombre}</td>
					<td>${materia.grado}</td>
					<td>${materia.carrera_id.nombre}</td>
					<td>${materia.fecha_registro}</td>
					<td>${materia.fecha_modificacion}</td>
					<td><c:choose>
							<c:when test="${materia.activo}">Si</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose></td>
					<td><a href="<c:url value='/materias/${materia.id}/edit' />">Edit</a></td>
					<td><a
						href="<c:url value='/materias/${materia.id}/destroy' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<h4>
		<a href="<c:url value='/materias/new' />">New Materia</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
</body>
</html>