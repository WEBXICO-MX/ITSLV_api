<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Directorio | Create</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h1>Add a Directorio</h1>

	<c:url var="addAction" value="/directorios/create"></c:url>

	<form:form action="${addAction}" commandName="directorio">
		<table>
			<c:if test="${!empty directorio.nombre}">
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
				<td><form:input path="nombre" size="35" maxlength="50" /></td>
			</tr>
			<tr>
				<td><form:label path="area_id">
						<spring:message text="Area" />
					</form:label></td>
				<td><form:select path="area_id.id">
						<option value="-1">----- SELECCIONE UNA OPCIÓN -----</option>
						<c:forEach items="${listArea}" var="area">
							<option value="${area.id}">${area.nombre}</option>
						</c:forEach>
					</form:select></td>
			</tr>
			<tr>
				<td><form:label path="puesto">
						<spring:message text="Puesto" />
					</form:label></td>
				<td><form:input path="puesto" size="35" maxlength="50" /></td>
			</tr>
			<tr>
				<td><form:label path="tel">
						<spring:message text="Teléfono" />
					</form:label></td>
				<td><form:input path="tel" size="15" maxlength="15" /></td>
			</tr>
			<tr>
				<td><form:label path="email">
						<spring:message text="Email" />
					</form:label></td>
				<td><form:input path="email" size="35" maxlength="50" /></td>
			</tr>
			<tr>
				<td><form:label path="img">
						<spring:message text="URL imagen" />
					</form:label></td>
				<td><form:input path="img" size="35" maxlength="100" /></td>
			</tr>
			<tr>
				<td colspan="2">
				   <form:hidden path="fecha_registro" size="20" value="${date}" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty directorio.nombre}">
						<input type="submit" value="<spring:message text="Edit"/>" />
					</c:if> <c:if test="${empty directorio.nombre}">
						<input type="submit" value="<spring:message text="Add"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<h5>
		<a href="<c:url value='/directorios' />">Back</a>
	</h5>
</body>
</html>