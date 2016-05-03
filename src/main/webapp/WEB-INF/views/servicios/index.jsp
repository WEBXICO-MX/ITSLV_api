<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Servicios | Index</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h3>Servicios</h3>
	<h4>
		<a href="<c:url value='/servicios/new' />">New Servicio</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
	<c:if test="${!empty listServicio}">
		<table class="table tg">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
				<th>Imagen</th>
				<th>Link</th>
				<th>Activo</th>
				<th colspan="2">Operaciones</th>
			</tr>
			<c:forEach items="${listServicio}" var="servicio">
				<tr>
					<td>${servicio.id}</td>
					<td>${servicio.nombre}</td>
					<td>
					  <c:choose>
							<c:when test="${servicio.img eq \"\"}">Sin imagen</c:when>
							<c:otherwise>
							  <a href="javascript:window.open('${servicio.img}','_blank','toolbar=no,scrollbars=no,resizable=no,top=500,left=500,width=200,height=200')" target="_blank">Imagen</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td><a href="${servicio.link}" target="_blank">${servicio.link}</a></td>
					<td><c:choose>
							<c:when test="${servicio.activo}">Si</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</td>
					<td><a href="<c:url value='/servicios/${servicio.id}/edit' />">Edit</a></td>
					<td><a
						href="<c:url value='/servicios/${servicio.id}/destroy' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<h4>
		<a href="<c:url value='/servicios/new' />">New Servicio</a>
	</h4>
	<h5>
		<a href="<c:url value='/' />">Back</a>
	</h5>
</body>
</html>