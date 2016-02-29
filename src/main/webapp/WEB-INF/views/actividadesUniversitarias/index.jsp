<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Actividades Universitarias | Index</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h3>Actividades Universitarias</h3>
    <h4>
		<a href="<c:url value='/actividadesuniversitarias/new' />">New Actividade Universitaria</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
	<c:if test="${!empty listActividadUniversitaria}">
		<table class="table tg">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Texto previo</th>
				<th>Texto completo</th>
				<th>Imagen</th>
				<th>Link</th>
				<th>Fecha de registro</th>
				<th>Fecha de realizacion</th>
				<th>Fecha de modificacion</th>
				<th>Activo</th>
				<th colspan="2">Operaciones</th>
			</tr>
			<c:forEach items="${listActividadUniversitaria}" var="actividadUniversitaria">
				<tr>
					<td>${actividadUniversitaria.id}</td>
					<td>${actividadUniversitaria.nombre}</td>
					<td>${actividadUniversitaria.texto_previo}</td>
					<td>${actividadUniversitaria.texto_completo}</td>
					<td><img src="${actividadUniversitaria.img}" alt="${actividadUniversitaria.nombre}"/></td>
					<td>${actividadUniversitaria.link}</td>
					<td>${actividadUniversitaria.fecha_registro}</td>
					<td>${actividadUniversitaria.fecha_realizacion}</td>
					<td>${actividadUniversitaria.fecha_modificacion}</td>
					<td><c:choose>
							<c:when test="${actividadUniversitaria.activo}">Si</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
				    </td>
					<td><a
						href="<c:url value='/actividadesuniversitarias/${actividadUniversitaria.id}/edit' />">Edit</a></td>
					<td><a
						href="<c:url value='/actividadesuniversitarias/${actividadUniversitaria.id}/destroy' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<h4>
		<a href="<c:url value='/actividadesuniversitarias/new' />">New Actividad Universitaria</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
</body>
</html>