<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Contactos | Create</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h1>Add a Contactos</h1>

	<c:url var="addAction" value="/contactos/create"></c:url>

	<form:form action="${addAction}" commandName="contacto">
		<table>
			<c:if test="${!empty contacto.nombre}">
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
				<td><form:input path="nombre" /></td>
			</tr>
			<tr>
				<td><form:label path="contenido">
						<spring:message text="Contenido" />
					</form:label></td>
				<td><form:textarea path="contenido"  cols="80" rows="25"/></td>
			</tr>
			<tr>
				<td><form:label path="fecha_registro">
						<spring:message text="Fecha de registro" />
					</form:label></td>
				<td><form:input path="fecha_registro" type="date" /></td>
			</tr>
			<tr>
				<td><form:label path="fecha_modificacion">
						<spring:message text="Fecha de modificacion" />
					</form:label></td>
				<td><form:input path="fecha_modificacion" type="date" /></td>
			</tr>
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty contacto.nombre}">
						<input type="submit"
							value="<spring:message text="Edit Contacto"/>" />
					</c:if> <c:if test="${empty contacto.nombre}">
						<input type="submit" value="<spring:message text="Add Contacto"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<h5>
		<a href="<c:url value='/contactos' />">Back</a>
	</h5>
</body>
</html>