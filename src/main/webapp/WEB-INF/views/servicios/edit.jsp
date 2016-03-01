<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Servicio | Edit</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h1>Edit a Servicio </h1>

	<c:url var="addAction" value="/servicios/create"></c:url>

	<form:form action="${addAction}" commandName="servicio">
		<table>
			<c:if test="${!empty servicio.nombre}">
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
				<td><form:input path="nombre"  size="30" maxlength="50"/></td>
			</tr>
			<tr>
				<td><form:label path="img">
						<spring:message text="URL imagen" />
					</form:label></td>
				<td><form:input path="img" size="35" maxlength="100"/></td>
			</tr>
			<tr>
				<td><form:label path="link">
						<spring:message text="Link" />
					</form:label></td>
				<td><form:input path="link" size="35" maxlength="100" /></td>
			</tr>
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty servicio.nombre}">
						<input type="submit"
							value="<spring:message text="Edit Servicio"/>" />
					</c:if> <c:if test="${empty servicio.nombre}">
						<input type="submit"
							value="<spring:message text="Add Servicio"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<h5>
		<a href="<c:url value='/servicios' />">Back</a>
	</h5>
</body>
</html>