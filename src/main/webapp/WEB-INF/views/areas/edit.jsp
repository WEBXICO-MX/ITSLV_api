<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Áreas | Edit</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h1>Edit a Áreas</h1>

	<c:url var="addAction" value="/areas/create"></c:url>

	<form:form action="${addAction}" commandName="area">
		<table>
			<c:if test="${!empty area.nombre}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="nombre">
						<spring:message text="Nombre" />
					</form:label></td>
				<td><form:input path="nombre" size="50" maxlength="50" /></td>
			</tr>
			<tr>
				<td colspan="2">
				   <form:hidden path="fecha_registro" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
				  <form:hidden path="fecha_modificacion" size="20" value="${date}" readonly="true" />
				</td>
			</tr>
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty area.nombre}">
						<input type="submit" value="<spring:message text="Edit Área"/>" />
					</c:if> <c:if test="${empty area.nombre}">
						<input type="submit" value="<spring:message text="Add Área"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<h5>
		<a href="<c:url value='/areas' />">Back</a>
	</h5>
</body>
</html>