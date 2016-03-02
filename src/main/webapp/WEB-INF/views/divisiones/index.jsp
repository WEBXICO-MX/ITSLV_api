<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Divisiones | Index</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h3>Divisiones</h3>
	<h4>
		<a href="<c:url value='/divisiones/new' />">New Division</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
	<c:if test="${!empty listDivision}">
		<table class="table tg">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Fecha de registro</th>
				<th>Fecha de modificacion</th>
				<th>Activo</th>
				<th colspan="2">Operaciones</th>
			</tr>
			<c:forEach items="${listDivision}" var="division">
				<tr>
					<td>${division.id}</td>
					<td>${division.nombre}</td>
					<td>${division.fecha_registro}</td>
					<td>${division.fecha_modificacion}</td>
					<td><c:choose>
							<c:when test="${division.activo}">Si</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose></td>
					<td><a
						href="<c:url value='/divisiones/${division.id}/edit' />">Edit</a></td>
					<td><a
						href="<c:url value='/divisiones/${division.id}/destroy' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<h4>
		<a href="<c:url value='/divisiones/new' />">New Division</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
</body>
</html>