<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Directorios | Index</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h3>Directorio</h3>
	<c:if test="${!empty listDirectorio}">
		<h4>
			<a href="<c:url value='/directorios/new' />">New Directorio</a>
		</h4>
		<h5>
			<a href="<c:url value='/home' />">Back</a>
		</h5>
		<table class="table tg">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Área</th>
				<th>Puesto</th>
				<th>Tel</th>
				<th>Email</th>
				<th>Imagen</th>
				<th>Fecha de registro</th>
				<th>Fecha de modificación</th>
				<th>División</th>
				<th>Activo</th>
				<th colspan="2">Operaciones</th>
			</tr>
			<c:forEach items="${listDirectorio}" var="directorio">
				<tr>
					<td>${directorio.id}</td>
					<td>${directorio.nombre}</td>
					<td>${directorio.area_id.nombre}</td>
					<td>${directorio.puesto}</td>
					<td>${directorio.tel}</td>
					<td>${directorio.email}</td>
					<td>
					<c:choose>
							<c:when test="${directorio.img eq \"\"}">Sin imagen</c:when>
							<c:otherwise>
							<a href="javascript:window.open('${directorio.img}','_blank','toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=200,height=200')" target="_blank">Imagen</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${directorio.fecha_registro}</td>
					<td>${directorio.fecha_modificacion}</td>
					<td><c:choose>
							<c:when test="${directorio.activo}">Si</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</td>
					<td><a
						href="<c:url value='/directorios/${directorio.id}/edit' />">Edit</a></td>
					<td><a
						href="<c:url value='/directorios/${directorio.id}/destroy' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<h4>
		<a href="<c:url value='/directorios/new' />">New Directorio</a>
	</h4>
	<h5>
		<a href="<c:url value='/home' />">Back</a>
	</h5>
</body>
</html>